-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local rtsetup, rt = pcall(require, "rust-tools")
if not rtsetup then
  return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gf", "<cmd>lspsaga lsp_finder<cr>", opts) -- show definition, references
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>lspsaga peek_definition<cr>", opts) -- see definition and make edits in window
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>lspsaga code_action<cr>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>lspsaga rename<cr>", opts) -- smart rename
  keymap.set("n", "<leader>d", "<cmd>lspsaga show_line_diagnostics<cr>", opts) -- show  diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>lspsaga show_cursor_diagnostics<cr>", opts) -- show diagnostics for cursor
  keymap.set("n", "[d", "<cmd>lspsaga diagnostic_jump_prev<cr>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "]d", "<cmd>lspsaga diagnostic_jump_next<cr>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "k", "<cmd>lspsaga hover_doc<cr>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>lsoutlinetoggle<cr>", opts) -- see outline on right hand side

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":typescriptrenamefile<cr>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":typescriptorganizeimports<cr>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":typescriptremoveunused<cr>") -- remove unused variables (not in youtube nvim video)
  end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- change the diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
for type, icon in pairs(signs) do
  local hl = "diagnosticsign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

-- configure typescript server with plugin
rt.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        inlayhints = { locationlinks = false },
      },
    },
  },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["sumneko_lua"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$vimruntime/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

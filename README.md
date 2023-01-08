# neovim-tutorial
**Tutorial Video Links: [Youtube](), [Bilibili]()**
# Catalog
### Part 1: [Vim Shortcuts](#part-1-vim-shortcuts)
### Part 2: [Neovim Setup](#part-2-neovim-setup)
### Part 3: [Neovim Language Server Protocol(LSP) Setup](#part-3-neovim-language-protocol-serverlsp-setup)
---
## Part 1: Vim Shortcuts
### Installation:
Open VScode, search ```Vim``` in ```Extensions```, and click install.
![imge](extension.png)

<br>
<br>

In the following keymappings, ```n``` stands for ```NORMAL``` mode, ```i``` stands for ```INSERT``` mode, ```v``` stands for ```VISUAL``` mode.

### Open and Close Files
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n``` | ```:w```     | Write(save) current buffer
| ```n``` | ```:q```     | Close current buffer  (would fail if you don't save first)
| ```n``` | ```:wq```    | Save and close current buffer
| ```n``` | ```:q!```     | Exit current buffer without saving
| ```n``` | ```:qa!```     | Exit all open buffers without saving
| ```n``` | ```:wqa```     | Save and exit all open buffers 



### Navigation
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```, ```v```     | ```h```     | Move left
| ```n```, ```v```     | ```j```     | Move down 
| ```n```, ```v```     | ```k```     | Move up 
| ```n```, ```v```     | ```l```     | Move right 
| ```n```, ```v```     | ```w```     | One word forward 
| ```n```, ```v```     | ```b```     | One word backward 
| ```n```, ```v```     | ```^```     | Beginning of line
| ```n```, ```v```     | ```$```     | End of line
| ```n```, ```v```     | ```gg```    | Beginning of file
| ```n```, ```v```     | ```G```     | End of file
| ```n```, ```v```     | ```{```     | One paragraph backward
| ```n```, ```v```     | ```}```     | One paragraph forward
| ```n```              | ```:[num-of-line]``` + ```Enter```     | Go to a specific line | 
| ```n```, ```v```     | ```/[search-item]``` + ```Enter``` + ```n```      | Find pattern and go to next match

### Enter ```INSERT``` Mode from ```NORMAL``` Mode
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```i```     | Insert before cursor |
| ```n```     | ```a```     | Append after cursor  |
| ```n```     | ```I```     | Insert at the beginning of the line |
| ```n```     | ```A```     | Append at the end of the line
| ```n```     | ```o```     | Insert to next line | 
| ```n```     | ```O```     | Insert to previous line | 
| ```n```     | ```c``` + ```[Navigation]```| Delete from before the cursor to ```[Navigation]``` and insert. Examples are as follow | 
| ```n```     | ```c``` + ```w```| Delete from before the cursor to end of current word and insert  | 
| ```n```     | ```c``` + ```i``` + ```w```| Delete current word and insert  | 
| ```n```     | ```c``` + ```$```| Delete from before the cursor to end of the line and insert |
| ```i```     | ```<Esc>```     | Go back to Normal Mode, remap to ```jk``` recommended |

### Edit in ```NORMAL``` Mode
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```dd``` | Delete(cut) current line | 
| ```n```     | ```d``` + ```[Number]``` + ```d```| Delete(cut) following ```[Number]``` of lines|
| ```n```     | ```d``` + ```[Navigation]```     | Delete(cut) from before the cursor to ```[Navigation]```, similar to ```c``` + ```[Navigation]``` above|
| ```n```     | ```yy``` | Yank(copy) current line | 
| ```n```     | ```y``` + ```[Number]``` + ```y```| Yank(copy) following ```[Number]``` of lines|
| ```n```     | ```y``` + ```[Navigation]```     | Yank(copy) from before the cursor to ```[Navigation]```, similar to ```c``` + ```[Navigation]``` above|
| ```n```     | ```p```     | Paste from what you delete or yank |
| ```n```     | ```x```     | Delete(cut) the character under the cursor|
| ```n```     | ```u```     | Undo changes |
| ```n```     | ```Ctrl```+```r```     | Redo changes |
| ```n```     | ```:%s/[foo]/[bar]/g```     | Find each occurrence of ```[foo]``` (in all lines), and replace it with ```[bar]```. More substitute commands [here](https://vim.fandom.com/wiki/Search_and_replace).|

### ```VISUAL``` mode shortcuts
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```v```     | Enter Visual Character Mode  |
| ```n```     | ```V```     | Enter Visual Line Mode  |
| ```n```     | ```Ctrl```+```v```| Enter Visual Block Mode  |
| ```v```     | ```<Esc>```| Exit Visual Mode, remap to ```jk``` recommended  |

### Vim settings under VSCode
1. Press ```Ctrl+Shift+p``` in VSCode
2. Find ```Preferences: Open User Settings (JSON)```, open ```settings.json```
3. Configure the file, all options are [here](https://github.com/VSCodeVim/Vim)
---

## Part 2: Neovim Setup
```
├── init.lua
├── lua
│   └── usr
│       ├── core
│       │   ├── colorscheme.lua
│       │   ├── keymaps.lua
│       │   └── options.lua
│       ├── plugins
│       │   ├── lsp
│       │   │   ├── lspconfig.lua
│       │   │   ├── lspsaga.lua
│       │   │   ├── mason.lua
│       │   │   └── null-ls.lua
│       │   ├── autopairs.lua
│       │   ├── comment.lua
│       │   ├── gitsigns.lua
│       │   ├── lualine.lua
│       │   ├── nvim-cmp.lua
│       │   ├── nvim-tree.lua
│       │   ├── telescope.lua
│       │   └── treesitter.lua
│       └── plugins-setup.lua
└── plugin
    └── packer_compiled.lua
```

**Pre-requisite:** Make sure you have installed [ripgrep]() and one of the [NerdFonts]().
1. **Package Manager:** [Packer]()
2. **Essentials:** [plenary]()
3. **Colorscheme:** [tokyonight]()
4. **File Explorer:**  [Nvim-tree](), [Telescope](), [Telescope-fzf]()
5. **Highlighting:** [tree-sitter]()
6. **Auto Completion:** [nvim-cmp](), [cmp-buffer](), [cmp-path](), [friendly-snippet](), [nvim-autopairs]()
7. **Comments:** [Comment]()
8. **Mode Status Bar**: [lualine]()
9. **Window Maximizer**: [vim-maximizer]()\
...
### Steps to install a new package
1. Add the package under Packer in ```lua/usr/plugins-setup.lua```, make sure it is installed before proceeding, type ```:PackerSync``` in ```plugins-setup.lua``` if not installed
2. Add a new file under ```lua/usr/plugins/```, or whatever folder structure you have, configure the package as you want
3. Import the package in ```init.lua```

### Keyboard Shortcuts I Use
These are the customized shortcuts **I configured**, which I use often. Feel free to map your own key mappings.
| Package     | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| General          |```<leader>sx```| Close current window | 
| ```Nvim-Tree```| ```<leader>e```| Tree Toggle| 
| ```Nvim-Tree```| ```o```| Open a folder or a file| 
| ```Nvim-Tree```| ```v```| Open another file to the right| 
| ```Telescope```| ```<leader>ff```| Find files in current working director | 
| ```Telescope```| ```<leader>fs```| Find string in current working directory | 
| ```Git Signs```| ```<leader>gc```| List all git commits |
| ```Git Signs```| ```<leader>gs```| List current changes per file with diff views| 
| ```Telescope, GitSigns```| ```Ctrl```+```c```| Close Telescope/GitSigns window while in ```NORMAL``` mode| 
| ```Vim-Maximizer```| ```<leader>sm```| Maximize current window the cursor is on| 




---
## Part 3: Neovim Language Protocol Server(LSP) Setup
Mason, lspsaga, null-ls
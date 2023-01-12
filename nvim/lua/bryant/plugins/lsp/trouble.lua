local t_status, trouble = pcall(require, "trouble")
if not t_status then
  return
end

trouble.setup()

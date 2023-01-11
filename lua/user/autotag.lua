local status_ok2, ntags = pcall(require, "nvim-ts-autotag")
if not status_ok2 then
  return
end

ntags.setup()

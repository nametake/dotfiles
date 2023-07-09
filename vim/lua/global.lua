if not table.unpack then
  --- @diagnostic disable-next-line: deprecated
  table.unpack = unpack
end

--- @diagnostic disable-next-line: lowercase-global
t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

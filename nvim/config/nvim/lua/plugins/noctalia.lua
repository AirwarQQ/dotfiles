local function load_noctalia()
  local ok, matugen = pcall(require, "matugen")

  if ok then
    matugen.setup()
  else
    -- fallback на случай, если Noctalia ещё не сгенерировала matugen.lua
    require("tokyonight").load()
  end
end

return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = load_noctalia,
    },
  },
}

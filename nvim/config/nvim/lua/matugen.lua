local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#171213",
    base01 = "#241e1f",
    base02 = "#2f2829",
    base03 = "#9e8c8f",

    -- Foreground tones
    base04 = "#d6c2c4",
    base05 = "#ece0e0",
    base06 = "#ece0e0",
    base07 = "#ece0e0",

    -- Accent colors
    base08 = "#ffb4ab",
    base09 = "#ecbe91",
    base0A = "#e4bdc3",
    base0B = "#ffb1c1",
    base0C = "#ecbe91",
    base0D = "#ffb1c1",
    base0E = "#e4bdc3",
    base0F = "#93000a",
  })
end

local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M

local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#121316",
    base01 = "#1f1f23",
    base02 = "#292a2d",
    base03 = "#8e9099",

    -- Foreground tones
    base04 = "#c4c6d0",
    base05 = "#e3e2e6",
    base06 = "#e3e2e6",
    base07 = "#e3e2e6",

    -- Accent colors
    base08 = "#ffb4ab",
    base09 = "#debcdf",
    base0A = "#bfc6dc",
    base0B = "#adc6ff",
    base0C = "#debcdf",
    base0D = "#adc6ff",
    base0E = "#bfc6dc",
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

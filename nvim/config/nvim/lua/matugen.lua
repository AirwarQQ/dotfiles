local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#0b0e14",
    base01 = "#1e222a",
    base02 = "#262c36",
    base03 = "#595f6a",

    -- Foreground tones
    base04 = "#8e959e",
    base05 = "#d1d1c7",
    base06 = "#d1d1c7",
    base07 = "#d1d1c7",

    -- Accent colors
    base08 = "#d95757",
    base09 = "#39bae6",
    base0A = "#aad94c",
    base0B = "#e6b450",
    base0C = "#8ed8f1",
    base0D = "#efcf8f",
    base0E = "#cde996",
    base0F = "#700e0e",
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

local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#151316",
    base01 = "#211f22",
    base02 = "#2c292d",
    base03 = "#958e98",

    -- Foreground tones
    base04 = "#ccc4cf",
    base05 = "#e7e1e5",
    base06 = "#e7e1e5",
    base07 = "#e7e1e5",

    -- Accent colors
    base08 = "#ffb4ab",
    base09 = "#f2b7c0",
    base0A = "#cfc1da",
    base0B = "#dab9ff",
    base0C = "#f2b7c0",
    base0D = "#dab9ff",
    base0E = "#cfc1da",
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

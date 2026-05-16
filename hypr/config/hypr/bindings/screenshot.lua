-- SCREENSHOTS

local screenshot_region = "hyprshot -m region" -- выделить область, сохранить + копировать
local screenshot_output = "hyprshot -m output" -- весь экран сохранить
local screenshot_freeze = "hyprshot -m window --freeze" -- активное окно с заморозкой
local screenshot_region_clipboard = "hyprshot -m region --clipboard-only" -- только в буфер
local screenshot_region_path = "hyprshot -m region -o ~/Documents/specifs" -- в нестандартную папку
local screenshot_region_satty = "hyprshot -m region --raw | satty --copy-command wl-copy --early-exit -f - "

hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot_region_clipboard))
hl.bind(MAINMOD .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd(screenshot_region_satty))

local launch_or_focus = {}

function launch_or_focus.app(opts)
	return function()
		local windows = hl.get_windows()

		for _, win in ipairs(windows) do
			if win.class == opts.class then
				hl.dispatch(hl.dsp.focus({ window = "class:" .. opts.class }))
				return
			end
		end

		hl.dispatch(hl.dsp.exec_cmd(opts.cmd))
	end
end

return launch_or_focus

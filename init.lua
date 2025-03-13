require("abx")

local function start_tmuxinator()
	local handle = io.popen("tmuxinator list -n | tail -n +2")
	if handle then
		local result = handle:read("*a")
		handle:close()
		local projects = vim.split(result, "\n", { trimempty = true })

		if #projects == 0 then
			vim.notify("No tmuxinator projects found!", vim.log.levels.WARN)
			return
		end

		require("fzf-lua").fzf_exec(projects, {
			prompt = "Tmuxinator > ",
			actions = {
				["default"] = function(selected)
					local session = selected[1]

					-- Close Neovim before switching
					vim.cmd("qa!")

					-- Start tmuxinator session
					os.execute("tmuxinator start " .. session .. " --no-attach")

					-- Switch to the selected session
					if os.getenv("TMUX") then
						os.execute("tmux switch-client -t " .. session)
					else
						os.execute("tmux attach-session -t " .. session)
					end
				end,
			},
		})
	end
end

vim.api.nvim_create_user_command("Mux", start_tmuxinator, {})

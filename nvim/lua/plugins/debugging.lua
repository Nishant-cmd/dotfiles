return {
	"mfussenegger/nvim-dap",

	dependencies = {

		"rcarriga/nvim-dap-ui",
"nvim-neotest/nvim-nio",
 "firefox-devtools/vscode-firefox-debug"

	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")
    
    --Need to add something to run firefox debugg;
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>dt", function()
			require("dap").toggle_breakpoint()
		end)

		vim.keymap.set("n", "<Leader>dc", function()
			require("dap").continue()
		end)


    -- local dap = require("dap")
dap.adapters.firefox = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '~/vscode-firefox-debug/dist/adapter.bundle.js'},
}

dap.configurations.typescript = {
  {  
  name = 'Debug with Firefox',
  type = 'firefox',
  request = 'launch',
  reAttach = true,
  url = 'http://localhost:3000',
  webRoot = '${workspaceFolder}',
  firefoxExecutable = '/usr/bin/firefox'
  }
}





	end,
}

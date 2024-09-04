return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				command = '/home/ns/Applications/codelldb/extension/adapter/codelldb',
				args = {"--port", "${port}"},
			}
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
		dap.configurations.cpp = dap.configurations.c;
		dap.configurations.rust = dap.configurations.c;

		local dapui = require("dapui")
		dapui.setup()
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
	end,

	keys = {
		{
			'<c-b>',
			function()
				require("dap").toggle_breakpoint()
			end,
			noremap = true,
			silent = true,
		},

		{
			'<F5>',
			function()
				require("dap").continue()
			end,
			noremap = true,
			silent = true,
		},
		{
			'F6',
			function()
				require('dap').run_last()
			end,
			noremap = true,
			silent = true,
		},
		{
			'<F4>',
			function()
				require("dap").disconnect({ terminateDebuggee = true })
			end,
			noremap = true,
			silent = true,
		},
		
		{
			'<F10>',
			function()
				require("dap").step_over()
			end,
			noremap = true,
			silent = true,
		},
		{
			'<F11>',
			function()
				require("dap").step_into()
			end,
			noremap = true,
			silent = true,
		},
		{
			'<F12>',
			function()
				require("dap").step_out()
			end,
			noremap = true,
			silent = true,
		},

		{
			'<leader>du',
			function()
				require("dapui").toggle()
			end,
			noremap = true,
			silent = true,
		},
	},
}

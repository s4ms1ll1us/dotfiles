return {
    {
        "mfussenegger/nvim-dap",
        lazy = false,
        config = function()
            local dap = require("dap")

            dap.adapters.python = {
                type = "executable",
                command = "python",
                args = { "-m", "debugpy.adapter" },
            }

            dap.configurations.python = {
                {
                    type = "python",
                    request = "launch",
                    name = "Launch current file",
                    program = "${file}",
                    pythonPath = function()
                        return "python"
                    end,
                },
            }

            vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
            vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
            vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
            vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
            vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
            vim.keymap.set("n", "<Leader>B", function()
              require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end)

        end,
    },
    {
        "nvim-neotest/nvim-nio"
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")

            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    }
}

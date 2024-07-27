local M = {}

local very_lazy_fired = false

M.local_very_lazy = function(cb)
    if very_lazy_fired then
        vim.schedule(cb)
        return
    end
    vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        once = true,
        callback = function()
            cb()
        end,
    })
end

function M.very_lazy()
    local function _load()
        vim.schedule(function()
            if vim.v.exiting ~= vim.NIL then
                return
            end
            vim.g.did_very_lazy = true
            M.track({ event = "VeryLazy" })
            vim.api.nvim_exec_autocmds("User", { pattern = "VeryLazy", modeline = false })
            M.track()
        end)
    end

    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyDone",
        once = true,
        callback = function()
            if vim.v.vim_did_enter == 1 then
                _load()
            else
                vim.api.nvim_create_autocmd("UIEnter", {
                    once = true,
                    callback = function()
                        _load()
                    end,
                })
            end
        end,
    })
end

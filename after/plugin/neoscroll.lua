require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
    -- Set any other options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
--t['<C-K>'] = {'scroll', {'-vim.wo.scroll', 'true', '300'}}
--t['<C-J>'] = {'scroll', { 'vim.wo.scroll', 'true', '300'}}
-- Use the "circular" easing function
--t['<C-S-k>'] = {'scroll', {'-0.5', 'true', '300'}}
--t['<C-S-j>'] = {'scroll', { '0.5', 'true', '300'}}
-- Pass "nil" to disable the easing animation (constant scrolling speed)
t['<C-k>'] = {'scroll', {'-0.10', 'false', '100', nil}}
t['<C-j>'] = {'scroll', { '0.10', 'false', '100', nil}}
-- When no easing function is provided the default easing function (in this case "quadratic") will be used
t['zt']    = {'zt', {'300'}}
t['zz']    = {'zz', {'300'}}
t['zb']    = {'zb', {'300'}}

require('neoscroll.config').set_mappings(t)

local api = vim.api
local fn = vim.fn
local cmd = api.nvim_command

local U = {}

local function join(...)
    return table.concat({...}, " ")
end

-- Key mapping
function U.map(mode, key, result, opts)
    opts =
        vim.tbl_extend(
        "keep",
        opts or {},
        {
            noremap = true,
            silent = true,
            expr = false
        }
    )

    api.nvim_set_keymap(mode, key, result, opts)
end

-- For moments when I don't want my cursor to stay on the tree
function U.move_cursor_from_tree()
    local nr = api.nvim_get_current_buf()
    local buf = api.nvim_buf_get_name(nr)
    if string.find(buf, "NvimTree") and nr > 1 then
        cmd("wincmd l")
    end
end

-- Stolen from https://github.com/kyazdani42/nvim-palenight.lua/blob/master/lua/palenight.lua#L10
-- Usage:
-- highlight(Cursor, { fg = bg_dark, bg = yellow })
function U.highlight(group, styles)
    local gui = styles.gui or "NONE"
    local sp = styles.sp or "NONE"
    local fg = styles.fg or "NONE"
    local bg = styles.bg or "NONE"

    cmd("highlight! " .. group .. " gui=" .. gui .. " guisp=" .. sp .. " guifg=" .. fg .. " guibg=" .. bg)
end

-- Usage:
-- highlight({
--      CursorLine   = { bg = bg },
--      Cursor       = { fg = bg_dark, bg = yellow }
-- })
function U.highlights(hi_table)
    for group, styles in pairs(hi_table) do
        U.highlight(group, styles)
    end
end

function U.hiLink(src, dest)
    cmd("highlight link " .. src .. " " .. dest)
end

function U.hiLinks(hi_table)
    for src, dest in pairs(hi_table) do
        U.hiLink(src, dest)
    end
end

-- For getting hex color from hi group
-- Usage:
-- get_hl_color('Normal', 'fg' | 'bg')
function U.get_hl_color(name, attr)
    return fn.synIDattr(fn.hlID(name), attr)
end

return U

local M = {}

function M.config()
    local U = require("utils")

    require("FTerm").setup()

    U.map("n", "<A-i>", "<CMD>lua require('FTerm').toggle()<CR>")
    U.map("t", "<A-i>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
end

return M

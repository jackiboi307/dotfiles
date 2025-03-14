function echo(str)
    vim.cmd("echo '" .. str .. "'")
end

vim.api.nvim_create_user_command('CharBack',
function()
    line = vim.fn.getline('.')
    col = vim.fn.virtcol('.')
    -- line = string.sub(line, col+1) -- everything after current column
    chars = '()[]{}<>"'

    found = false

    for i = 1, string.len(chars) do
        index = string.find(line, string.sub(chars, i, i), col+1, true)

        if index ~= nil then
            if not found then
                col = index
                found = true
            elseif index < col then
                col = index
            end
        end
    end

    vim.fn.cursor('.', col)
end,
{})

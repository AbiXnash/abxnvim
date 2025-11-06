-- print("sonarlint-analyzers")
-- local mason_path = vim.fn.stdpath("data") .. "/mason/"
-- local analyzers_dir = mason_path .. "share/sonarlint-analyzers/"

-- local function get_analyzer_jars(directory)
--     local jars = {}
--     local files = vim.fn.glob(directory .. "*.jar", true, true)

--     if type(files) == 'table' then
--         for _, file in ipairs(files) do
--             table.insert(jars, file)
--         end
--     end
--     print(jars)
--     return jars
-- end

-- local all_analyzers = get_analyzer_jars(analyzers_dir)
-- local cmd_args = {
--     'sonarlint-language-server',
--     '-stdio',
--     '-analyzers',
-- }

-- for _, path in ipairs(all_analyzers) do
--     table.insert(cmd_args, path)
-- end


-- require('sonarlint').setup({
--     server = {
--         cmd = cmd_args,
--     },
--     filetypes = {
--         'java',
--     },
-- })

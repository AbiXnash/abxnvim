return {
    "alnav3/sonarlint.nvim",
    event = "VeryLazy",
    config = function()
        local mason_path = vim.fn.stdpath("data") .. "/mason/"
        local analyzers_dir = mason_path .. "share/sonarlint-analyzers/"

        local function get_analyzer_jars(directory)
            local jars = {}
            local files = vim.fn.globpath(directory, "*.jar", false, true)
            if type(files) == "table" then
                for _, file in ipairs(files) do
                    table.insert(jars, file)
                end
            end
            return jars
        end

        local all_analyzers = get_analyzer_jars(analyzers_dir)
        local cmd_args = { "sonarlint-language-server", "-stdio", "-analyzers" }
        vim.list_extend(cmd_args, all_analyzers)

        local ok, sonarlint = pcall(require, "sonarlint")
        if not ok then
            vim.notify("SonarLint plugin not found", vim.log.levels.WARN)
            return
        end

        sonarlint.setup({
            config = {
                server = {
                    cmd = cmd_args,
                },
                filetypes = {
                    "java",
                    "python",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "cpp",
                    "c",
                },
            },
        })
    end,
}

local status, prettier = pcall(require("prettier"))

if (not status) then
    return
end

prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.22+)
    filetypes = {"css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss", "markdown",
                 "typescript", "typescriptreact", "yaml"}
})


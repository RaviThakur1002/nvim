return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "vimwiki", "mermaid" },  -- Add file types you want to preview
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown", "vimwiki", "mermaid" }
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_command_for_global = 1  -- Allow the command to work on all file types
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_browser = ""
        vim.g.mkdp_echo_preview_url = 0
        vim.g.mkdp_page_title = '「${name}」'
        vim.g.mkdp_preview_options = {
            mkit = {},
            katex = {},
            uml = {},
            mermaid = {},  -- Mermaid options
            disable_sync_scroll = 0,
            sync_scroll_type = 'middle',
            hide_yaml_meta = 1,
            sequence_diagrams = {},
            flowchart_diagrams = {},
            content_editable = false,
            disable_filename = 0,
            toc = {}
        }
    end,
}

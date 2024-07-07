return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Define and set highlight groups for each logo line
    vim.api.nvim_set_hl(0, "DevilDashboardLogo1", { fg = "#4A148C" }) -- Deep Purple
    vim.api.nvim_set_hl(0, "DevilDashboardLogo2", { fg = "#6A1B9A" }) -- Purple
    vim.api.nvim_set_hl(0, "DevilDashboardLogo3", { fg = "#8E24AA" }) -- Medium Purple
    vim.api.nvim_set_hl(0, "DevilDashboardLogo4", { fg = "#AB47BC" }) -- Light Purple
    vim.api.nvim_set_hl(0, "DevilDashboardLogo5", { fg = "#CE93D8" }) -- Very Light Purple
    vim.api.nvim_set_hl(0, "DevilDashboardUsername", { fg = "#E1BEE7" }) -- Pale Purple


    -- Set header
    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = "▓█████▄ ▓█████  ██▒   █▓ ██▓ ██▓    ",
        opts = { hl = "DevilDashboardLogo1", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "▒██▀ ██▌▓█   ▀ ▓██░   █▒▓██▒▓██▒    ",
        opts = { hl = "DevilDashboardLogo2", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "░██   █▌▒███    ▓██  █▒░▒██▒▒██░    ",
        opts = { hl = "DevilDashboardLogo3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "░▓█▄   ▌▒▓█  ▄   ▒██ █░░░██░▒██░    ",
        opts = { hl = "DevilDashboardLogo3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "░▒████▓ ░▒████▒   ▒▀█░  ░██░░██████▒",
        opts = { hl = "DevilDashboardLogo4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " ▒▒▓  ▒ ░░ ▒░ ░   ░ ▐░  ░▓  ░ ▒░▓  ░",
        opts = { hl = "DevilDashboardLogo4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " ░ ▒  ▒  ░ ░  ░   ░ ░░   ▒ ░░ ░ ▒  ░",
        opts = { hl = "DevilDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " ░ ░  ░    ░        ░░   ▒ ░  ░ ░   ",
        opts = { hl = "DevilDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ░       ░  ░      ░   ░      ░  ░",
        opts = { hl = "DevilDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = " ░                                  ",
        opts = { hl = "DevilDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "padding",
        val = 1,
      },
      {
        type = "text",
       val = "Action is eloquence.\n" ..
      "           :William Shakespeare",

        opts = { hl = "DevilDashboardUsername", shrink_margin = false, position = "center" },
      },
    }

     -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }
    -- Send config to alpha
    alpha.setup(dashboard.opts)
    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

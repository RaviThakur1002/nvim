return {
    "aPeoplesCalendar/apc.nvim",
    dependencies = {
        "rcarriga/nvim-notify",
    },
    event = "BufRead",
    config = function ()
        require("apeoplescalendar").setup() -- configuration options are described below
    end,
}

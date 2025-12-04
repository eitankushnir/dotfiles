return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
        -- since pixel uses cterm colors, we dont want to setup this plugin
        if vim.g.colors_name ~= "pixel" then
            require("colorizer").setup()
        end
    end
}

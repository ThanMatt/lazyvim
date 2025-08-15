return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    --     local logo = [[
    --  _____ _                                 _   _
    -- |_   _| |                               | | | |
    --   | | | |__   __ _ _ __  _ __ ___   __ _| |_| |_
    --   | | | '_ \ / _` | '_ \| '_ ` _ \ / _` | __| __|
    --   | | | | | | (_| | | | | | | | | | (_| | |_| |_
    --   \_/ |_| |_|\__,_|_| |_|_| |_| |_|\__,_|\__|\__|
    -- ⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    -- ⠘⣿⣿⡟⠲⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠈⢿⡇⠀⠀⠈⠑⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⢲⣾⣿⣿⠃
    -- ⠀⠀⠈⢿⡀⠀⠀⠀⠀⠈⠓⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠚⠉⠀⠀⢸⣿⡿⠃⠀
    -- ⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⣸⡟⠁⠀⠀
    -- ⠀⠀⠀⠀⠀⠳⡄⠀⠀⠀⠀⠀⠀⠀⠈⠒⠒⠛⠉⠉⠉⠉⠉⠉⠉⠑⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠘⢦⡀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠙⣶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣀⣀⠴⠋⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠀⠀⠀⠹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⢸⣀⣽⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⣨⣿⠀⠀⠀⠀⠀⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠀⠘⠿⠛⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠙⠛⠋⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⢰⢃⡤⠖⠒⢦⡀⠀⠀⠀⠀⠀⠙⠛⠁⠀⠀⠀⠀⠀⠀⠀⣠⠤⠤⢤⡀⠀⠀⢧⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⢸⢸⡀⠀⠀⢀⡗⠀⠀⠀⠀⢀⣠⠤⠤⢤⡀⠀⠀⠀⠀⢸⡁⠀⠀⠀⣹⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⢸⡀⠙⠒⠒⠋⠀⠀⠀⠀⠀⢺⡀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠙⠲⠴⠚⠁⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⠤⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
    -- ⠀⠀⠀⠀⠀⠀⠀⠀⠾⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠦⠤⠤⠤⠤⠤⠤⠤⠼⠇⠀⠀⠀⠀⠀
    --     ]]
    local logo = [[
⠘⣿⣿⡟⠲⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠈⢿⡇⠀⠀⠈⠑⠦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⢲⣾⣿⣿⠃
⠀⠀⠈⢿⡀⠀⠀⠀⠀⠈⠓⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠚⠉⠀⠀⢸⣿⡿⠃⠀
⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⣸⡟⠁⠀⠀
⠀⠀⠀⠀⠀⠳⡄⠀⠀⠀⠀⠀⠀⠀⠈⠒⠒⠛⠉⠉⠉⠉⠉⠉⠉⠑⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⢦⡀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⣶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣀⣀⠴⠋⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⣠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣀⠀⠀⠀⠀⠹⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⢸⣀⣽⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⣨⣿⠀⠀⠀⠀⠀⠸⣆⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠀⠘⠿⠛⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠙⠛⠋⠀⠀⠀⠀⠀⠀⢹⡄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⢃⡤⠖⠒⢦⡀⠀⠀⠀⠀⠀⠙⠛⠁⠀⠀⠀⠀⠀⠀⠀⣠⠤⠤⢤⡀⠀⠀⢧⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⢸⡀⠀⠀⢀⡗⠀⠀⠀⠀⢀⣠⠤⠤⢤⡀⠀⠀⠀⠀⢸⡁⠀⠀⠀⣹⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡀⠙⠒⠒⠋⠀⠀⠀⠀⠀⢺⡀⠀⠀⠀⢹⠀⠀⠀⠀⠀⠙⠲⠴⠚⠁⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⠤⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢸⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠾⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠦⠤⠤⠤⠤⠤⠤⠤⠼⠇⠀⠀⠀⠀⠀
    ]]

    -- logo = string.rep("\n", 8) .. logo .. "\n\n"

    local datetime = os.date("%A, %B %d, %Y - %I:%M %p")
    local centered_date = "              " .. datetime -- Manual spacing

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        week_header = {
          enable = true,
          append = vim.split(logo, "\n"), -- empty string for spacing
          line_append = {
            "Have a productive week!", -- Optional: Add a new line
            "Let's get coding!",
          },
        },
        -- stylua: ignore
        center = {
          -- { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          -- { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua require("persistence").load()',              desc = " Recent Projects", icon = " ", key = "p" },
          -- { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = "edit ~/.config/nvim/lua/plugins/dashboard.lua",  desc = " Edit Dashboard",  icon = " ", key = "d" },
          { action = "Lazy",                                           desc = " Lazy",            icon = " ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" }
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local quotes = {
            "Code is poetry in motion.",
            "Debug like your life depends on it.",
            "Stay caffeinated, stay productive.",
            "Beautiful code is a work of art.",
            "Every bug is a learning opportunity.",
            "Write code that tells a story.",
            "Simplicity is the ultimate sophistication.",
            "Good code is its own best documentation.",
            "Programs must be written for people to read.",
            "Make it work, make it right, make it fast.",
            "Keep it simple, stupid",
            "Make it simple — improve it through user feedback.",
            "Ship it, then sharpen it.",
            "Great engineers debug the problem, not the blame.",
            "Refactor today so you can sleep tomorrow.",
            "Test code like you’re its worst enemy.",
            "A clean commit history is a gift to your future self.",
            "Slow is smooth, smooth is fast.",
            "Your codebase is a garden — prune it often.",
            "Chase clarity, not cleverness.",
            "The best pull request is the one you don't regret next week.",
            "Logs are the diary of your app — write them well.",
            "Measure twice, deploy once.",
            "If it’s worth doing, it’s worth automating.",
            "Don’t just fix the bug — fix why it was possible.",
            "Performance is a feature, not an afterthought.",
            "Readability counts more than heroics.",
          }
          math.randomseed(os.time())
          local random_quote = quotes[math.random(#quotes)]
          return {
            random_quote,
            "",
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}

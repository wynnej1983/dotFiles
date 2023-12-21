local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- change a keymap
    -- { "<leader>f", "<cmd>Telescope find_files theme=get_ivy<cr>", desc = "Find Files" },
    { "<leader>f", "<cmd>Telescope git_files theme=get_ivy<cr>", desc = "Find Files" },
    { "<leader>r", "<cmd>Telescope resume theme=get_ivy<cr>", desc = "Resume Search" },
    { "<leader>i", "<cmd>Telescope oldfiles theme=get_ivy<cr>", desc = "Old Files" },
    -- { "<leader>l", "<cmd>Telescope live_grep theme=get_ivy<cr>", desc = "Live String Search" },
    { "<leader><leader>", "<cmd>Telescope live_grep theme=get_ivy<cr>", desc = "Live String Search" },
    {
      "<localleader><localleader>",
      "<cmd>Telescope grep_string theme=get_ivy<cr>",
      desc = "Live Cursor String Search",
    },
    { "gs", "<cmd>Telescope git_status theme=get_ivy<cr>", desc = "Git Status" },
    { "gl", "<cmd>Telescope git_commits theme=get_ivy<cr>", desc = "Git Commits" },
    { "gb", "<cmd>Telescope git_branches theme=get_ivy<cr>", desc = "Git Branches" },
  },
  opts = function()
    local actions = require("telescope.actions")

    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end
    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Util.telescope("find_files", { no_ignore = true, default_text = line })()
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Util.telescope("find_files", { hidden = true, default_text = line })()
    end
    local fb_actions = require("telescope").extensions.file_browser.actions
    require("telescope._extensions.file_browser.config").values.mappings = {
      ["n"] = {
        ["l"] = actions.select_default,
        ["h"] = fb_actions.goto_parent_dir,
        ["a"] = fb_actions.create,
        ["r"] = fb_actions.rename,
        ["m"] = fb_actions.move,
        ["c"] = fb_actions.copy,
        ["d"] = fb_actions.remove,
        ["f"] = fb_actions.toggle_browser,
        ["."] = fb_actions.toggle_hidden,
        ["s"] = fb_actions.toggle_all,
        ["t"] = fb_actions.change_cwd,
      },
    }

    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
            ["<a-t>"] = open_selected_with_trouble,
            ["<a-i>"] = find_files_no_ignore,
            ["<a-h>"] = find_files_with_hidden,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
          },
          n = {
            ["q"] = actions.close,
            ["sv"] = actions.file_split,
            ["sg"] = actions.file_vsplit,
            ["st"] = actions.file_tab,
          },
        },
      },
    }
  end,
}

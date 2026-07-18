return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for icons
  },
  opts = {
    -- Disable default mappings; re-define all shortcuts manually to match nvim-tree as closely as possible
    use_default_mappings = false,
    -- Core: define all key mappings
    window = {
      mappings = {
        -- Basic navigation (consistent with nvim-tree)
        ["o"] = "open",           -- Open file or folder
        ["<CR>"] = "open",        -- Enter key also opens
        ["v"] = "open_vsplit",    -- Open in vertical split
        ["h"] = "open_split",     -- Open in horizontal split
        ["t"] = "open_tabnew",    -- Open in new tab
        ["n"] = "open_in_new_tab",-- In nvim-tree, 'n' also opens in a new tab
        ["C"] = "set_root",       -- Change root directory
        ["U"] = "navigate_up",    -- Navigate up to parent directory
        -- File operations (consistent with nvim-tree)
        ["a"] = "add",            -- Create new file/folder
        ["d"] = "noop", ["D"] = "delete", -- Remap original `d` for `delete`
        ["r"] = "rename",         -- Rename
        ["x"] = "cut_to_clipboard", -- Cut
        ["c"] = "copy_to_clipboard",-- Copy
        ["p"] = "paste_from_clipboard", -- Paste
        ["y"] = "copy_name",      -- Copy file name
        ["Y"] = "copy_relative_path", -- Copy relative path
        ["gy"] = "copy_absolute_path", -- Copy absolute path
        -- View toggles (consistent with nvim-tree)
        ["."] = "toggle_hidden",  -- Toggle showing hidden files
        ["i"] = "toggle_gitignored", -- Toggle showing gitignored files
        ["R"] = "refresh",        -- Refresh the tree
        -- Other useful functions
        ["I"] = "toggle_gitignore", -- In nvim-tree, 'I' shows file info; here we use it to toggle gitignore display
        ["?"] = "show_help",      -- Show help
      },
    },
    -- Optional: specific settings for the filesystem source, for finer control if needed
    -- filesystem = {
    --   window = {
    --     mappings = {
    --       -- Override or add specific mappings not present in the parent window.mappings
    --     },
    --   },
    -- },
  },
  -- Key binding: use <C-o> to toggle the Neo-tree panel
  keys = {
    { "<C-o>", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
  },
}

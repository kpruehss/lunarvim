local M = {}

M.config = function()
  local neoclip_req = { "kkharji/sqlite.lua", module = "sqlite" }
  if lvim.builtin.neoclip.enable_persistent_history == false then
    neoclip_req = {}
  end
  lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {
      "ggandor/lightspeed.nvim",
      event = "BufRead",
    },
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
    { "p00f/nvim-ts-rainbow" },
    {
      "npxbr/glow.nvim",
      ft = { "markdown" }
    },
    { "ellisonleao/gruvbox.nvim" },
    { "MattesGroeger/vim-bookmarks" },
    { "nvim-treesitter/playground" },
    {
      "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup()
      end,
    },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("user.todo_comments").config()
      end,
      event = "BufRead",
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
      end,
    },
    {
      "jinh0/eyeliner.nvim",
      config = function()
        require("eyeliner").setup {
          highlight_on_key = true,
        }
      end,
    },
    {
      "felipec/vim-sanegx",
      event = "BufRead",
    },
    { "NvChad/nvim-colorizer.lua" },
    { "lunarvim/darkplus.nvim" },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_signature").config()
      end,
      event = { "BufRead", "BufNew" },
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("user.symbols_outline").config()
      end,
      event = "BufReadPost",
      disable = lvim.builtin.tag_provider ~= "symbols-outline",
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
    },
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
      end,
      event = "BufRead",
      disable = not lvim.builtin.lsp_lines.active,
    },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("user.zen").config()
      end,
      event = "BufRead",
    },
    {
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
        }
      end,
      event = "InsertEnter",
      requires = "nvim-treesitter/nvim-treesitter",
    },
    {
      "jose-elias-alvarez/typescript.nvim",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      opt = true,
      event = { "BufReadPre", "BufNew" },
      config = function()
        require("user.tss").config()
      end,
      disable = not lvim.builtin.web_programming.active,
    },
    {
      "vuki656/package-info.nvim",
      config = function()
        require("package-info").setup()
      end,
      opt = true,
      event = { "BufReadPre", "BufNew" },
      disable = not lvim.builtin.web_programming.active,
    },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      opt = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      keys = "<leader>?",
      disable = not lvim.builtin.cheat.active,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    },
    {
      "ThePrimeagen/refactoring.nvim",
      ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
      event = "BufRead",
      config = function()
        require("refactoring").setup {}
      end,
      disable = not lvim.builtin.refactoring.active,
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      ft = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      opt = true,
      event = { "BufReadPre", "BufNew" },
      config = function()
        require("dap-vscode-js").setup {
          debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
          debugger_cmd = { "js-debug-adapter" },
          adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
        }
      end,
      disable = not lvim.builtin.web_programming.active,
    },
    {
      "smjonas/inc-rename.nvim",
      config = function()
        require("inc_rename").setup()
      end,
      disable = not lvim.builtin.noice.active,
    },
    {
      "cshuaimin/ssr.nvim",
      config = function()
        require("ssr").setup {
          min_width = 50,
          min_height = 5,
          keymaps = {
            close = "q",
            next_match = "n",
            prev_match = "N",
            replace_all = "<leader><cr>",
          },
        }
      end,
      event = { "BufReadPost", "BufNew" },
    },
    {
      "folke/twilight.nvim",
      config = function()
        require("user.twilight").config()
      end,
      event = "BufRead",
    },
    { "kylechui/nvim-surround" },
    { "kevinhwang91/nvim-bqf" },
    { "opalmay/vim-smoothie" },
    { "ThePrimeagen/harpoon" },
    { "lvimuser/lsp-inlayhints.nvim" },
    { "renerocksai/telekasten.nvim" },
    { "renerocksai/calendar-vim" },
    { "monaqa/dial.nvim" },
    { "is0n/jaq-nvim" },
    { "sindrets/diffview.nvim" },
    { "petertriho/nvim-scrollbar" },
    { "christianchiarulli/telescope-tabs", branch = "chris" },
  }
end
return M

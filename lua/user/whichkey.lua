-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["T"] = {
  name = "+Tab",
  t = {
    "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
    "Find Tab",
  },
  n = { "<cmd>tabnew %<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
  o = { "<cmd>tabonly<cr>", "Only Tab" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", " Zen" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", " Symbol Outline" }
if lvim.builtin.cheat.active then
  lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", " Cheat.sh" }
end
lvim.builtin.which_key.mappings["l"]["h"] = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" }
lvim.builtin.which_key.mappings["l"]["H"] = { "<cmd>IlluminateToggle<cr>", "Toggle Doc HL" }
lvim.builtin.which_key.mappings["l"]["v"] = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" }
lvim.builtin.which_key.mappings["b"]["v"] = { ":vs<CR>", "Vertically Split Buffer" }
if lvim.builtin.noice.active then
  lvim.builtin.which_key.mappings["l"]["r"] = { ":IncRename ", "Rename" }
  lvim.builtin.which_key.mappings["l"]["R"] = {
    function()
      return ":IncRename " .. vim.fn.expand "<cword>"
    end,
    "Rename keep",
    expr = true,
  }
else
  lvim.builtin.which_key.vmappings["l"] = {
    name = "+Lsp",
    r = { "<ESC><CMD>lua vim.lsp.buf.rename()<CR>", "Rename" },
  }
end
lvim.builtin.which_key.vmappings["r"] = {
  function()
    require("ssr").open()
  end,
  "Structural replace",
}
lvim.builtin.which_key.mappings["N"] = {
  name = " Neogen",
  c = { "<cmd>lua require('neogen').generate({ type = 'class'})<CR>", "Class Documentation" },
  f = { "<cmd>lua require('neogen').generate({ type = 'func'})<CR>", "Function Documentation" },
  t = { "<cmd>lua require('neogen').generate({ type = 'type'})<CR>", "Type Documentation" },
  F = { "<cmd>lua require('neogen').generate({ type = 'file'})<CR>", "File Documentation" },
}
lvim.builtin.which_key.mappings["n"] = {
  name = "Notes",
  c = { "<cmd>Telekasten show_calendar<cr>", "Calendar" },
  n = { "<cmd>Telekasten new_note<cr>", "Note" },
  f = { "<cmd>Telekasten find_notes<cr>", "Find" },
  F = { "<cmd>Telekasten find_daily_notes<cr>", "Find Journal" },
  j = { "<cmd>Telekasten goto_today<cr>", "Journal" },
  p = { "<cmd>Telekasten panel<cr>", "Panel" },
  t = { "<cmd>Telekasten toggle_todo<cr>", "Toggle Todo" },
}

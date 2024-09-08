return {

  -- ui
  require("plugins.utils.ui.dashboard"),

  -- theme
  require("plugins.utils.themes.vscode"),

  -- funcs
  require("plugins.utils.funcs.alpha"),
  require("plugins.utils.funcs.dashboard"),
  require("plugins.utils.funcs.icons"),
  require("plugins.utils.funcs.kulala"),
  require("plugins.utils.funcs.notice"),
  require("plugins.utils.funcs.notify"),
  require("plugins.utils.funcs.project"),
  require("plugins.utils.funcs.scrollview"),
  require("plugins.utils.funcs.which-key"),

  -- editor
  require("plugins.utils.editor.coverage"),
  require("plugins.utils.editor.diffview"),
  require("plugins.utils.editor.git-blame"),
  require("plugins.utils.editor.git-conflict"),
  require("plugins.utils.editor.telescope"),
  require("plugins.utils.editor.tidy"),
  require("plugins.utils.editor.undo-mode"),
  require("plugins.utils.editor.zen-mode"),
  require("plugins.utils.editor.treesitter"),

  -- modules
  require("plugins.utils.modules.init"),

  -- dap
  require("plugins.utils.dap.core"),
  require("plugins.utils.dap.debugging.dap-cortex-debug"),
}

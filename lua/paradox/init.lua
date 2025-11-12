local M = {}

local function get_groups(colors)
  local groups = {
    -- NormalNC = { link = "NormalFloat" },

    Added = { fg = colors.hue36 },
    Removed = { fg = colors.hue72 },

    -- WinSeparator = { fg = colors.hue5 },

    cString = { link = "String" },
    cType = { fg = colors.hue52 },
    cTypedef = { fg = colors.hue35 },
    cStructure = { link = "Structure" },
    cRepeat = { fg = colors.hue72 },
    cConditional = { fg = colors.hue72 },
    cStatement = { fg = colors.hue72 },
    cInclude = { fg = colors.hue72 },
    StatusLineNc = { fg = colors.bg11, bg = colors.bg3 },
    StatusLine = { fg = colors.bg11, bg = colors.bg1 },
    Substitute = { fg = colors.hue60, bg = colors.bg2 },

    Label = { fg = colors.hue50, bold = true },
  }
  local syntax = {
    Error = { fg = colors.hue72 },
    Boolean = { fg = colors.hue72 },
    Comment = { fg = colors.bg7 },
    Constant = { fg = colors.hue1 },
    Delimiter = { fg = colors.bg12 },
    Function = { fg = colors.hue46 },
    Keyword = { fg = colors.hue52 },
    Number = { fg = colors.hue72 },
    Operator = { fg = colors.hue72 },
    String = { fg = colors.hue17 },
    Structure = { fg = colors.hue72 },
    Type = { fg = colors.hue30 },
    Special = { fg = colors.hue72 },
  }
  local editor = {
    -- NormalMode
    -- InsertMode
    -- ReplaceMode
    -- VisualMode
    -- CommandMode

    -- used for the columns set with 'colorcolumn'
    ColorColumn = { bg = colors.bg3 },
    CurSearch = { link = "IncSearch" },
    -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLine = { bg = colors.bg3 },
    -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineNr = { fg = colors.bg11, bg = colors.bg3 },
    ErrorMsg = { fg = colors.bg2, bg = colors.hue72 },
    FloatBorder = { fg = colors.hue1, bg = colors.bg1 },
    Folded = { bg = colors.bg3, fg = colors.hue36 },
    IncSearch = { link = "Search" },
    LineNr = { fg = colors.bg6 },
    MatchParen = { reverse = true },
    ModeMsg = { link = "Normal", bold = true },
    Normal = { fg = colors.bg11, bg = colors.bg2 },
    NormalFloat = { fg = colors.bg11, bg = colors.bg1 },
    Pmenu = { bg = colors.bg3 },
    PmenuMatch = { fg = colors.hue52 },
    PmenuThumb = { bg = colors.bg4 },
    PmenuKind = { fg = colors.hue52 },
    PmenuSel = { bg = colors.bg4 },
    PmenuExtra = { fg = colors.bg5 },

    Search = { reverse = true },
    TabLine = { link = "TabLineFill" }, -- 非当前标签
    TabLineFill = { bg = colors.bg1 }, -- 标签栏
    TabLineSel = { fg = colors.hue44, bg = colors.bg2, bold = true }, -- 当前标签选中
    Title = { fg = colors.hue45 },
    Visual = { bg = colors.bg4 },
    VisualNOS = { link = "Visual" },
    WinBar = { bg = colors.bg2 },
    WinBarNC = { link = "WinBar" },
  }
  local treesitter = {
    ["@keyword"] = { link = "Keyword" },
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@variable"] = { fg = colors.bg11 },
    ["@variable.member"] = { fg = colors.hue48 },
    ["@variable.builtin"] = { fg = colors.hue72, bold = false },
    ["@variable.parameter"] = { fg = colors.hue7 },
    ["@module.builtin"] = { link = "@variable.builtin" },
    ["@property"] = { fg = colors.hue48 },
    ["@constructor"] = { fg = colors.bg12 },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Constant" },

    ["@tag"] = { fg = colors.hue72, bold = true },
    ["@tag.attribute"] = { fg = colors.hue48 },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@tag.builtin"] = { fg = colors.hue72, bold = false },
    ["@label"] = { link = "Label" },
    ["@label.vimdoc"] = { link = "Label" },
    ["@markup.link"] = { fg = colors.hue62 },
    ["@markup.link.label"] = { link = "@markup.link" },
    ["@markup.link.vimdoc"] = { link = "@markup.link" },
  }
  local lsp = {
    -- -- used for "Error" diagnostic virtual text
    -- LspDiagnosticsDefaultError = { fg = colors.error },
    -- -- used for "Error" diagnostic signs in sign column
    -- LspDiagnosticsSignError = { fg = colors.error },
    -- -- used for "Error" diagnostic messages in the diagnostics float
    -- LspDiagnosticsFloatingError = { fg = colors.error },
    -- -- Virtual text "Error"
    -- LspDiagnosticsVirtualTextError = { fg = colors.error },
    -- -- used to underline "Error" diagnostics.
    -- LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
    -- -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsDefaultWarning = { fg = colors.warn },
    -- -- used for "Warning" diagnostic signs in sign column
    -- LspDiagnosticsSignWarning = { fg = colors.warn },
    -- -- used for "Warning" diagnostic messages in the diagnostics float
    -- LspDiagnosticsFloatingWarning = { fg = colors.warn },
    -- -- Virtual text "Warning"
    -- LspDiagnosticsVirtualTextWarning = { fg = colors.warn },
    -- -- used to underline "Warning" diagnostics.
    -- LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
    -- -- used for "Information" diagnostic virtual text
    -- LspDiagnosticsDefaultInformation = { fg = colors.info },
    -- -- used for "Information" diagnostic signs in sign column
    -- LspDiagnosticsSignInformation = { fg = colors.info },
    -- -- used for "Information" diagnostic messages in the diagnostics float
    -- LspDiagnosticsFloatingInformation = { fg = colors.info },
    -- -- Virtual text "Information"
    -- LspDiagnosticsVirtualTextInformation = { fg = colors.info },
    -- -- used to underline "Information" diagnostics.
    -- LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
    -- -- used for "Hint" diagnostic virtual text
    -- LspDiagnosticsDefaultHint = { fg = colors.hint },
    -- -- used for "Hint" diagnostic signs in sign column
    -- LspDiagnosticsSignHint = { fg = colors.hint },
    -- -- used for "Hint" diagnostic messages in the diagnostics float
    -- LspDiagnosticsFloatingHint = { fg = colors.hint },
    -- -- Virtual text "Hint"
    -- LspDiagnosticsVirtualTextHint = { fg = colors.hint },
    -- -- used to underline "Hint" diagnostics.
    -- LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
    -- -- used for highlighting "text" references
    -- LspReferenceText = { style = "underline", sp = colors.yellow },
    -- -- used for highlighting "read" references
    -- LspReferenceRead = { style = "underline", sp = colors.yellow },
    -- -- used for highlighting "write" references
    -- LspReferenceWrite = { style = "underline", sp = colors.yellow },
    --
    -- LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight_dark, style = "bold" },
    -- LspCodeLens = { fg = colors.light_gray },
    -- LspInlayHint = { fg = colors.light_gray, bg = colors.active },

    DiagnosticError = { fg = colors.hue72 },
    DiagnosticWarn = { fg = colors.hue9 },
    -- DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
    -- DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
    -- DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
    -- DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
    -- DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
    -- DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
    -- DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
    -- DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
    -- DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
    -- DiagnosticSignError = { link = "LspDiagnosticsSignError" },
    -- DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
    -- DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
    -- DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
    -- DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
    -- DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
    -- DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
    -- DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
    -- DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
    ["@lsp.type.variable"] = {},
    ["@lsp.type.class.c"] = { link = "cType" },
  }

  local plugins = {
    -- BlinkCmpLabelDeprecated = { strikethrough = true },
    -- BlinkCmpKind = { fg = colors.hue52 },
    -- -- BlinkCmpKindFunction = { fg = colors.hue52, bg = "#f0d2a0" },
    -- -- BlinkCmpLabel = { bg = "" },
    -- BlinkCmpLabelMatch = { fg = colors.hue52, bold = true },
    -- BlinkCmpMenuSelection = { bg = colors.bg4 },
    -- BlinkCmpScrollBarThumb = { link = "BlinkCmpMenuSelection" },
    -- BlinkCmpMenu = { bg = colors.bg3 },
    -- BlinkCmpSource = { fg = colors.bg5 },
    -- BlinkCmpDoc = { bg = colors.bg3 },
    -- -- BlinkCmpLabelDetail = { bg = colors.bg2 },
    -- BlinkCmpLabelDescription = { bg = colors.bg2 },
    -- BlinkCmpKindText = { fg = colors.hue23 },
    -- BlinkCmpKindVariable = { fg = colors.hue48 },
    -- BlinkCmpKindMethod = { link = "BlinkCmpKindFunction" },
    -- BlinkCmpKindFunction = { fg = colors.purple1 },
    -- BlinkCmpKindConstructor = { link = "Gruvboxorange2" },
    -- BlinkCmpKindUnit = { link = "GruvboxBlue" },
    -- BlinkCmpKindField = { link = "GruvboxBlue" },
    -- BlinkCmpKindClass = { link = "Gruvboxorange2" },
    -- BlinkCmpKindInterface = { link = "Gruvboxorange2" },
    -- BlinkCmpKindModule = { link = "GruvboxBlue" },
    -- BlinkCmpKindProperty = { link = "GruvboxBlue" },
    -- BlinkCmpKindValue = { link = "GruvboxOrange" },
    -- BlinkCmpKindEnum = { link = "Gruvboxorange2" },
    -- BlinkCmpKindOperator = { link = "Gruvboxorange2" },
    -- BlinkCmpKindKeyword = { link = "Gruvboxblue4" },
    -- BlinkCmpKindEvent = { link = "Gruvboxblue4" },
    -- BlinkCmpKindReference = { link = "Gruvboxblue4" },
    -- BlinkCmpKindColor = { link = "Gruvboxblue4" },
    -- BlinkCmpKindSnippet = { link = "Gruvboxgreen4" },
    -- BlinkCmpKindFile = { link = "GruvboxBlue" },
    -- BlinkCmpKindFolder = { link = "GruvboxBlue" },
    -- BlinkCmpKindEnumMember = { link = "GruvboxAqua" },
    -- BlinkCmpKindConstant = { link = "GruvboxOrange" },
    -- BlinkCmpKindStruct = { link = "Gruvboxorange2" },
    -- BlinkCmpKindTypeParameter = { link = "Gruvboxorange2" },
    -- BlinkCmpGhostText = { link = "GruvboxBg4" },

    Directory = { fg = colors.hue45, bold = false },
    NeoTreeDirectoryName = { link = "Directory" },
    NeoTreeGitUntracked = { fg = colors.hue5, bold = false },
    NeoTreeGitModified = { fg = colors.hue36, bold = false },
    -- NeoTreeDotfile = { fg = colors.fg4 },
    -- NeoTreeFadeText1 = { fg = colors.fg3 },
    -- NeoTreeFadeText2 = { fg = colors.fg4 },
    -- NeoTreeFileIcon = { fg = colors.blue },
    -- NeoTreeFileName = { fg = colors.fg1 },
    -- NeoTreeFileNameOpened = { fg = colors.fg1, bold = true },
    -- NeoTreeFileStats = { fg = colors.fg3 },
    -- NeoTreeFileStatsHeader = { fg = colors.fg2, italic = true },
    -- NeoTreeFilterTerm = { link = "SpecialChar" },
    -- NeoTreeHiddenByName = { link = "NeoTreeDotfile" },
    -- NeoTreeIndentMarker = { fg = colors.fg4 },
    -- NeoTreeMessage = { fg = colors.fg3, italic = true },
    -- NeoTreeModified = { fg = colors. },
    -- NeoTreeRootName = { fg = colors.fg1, bold = true, italic = true },
    -- NeoTreeSymbolicLinkTarget = { link = "NeoTreeFileName" },
    -- NeoTreeExpander = { fg = colors.fg4 },
    -- NeoTreeWindowsHidden = { link = "NeoTreeDotfile" },
    -- NeoTreePreview = { link = "Search" },
    -- NeoTreeGitAdded = { link = "GitGutterAdd" },
    -- NeoTreeGitConflict = { fg = colors., bold = true, italic = true },
    -- NeoTreeGitDeleted = { link = "GitGutterDelete" },
    -- NeoTreeGitIgnored = { link = "NeoTreeDotfile" },
    -- NeoTreeGitRenamed = { link = "NeoTreeGitModified" },
    -- NeoTreeGitStaged = { link = "NeoTreeGitAdded" },
    -- NeoTreeGitUnstaged = { link = "NeoTreeGitConflict" },
    -- NeoTreeTabActive = { fg = colors.fg1, bold = true },
    -- NeoTreeTabInactive = { fg = colors.fg4, bg = colors.bg5 },
    -- NeoTreeTabSeparatorActive = { fg = colors.bg5 },
    -- NeoTreeTabSeparatorInactive = { fg = colors.bg2, bg = colors.bg5 },

    MiniStatuslineModeNormal = { fg = colors.bg2, bg = colors.hue46 },
    MiniStatuslineModeInsert = { fg = colors.bg2, bg = colors.hue60 },
    MiniStatuslineModeVisual = { fg = colors.bg2, bg = colors.hue30 },
    MiniStatuslineModeReplace = { fg = colors.bg2, bg = colors.hue72 },
    MiniStatuslineModeCommand = { fg = colors.bg2, bg = colors.hue25 },
    MiniStatuslineDevinfo = { fg = colors.bg11, bg = colors.bg3 },
    MiniStatuslineFilename = { fg = colors.bg2, bg = colors.bg10 },
    MiniStatuslineFileinfo = { fg = colors.bg11, bg = colors.bg3 },
    -- MiniStatuslineModeNormal = { fg = colors.bg2, bg = colors.hue46 },
    -- MiniStatuslineModeInsert = { fg = colors.bg2, bg = colors.hue60 },
    -- MiniStatuslineModeVisual = { fg = colors.bg2, bg = colors.hue30 },
    -- MiniStatuslineModeReplace = { fg = colors.bg2, bg = colors.hue72 },
    -- MiniStatuslineModeCommand = { fg = colors.bg2, bg = colors.hue25 },
    -- MiniStatuslineDevinfo = { fg = colors.bg2, bg = colors.hue17 },
    -- MiniStatuslineFilename = { fg = colors.bg2, bg = colors.hue1 },
    -- MiniStatuslineFileinfo = { fg = colors.bg11, bg = colors.bg3 },
    -- * `MiniStatuslineModeNormal` - Normal mode.
    -- * `MiniStatuslineModeInsert` - Insert mode.
    -- * `MiniStatuslineModeVisual` - Visual mode.
    -- * `MiniStatuslineModeReplace` - Replace mode.
    -- * `MiniStatuslineModeCommand` - Command mode.
    -- * `MiniStatuslineModeOther` - other modes (like Terminal, etc.).
    -- * `MiniStatuslineDevinfo` - for "dev info" group
    -- * `MiniStatuslineFilename` - for |MiniStatusline.section_filename| section.
    -- * `MiniStatuslineFileinfo` - for |MiniStatusline.section_fileinfo| section.
    -- * `MiniStatuslineInactive` - highliting in not focused window.
    NeoWinbarFile = {},
    NavicIconsFile = {
      fg = colors.hue48,
    },
    NavicIconsModule = {
      fg = colors.hue52,
    },
    NavicIconsNamespace = {
      fg = colors.hue48,
    },
    NavicIconsPackage = {
      fg = colors.hue52,
    },
    NavicIconsClass = {
      fg = colors.hue48,
    },
    NavicIconsMethod = {
      fg = colors.hue48,
    },
    NavicIconsProperty = {
      fg = colors.hue48,
    },
    NavicIconsField = {
      fg = colors.hue48,
    },
    NavicIconsConstructor = {
      fg = colors.hue48,
    },
    NavicIconsEnum = {
      fg = colors.hue48,
    },
    NavicIconsInterface = {
      fg = colors.hue48,
    },
    NavicIconsFunction = {
      fg = colors.hue46,
    },
    NavicIconsVariable = {
      fg = colors.hue48,
    },
    NavicIconsConstant = {
      link = "Constant",
    },
    NavicIconsString = { link = "String" },
    NavicIconsNumber = { link = "Number" },
    NavicIconsBoolean = { link = "Boolean" },
    NavicIconsArray = {
      fg = colors.hue48,
    },
    NavicIconsObject = {
      fg = colors.hue5,
    },
    NavicIconsKey = {
      fg = colors.hue48,
    },
    NavicIconsNull = {
      fg = colors.hue48,
    },
    NavicIconsEnumMember = {
      fg = colors.hue48,
    },
    NavicIconsStruct = {
      fg = colors.hue48,
    },
    NavicIconsEvent = {
      fg = colors.hue48,
    },
    NavicIconsOperator = { link = "Operator" },
    NavicIconsTypeParameter = {
      fg = colors.hue48,
    },
    NavicText = {
      fg = colors.hue48,
    },
    NavicSeparator = { fg = colors.bg7 },
    -- -- Navic
    -- NavicIconsFile = { bg = colors.active, fg = colors.blue },
    -- NavicIconsModule = { bg = colors.active, fg = colors.blue },
    -- NavicIconsNamespace = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsPackage = { bg = colors.active, fg = colors.orange },
    -- NavicIconsClass = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsMethod = { bg = colors.active, fg = colors.purple },
    -- NavicIconsProperty = { bg = colors.active, fg = colors.blue },
    -- NavicIconsField = { bg = colors.active, fg = colors.blue },
    -- NavicIconsConstructor = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsEnum = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsInterface = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsFunction = { bg = colors.active, fg = colors.purple },
    -- NavicIconsVariable = { bg = colors.active, fg = colors.blue },
    -- NavicIconsConstant = { bg = colors.active, fg = colors.orange },
    -- NavicIconsString = { bg = colors.active, fg = colors.green },
    -- NavicIconsNumber = { bg = colors.active, fg = colors.orange },
    -- NavicIconsBoolean = { bg = colors.active, fg = colors.orange },
    -- NavicIconsArray = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsObject = { bg = colors.active, fg = colors.orange },
    -- NavicIconsKey = { bg = colors.active, fg = colors.purple },
    -- NavicIconsNull = { bg = colors.active, fg = colors.red },
    -- NavicIconsEnumMember = { bg = colors.active, fg = colors.cyan },
    -- NavicIconsStruct = { bg = colors.active, fg = colors.yellow },
    -- NavicIconsEvent = { bg = colors.active, fg = colors.purple },
    -- NavicIconsOperator = { bg = colors.active, fg = colors.purple },
    -- NavicIconsTypeParameter = { bg = colors.active, fg = colors.yellow },
    -- NavicSeparator = { bg = colors.active, fg = colors.cyan },
  }
  return vim.tbl_deep_extend("force", groups, syntax, editor, treesitter, lsp, plugins)
end

function M.loader()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "paradox"
  local colors = require("paradox.colors").load()
  local groups = get_groups(colors)
  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

function M.setup() end

return M

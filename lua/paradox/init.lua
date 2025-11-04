local M = {}

local function get_groups()
  local bg = vim.o.background
  local colorgroups = {
    dark = {
      hue1 = "#af706a",
      hue2 = "#af756a",
      hue3 = "#af7b6a",
      hue4 = "#af816a",
      hue5 = "#af876a",
      hue6 = "#af8d6a",
      hue7 = "#af926a",
      hue8 = "#af986a",
      hue9 = "#af9e6a",
      hue10 = "#afa36a",
      hue11 = "#afa96a",
      hue12 = "#afaf6a",
      hue13 = "#a9af6a",
      hue14 = "#a3af6a",
      hue15 = "#9daf6a",
      hue16 = "#98af6a",
      hue17 = "#92af6a",
      hue18 = "#8caf6a",
      hue19 = "#87af6a",
      hue20 = "#81af6a",
      hue21 = "#7baf6a",
      hue22 = "#75af6a",
      hue23 = "#70af6a",
      hue24 = "#6aaf6a",
      hue25 = "#6aaf70",
      hue26 = "#6aaf75",
      hue27 = "#6aaf7b",
      hue28 = "#6aaf81",
      hue29 = "#6aaf87",
      hue30 = "#6aaf8c",
      hue31 = "#6aaf92",
      hue32 = "#6aaf98",
      hue33 = "#6aaf9d",
      hue34 = "#6aafa3",
      hue35 = "#6aafa9",
      hue36 = "#6aafaf",
      hue37 = "#6aa9af",
      hue38 = "#6aa3af",
      hue39 = "#6a9daf",
      hue40 = "#6a98af",
      hue41 = "#6a92af",
      hue42 = "#6a8caf",
      hue43 = "#6a87af",
      hue44 = "#6a81af",
      hue45 = "#6a7baf",
      hue46 = "#6a75af",
      hue47 = "#6a70af",
      hue48 = "#6a6aaf",
      hue49 = "#706aaf",
      hue50 = "#756aaf",
      hue51 = "#7b6aaf",
      hue52 = "#816aaf",
      hue53 = "#876aaf",
      hue54 = "#8c6aaf",
      hue55 = "#926aaf",
      hue56 = "#986aaf",
      hue57 = "#9d6aaf",
      hue58 = "#a36aaf",
      hue59 = "#a96aaf",
      hue60 = "#af6aaf",
      hue61 = "#af6aa9",
      hue62 = "#af6aa3",
      hue63 = "#af6a9d",
      hue64 = "#af6a98",
      hue65 = "#af6a92",
      hue66 = "#af6a8c",
      hue67 = "#af6a87",
      hue68 = "#af6a81",
      hue69 = "#af6a7b",
      hue70 = "#af6a75",
      hue71 = "#af6a70",
      hue72 = "#af6a6a",

      bg0 = "#000000",
      bg1 = "#0d0d0d",
      bg2 = "#191919",
      bg3 = "#262626",
      bg4 = "#333333",
      bg5 = "#404040",
      bg6 = "#4d4d4d",
      bg7 = "#595959",
      bg8 = "#666666",
      bg9 = "#737373",
      bg10 = "#808080",
      bg11 = "#8C8C8C",
      bg12 = "#999999",
      bg13 = "#A6A6A6",
      bg14 = "#B3B3B3",
      bg15 = "#BFBFBF",
      bg16 = "#CCCCCC",
      bg17 = "#D9D9D9",
      bg18 = "#E6E6E6",
      bg19 = "#F2F2F2",
      bg20 = "#FFFFFF",
    },
    light = {
      hue1 = "#955650",
      hue2 = "#955c50",
      hue3 = "#956250",
      hue4 = "#956750",
      hue5 = "#956d50",
      hue6 = "#957350",
      hue7 = "#957850",
      hue8 = "#957e50",
      hue9 = "#958450",
      hue10 = "#958a50",
      hue11 = "#958f50",
      hue12 = "#959550",
      hue13 = "#8f9550",
      hue14 = "#8a9550",
      hue15 = "#849550",
      hue16 = "#7e9550",
      hue17 = "#789550",
      hue18 = "#739550",
      hue19 = "#6d9550",
      hue20 = "#679550",
      hue21 = "#629550",
      hue22 = "#5c9550",
      hue23 = "#569550",
      hue24 = "#509550",
      hue25 = "#509556",
      hue26 = "#50955c",
      hue27 = "#509562",
      hue28 = "#509567",
      hue29 = "#50956d",
      hue30 = "#509573",
      hue31 = "#509578",
      hue32 = "#50957e",
      hue33 = "#509584",
      hue34 = "#50958a",
      hue35 = "#50958f",
      hue36 = "#509595",
      hue37 = "#508f95",
      hue38 = "#508a95",
      hue39 = "#508495",
      hue40 = "#507e95",
      hue41 = "#507895",
      hue42 = "#507395",
      hue43 = "#506d95",
      hue44 = "#506795",
      hue45 = "#506295",
      hue46 = "#505c95",
      hue47 = "#505695",
      hue48 = "#505095",
      hue49 = "#565095",
      hue50 = "#5c5095",
      hue51 = "#625095",
      hue52 = "#675095",
      hue53 = "#6d5095",
      hue54 = "#735095",
      hue55 = "#785095",
      hue56 = "#7e5095",
      hue57 = "#845095",
      hue58 = "#8a5095",
      hue59 = "#8f5095",
      hue60 = "#955095",
      hue61 = "#95508f",
      hue62 = "#95508a",
      hue63 = "#955084",
      hue64 = "#95507e",
      hue65 = "#955078",
      hue66 = "#955073",
      hue67 = "#95506d",
      hue68 = "#955067",
      hue69 = "#955062",
      hue70 = "#95505c",
      hue71 = "#955056",
      hue72 = "#955050",

      bg0 = "#FFFFFF",
      bg1 = "#F2F2F2",
      bg2 = "#E6E6E6",
      bg3 = "#D9D9D9",
      bg4 = "#CCCCCC",
      bg5 = "#BFBFBF",
      bg6 = "#B3B3B3",
      bg7 = "#A6A6A6",
      bg8 = "#999999",
      bg9 = "#8C8C8C",
      bg10 = "#808080",
      bg11 = "#737373",
      bg12 = "#666666",
      bg13 = "#595959",
      bg14 = "#4d4d4d",
      bg15 = "#404040",
      bg16 = "#333333",
      bg17 = "#262626",
      bg18 = "#191919",
      bg19 = "#0d0d0d",
      bg20 = "#000000",
    },
  }
  local colors = colorgroups[bg]
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
    PmenuThumb = { bg = colors.hue5 },
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
    BlinkCmpLabelDeprecated = { strikethrough = true },
    BlinkCmpKind = { fg = colors.hue52 },
    -- BlinkCmpKindFunction = { fg = colors.hue52, bg = "#f0d2a0" },
    -- BlinkCmpLabel = { bg = "" },
    BlinkCmpLabelMatch = { fg = colors.hue52, bold = true },
    BlinkCmpMenuSelection = { bg = colors.bg4 },
    BlinkCmpMenu = { bg = colors.bg3 },
    BlinkCmpSource = { fg = colors.bg5 },
    BlinkCmpDoc = { bg = colors.bg3 },
    -- BlinkCmpLabelDetail = { bg = colors.bg2 },
    BlinkCmpLabelDescription = { bg = colors.bg2 },
    BlinkCmpKindText = { fg = colors.hue23 },
    BlinkCmpKindVariable = { fg = colors.hue48 },
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
      -- fg = colors.hue48,
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
    -- NavicText = { bg = colors.active, fg = colors.fg },
    -- NavicSeparator = { bg = colors.active, fg = colors.cyan },
  }
  return vim.tbl_deep_extend("force", groups, syntax, editor, treesitter, lsp, plugins)
end

function M.loader()
  vim.cmd("highlight clear")
  vim.g.colors_name = "paradox"
  vim.o.termguicolors = true
  local groups = get_groups()
  for group, colors in pairs(groups) do
    vim.api.nvim_set_hl(0, group, colors)
  end
end

function M.setup() end

return M

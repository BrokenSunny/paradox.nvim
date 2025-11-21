local M = {}

local function get_groups(colors)
	local syntax = {
		-- int, long, char, etc.
		Type = { fg = colors.hue30 },
		-- static, register, volatile, etc.
		StorageClass = { fg = colors.purple },
		-- struct, union, enum, etc.
		Structure = { fg = colors.red },
		-- any constant
		Constant = { fg = colors.hue1 },
		-- any character constant: 'c', '\n'
		Character = { fg = colors.green },
		-- a number constant: 5
		Number = { fg = colors.red },
		-- a boolean constant: TRUE, false
		Boolean = { fg = colors.red, bold = true },
		-- a floating point constant: 2.3e10
		Float = { fg = colors.orange },
		-- any statement
		Statement = { fg = colors.purple },
		-- case, default, etc.
		Label = { fg = colors.purple },
		-- sizeof", "+", "*", etc.
		Operator = { fg = colors.red },
		-- try, catch, throw
		Exception = { fg = colors.purple },
		-- generic Preprocessor
		PreProc = { fg = colors.purple },
		-- preprocessor #include
		Include = { fg = colors.blue },
		-- preprocessor #define
		Define = { fg = colors.red },
		-- same as Define
		Macro = { fg = colors.red },
		-- A typedef
		Typedef = { fg = colors.purple },
		-- preprocessor #if, #else, #endif, etc.
		PreCondit = { fg = colors.purple },
		-- any special symbol
		Special = { fg = colors.red },
		-- special character in a constant
		-- SpecialChar = { fg = colors.light_red },
		-- you can use CTRL-] on this
		Tag = { fg = colors.green },
		-- character that needs attention like , or .
		Delimiter = { fg = colors.bg12 },
		-- special things inside a comment
		-- SpecialComment = { fg = colors.light_gray },
		-- debugging statements
		Debug = { fg = colors.yellow },
		-- text that stands out, HTML links
		-- Underlined = { fg = colors.green, style = "underline" },
		-- left blank, hidden
		-- Ignore = { fg = colors.cyan, bg = colors.bg, style = "bold" },
		-- any erroneous construct
		Error = { fg = colors.error },
		-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		-- Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
		Comment = { fg = colors.bg7, italic = true },
		-- normal if, then, else, endif, switch, etc.
		-- Conditional = { fg = colors.purple, style = config.styles.keywords },
		-- normal for, do, while, etc.
		Keyword = { fg = colors.purple },
		-- normal any other keyword
		-- Repeat = { fg = colors.purple, style = config.styles.keywords },
		-- normal function names
		Function = { fg = colors.blue },
		-- any variable name
		-- Identifier = { fg = colors.fg, style = config.styles.variables },
		-- any string
		String = { fg = colors.yellow_green },

		htmlLink = { fg = colors.green, underline = true },
		htmlArg = { fg = colors.blue },
		htmlTag = { fg = colors.blue },
		htmlEndTag = { fg = colors.blue },
		htmlTagN = { fg = colors.yellow },
		htmlTagName = { fg = colors.yellow },
		htmlSpecialTagName = { fg = colors.yellow },
		-- htmlH1 = { fg = colors.cyan, style = "bold" },
		htmlH2 = { fg = colors.red, bold = true },
		htmlH3 = { fg = colors.green, bold = true },
		htmlH4 = { fg = colors.yellow, bold = true },
		htmlH5 = { fg = colors.purple, bold = true },
	}
	local editor = {
		healthError = { fg = colors.error },
		healthSuccess = { fg = colors.green },
		healthWarning = { fg = colors.warn },
		-- diff mode: Added line
		DiffAdd = { fg = colors.none, bg = colors.diff_add_bg },
		-- diff mode: Changed line
		DiffChange = { fg = colors.none, bg = colors.diff_change_bg },
		-- diff mode: Deleted line
		DiffDelete = { fg = colors.none, bg = colors.diff_remove_bg },
		-- diff mode: Changed text within a changed line
		DiffText = { fg = colors.none, bg = colors.diff_text_bg },

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
		CursorLineNr = { fg = colors.purple, bg = colors.bg3, bold = true },
		ErrorMsg = { fg = colors.bg, bg = colors.red },
		FloatBorder = { fg = colors.hue1, bg = colors.bg1 },
		Folded = { bg = colors.bg3, fg = colors.cyan },
		IncSearch = { link = "Search" },
		LineNr = { fg = colors.bg6 },
		MatchParen = { reverse = true },
		-- 'showmode' message (e.g., "-- INSERT -- ")
		ModeMsg = { link = "Normal", bold = true },
		-- |more-prompt|
		MoreMsg = { fg = colors.blue, bold = true },

		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg1 },

		-- normal item |hl-Pmenu|
		Pmenu = { bg = colors.bg3 },
		-- selected item |hl-PmenuSel|
		PmenuSel = { bg = colors.bg4 },
		-- scrollbar |hl-PmenuSbar|
		PmenuSbar = { bg = colors.float },
		-- thumb of the scrollbar  |hl-PmenuThumb|
		PmenuThumb = { bg = colors.bg4 },
		-- matched text in normal item
		PmenuMatch = { fg = colors.purple, bold = true },
		-- matched text in selected item
		-- PmenuMatchSel = { fg = colors.blue, bg = colors.selection, style = "bold" },
		PmenuKind = { fg = colors.purple },
		PmenuExtra = { fg = colors.bg5 },

		VertSplit = { link = "WinSeparator" },
		WinSeparator = { fg = colors.bg7 },
		StatusLineNc = { fg = colors.fg, bg = colors.bg3 },
		StatusLine = { fg = colors.fg, bg = colors.bg1 },

		Search = { reverse = true },
		TabLine = { link = "TabLineFill" }, -- 非当前标签
		TabLineFill = { bg = colors.bg1 }, -- 标签栏
		TabLineSel = { fg = colors.purple, bg = colors.bg, bold = true }, -- 当前标签选中

		-- titles for output from ":set all", ":autocmd" etc.
		Title = { fg = colors.purple },

		Visual = { bg = colors.bg4 },
		VisualNOS = { link = "Visual" },

		WinBar = { bg = colors.bg },
		WinBarNC = { link = "WinBar" },
	}
	local treesitter = {
		-- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
		-- ["@attribute"] = { fg = colors.purple },

		-- @character              character literals
		-- @character.special      special characters (e.g. wildcards)
		-- Character literals: `'a'` in C.
		["@character"] = { link = "String" },
		["@character.special"] = { link = "Special" },

		-- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
		-- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
		-- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
		-- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
		["@comment"] = { link = "Comment" },
		["@comment.error"] = { fg = colors.error },
		["@comment.warning"] = { fg = colors.warn },
		["@comment.todo"] = { fg = colors.cyan },
		["@comment.note"] = { fg = colors.purple },

		-- @constant               constant identifiers
		-- @constant.builtin       built-in constant values
		-- @constant.macro         constants defined by the preprocessor
		-- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
		["@constant"] = { link = "Constant" },
		-- Built-in constant values: `nil` in Lua.
		["@constant.builtin"] = { link = "Constant" },
		-- Constants defined by macros: `NULL` in C.
		["@constant.macro"] = { link = "Constant" },
		["@constant.identifiers"] = { link = "Constant" },

		-- Constructor calls and definitions: `{}` in Lua, and Java constructors.
		["@constructor"] = { fg = colors.purple },

		-- @boolean                boolean literals
		-- @number                 numeric literals
		-- @number.float           floating-point number literals
		-- Boolean literals: `True` and `False` in Python.
		["@boolean"] = { link = "Boolean" },
		-- Numeric literals that don't fit into other categories.
		["@number"] = { link = "Number" },
		-- Floating-point number literals.
		["@number.float"] = { link = "@number" },

		-- Binary or unary operators: `+`, and also `->` and `*` in C.
		["@operator"] = { link = "Operator" },

		-- @function               function definitions
		-- @function.builtin       built-in functions
		-- @function.call          function calls
		-- @function.macro         preprocessor macros
		-- @function.method        method definitions
		-- @function.method.call   method calls
		["@function"] = { link = "Function" },
		-- Built-in functions: `print` in Lua.
		["@function.builtin"] = { link = "Function" },
		["@function.call"] = { link = "Function" },
		-- -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
		["@function.macro"] = { link = "Function" },
		-- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
		-- Method calls and definitions.
		["@function.method"] = { link = "@function" },
		["@function.method.call"] = { link = "@function.method" },

		-- @keyword                keywords not fitting into specific categories
		-- @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		-- @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
		-- @keyword.operator       operators that are English words (e.g. `and`, `or`)
		-- @keyword.import         keywords for including or exporting modules (e.g. `import`, `from` in Python)
		-- @keyword.type           keywords describing namespaces and composite types (e.g. `struct`, `enum`)
		-- @keyword.modifier       keywords modifying other constructs (e.g. `const`, `static`, `public`)
		-- @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
		-- @keyword.return         keywords like `return` and `yield`
		-- @keyword.debug          keywords related to debugging
		-- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
		-- @keyword.conditional         keywords related to conditionals (e.g. `if`, `else`)
		-- @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
		-- @keyword.directive           various preprocessor directives and shebangs
		-- @keyword.directive.define    preprocessor definition directives

		["@keyword"] = { link = "Keyword" },
		-- Keywords related to conditionals: `if`, `when`, `cond`, etc.
		["@keyword.conditional"] = { link = "@keyword" },
		["@keyword.conditional.ternary"] = { fg = colors.cyan },
		["@keyword.import"] = { link = "@keyword" },
		-- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
		["@keyword.function"] = { link = "@keyword" },
		-- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		["@keyword.operator"] = { link = "@keyword" },
		-- Keywords like `return` and `yield`.
		["@keyword.return"] = { link = "@keyword" },
		-- Keywords related to loops: `for`, `while`, etc.
		["@keyword.repeat"] = { link = "@keyword" },
		-- Exception related keywords: `try`, `except`, `finally` in Python.
		["@keyword.exception"] = { link = "@keyword" },

		-- @variable                       various variable names
		-- @variable.builtin               built-in variable names (e.g. `this`, `self`)
		-- @variable.parameter             parameters of a function
		-- @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
		-- @variable.member                object and struct fields
		["@variable"] = { fg = colors.fg },
		["@variable.builtin"] = { fg = colors.red },
		["@variable.parameter"] = { fg = colors.hue7 },
		["@variable.parameter.builtin"] = { fg = colors.hue7 },
		["@variable.member"] = { fg = colors.blue },

		-- @module                 modules or namespaces
		-- @module.builtin         built-in modules or namespaces
		-- @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
		--   ["@module"] = { link = "@variable" },
		-- ["@module.builtin"] = { link = "@variable.builtin" },
		-- GOTO labels: `label:` in C, and `::label::` in Lua.
		["@label"] = { link = "Label" },

		["@property"] = { fg = colors.blue },

		["@tag"] = { fg = colors.red, bold = true },
		["@tag.attribute"] = { fg = colors.blue },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@tag.builtin"] = { fg = colors.red, bold = false },

		-- @string                 string literals
		-- @string.documentation   string documenting code (e.g. Python docstrings)
		-- @string.regexp          regular expressions
		-- @string.escape          escape sequences
		-- @string.special         other special strings (e.g. dates)
		-- @string.special.symbol  symbols or atoms
		-- @string.special.path    filenames
		-- @string.special.url     URIs (e.g. hyperlinks)
		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "@string" },
		-- Regular expression literals.
		["@string.regexp"] = { fg = colors.orange },
		-- Escape characters within a string: `\n`, `\t`, etc.
		["@string.escape"] = { fg = colors.orange },
		-- Identifiers referring to symbols or atoms.
		["@string.special.symbol"] = { fg = colors.cyan },

		-- Non-structured text. Like text in a markup language.
		["@markup"] = { fg = colors.fg },

		-- @markup.strong          bold text
		-- @markup.italic          italic text
		-- @markup.strikethrough   struck-through text
		-- @markup.underline       underlined text (only for literal underline markup!)
		["@markup.strong"] = { fg = colors.purple, bold = true },
		["@markup.italic"] = { fg = colors.blue, italic = true },
		["@markup.strikethrough"] = { fg = colors.red, strikethrough = true },
		["@markup.underline"] = { underline = true },

		-- Text that is part of a title.
		["@markup.heading"] = { fg = colors.blue, bold = true },
		-- Literal or verbatim text.
		["@markup.raw"] = { fg = colors.yellow_green },
		-- URIs like hyperlinks or email addresses.
		-- ["@markup.link.url"] = { fg = colors.cyan, underline=true },
		-- Math environments like LaTeX's `$ ... $`
		["@markup.math"] = { fg = colors.fg },
		-- Text environments of markup languages.
		["@markup.environment"] = { fg = colors.fg },
		-- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
		["@markup.environment.name"] = { fg = colors.fg },
		-- Checked todo notes.
		["@markup.list.checked"] = { fg = colors.green },
		-- Unchecked todo notes.
		-- ["@markup.list.unchecked"] = { fg = colors.dark_blue },
		-- Specific to Markdown: different levels of headings

		-- @markup.heading         headings, titles (including markers)
		-- @markup.heading.1       top-level heading
		-- @markup.heading.2       section heading
		-- @markup.heading.3       subsection heading
		-- @markup.heading.4       and so on
		-- @markup.heading.5       and so forth
		-- @markup.heading.6       six levels ought to be enough for anybody

		["@markup.heading.1.markdown"] = { link = "markdownH1" },
		["@markup.heading.2.markdown"] = { link = "markdownH2" },
		["@markup.heading.3.markdown"] = { link = "markdownH3" },
		["@markup.heading.4.markdown"] = { link = "markdownH4" },
		["@markup.heading.5.markdown"] = { link = "markdownH5" },
		["@markup.heading.6.markdown"] = { link = "markdownH6" },
		["@markup.heading.1.marker.markdown"] = { link = "markdownH1Delimiter" },
		["@markup.heading.2.marker.markdown"] = { link = "markdownH2Delimiter" },
		["@markup.heading.3.marker.markdown"] = { link = "markdownH3Delimiter" },
		["@markup.heading.4.marker.markdown"] = { link = "markdownH4Delimiter" },
		["@markup.heading.5.marker.markdown"] = { link = "markdownH5Delimiter" },
		["@markup.heading.6.marker.markdown"] = { link = "markdownH6Delimiter" },

		-- @markup.quote           block quotes
		-- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
		["@markup.quote.markdown"] = { fg = colors.bg8, italic = true },
		-- ["@markup.math"] = { fg = colors.fg },

		-- @markup.link            text references, footnotes, citations, etc.
		-- @markup.link.label      link, reference descriptions
		-- @markup.link.url        URL-style links
		["@markup.link"] = { fg = colors.purple },
		["@markup.link.label"] = { fg = colors.blue },
		["@markup.link.url"] = { link = "Underlined" },

		-- @markup.list            list markers
		-- @markup.list.checked    checked todo-style list markers
		-- @markup.list.unchecked  unchecked todo-style list markers
		["@markup.list"] = { fg = colors.yellow },

		-- @diff.plus              added text (for diff files)
		-- @diff.minus             deleted text (for diff files)
		-- @diff.delta             changed text (for diff files)

		["@text"] = { link = "@markup" },
		["@text.strong"] = { link = "@markup.strong" },
		["@text.emphasis"] = { link = "@markup.italic" },
		["@text.underline"] = { link = "@markup.underline" },
		["@text.title"] = { link = "@markup.heading" },
		["@text.literal"] = { link = "@markup.raw" },
		["@text.diff.add"] = { link = "@diff.plus" },
		["@text.diff.delete"] = { link = "@diff.minus" },
		["@text.uri"] = { link = "@markup.link.url" },
		["@text.math"] = { link = "@markup.math" },
		["@text.reference"] = { link = "@markup.link" },
		["@text.environment"] = { link = "@markup.environment" },
		["@text.environment.name"] = { link = "@markup.environment.name" },
		["@text.todo"] = { link = "@comment.todo" },
		["@text.warning"] = { link = "@comment.warning" },
		["@text.note"] = { link = "@comment.note" },
		["@text.danger"] = { link = "@comment.error" },
	}
	local lsp = {
		-- -- LSP Semantic Token Groups
		["@lsp.type.namespace"] = { link = "@namespace" },
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@type" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.interface"] = { link = "@type" },
		["@lsp.type.struct"] = { link = "@type" },
		["@lsp.type.typeParameter"] = { link = "@type" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.variable"] = { link = "@lsp.type.variable" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@method" },
		["@lsp.type.macro"] = { link = "@constant.macro" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.string"] = { link = "@string" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.regexp"] = { link = "@string.regex" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.decorator"] = { link = "@function.macro" },
		["@lsp.mod.deprecated"] = { strikethrough = true },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
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

		DiagnosticError = { fg = colors.red },
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
		-- ["@lsp.type.class.c"] = { link = "cType" },
	}

	local plugins = {
		-- BlinkCmpLabelDeprecated = { strikethrough = true },
		-- BlinkCmpKind = { fg = colors.purple },
		-- -- BlinkCmpKindFunction = { fg = colors.purple, bg = "#f0d2a0" },
		-- -- BlinkCmpLabel = { bg = "" },
		-- BlinkCmpLabelMatch = { fg = colors.purple, bold = true },
		-- BlinkCmpMenuSelection = { bg = colors.bg4 },
		-- BlinkCmpScrollBarThumb = { link = "BlinkCmpMenuSelection" },
		-- BlinkCmpMenu = { bg = colors.bg3 },
		-- BlinkCmpSource = { fg = colors.bg5 },
		-- BlinkCmpDoc = { bg = colors.bg3 },
		-- -- BlinkCmpLabelDetail = { bg = colors.bg },
		-- BlinkCmpLabelDescription = { bg = colors.bg },
		-- BlinkCmpKindText = { fg = colors.hue23 },
		-- BlinkCmpKindVariable = { fg = colors.blue },
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
		NeoTreeGitModified = { fg = colors.cyan, bold = false },
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
		-- NeoTreeTabSeparatorInactive = { fg = colors.bg, bg = colors.bg5 },

		MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.blue },
		MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.hue60 },
		MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.hue30 },
		MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.red },
		MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.hue25 },
		MiniStatuslineDevinfo = { fg = colors.fg, bg = colors.bg3 },
		MiniStatuslineFilename = { fg = colors.bg, bg = colors.bg10 },
		MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.bg3 },
		-- MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.blue },
		-- MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.hue60 },
		-- MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.hue30 },
		-- MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.red },
		-- MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.hue25 },
		-- MiniStatuslineDevinfo = { fg = colors.bg, bg = colors.yellow_green },
		-- MiniStatuslineFilename = { fg = colors.bg, bg = colors.hue1 },
		-- MiniStatuslineFileinfo = { fg = colors.fg, bg = colors.bg3 },
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
		NavicIconsFile = { fg = colors.blue },
		NavicIconsModule = { fg = colors.purple },
		NavicIconsNamespace = { fg = colors.blue },
		NavicIconsPackage = { fg = colors.purple },
		NavicIconsClass = { fg = colors.blue },
		NavicIconsMethod = { fg = colors.blue },
		NavicIconsProperty = { fg = colors.blue },
		NavicIconsField = { fg = colors.blue },
		NavicIconsConstructor = { fg = colors.blue },
		NavicIconsEnum = { fg = colors.blue },
		NavicIconsInterface = { fg = colors.blue },
		NavicIconsFunction = { fg = colors.blue },
		NavicIconsVariable = { fg = colors.blue },
		NavicIconsConstant = { link = "Constant" },
		NavicIconsString = { link = "String" },
		NavicIconsNumber = { link = "Number" },
		NavicIconsBoolean = { link = "Boolean" },
		NavicIconsArray = { fg = colors.blue },
		NavicIconsObject = { fg = colors.hue5 },
		NavicIconsKey = { fg = colors.blue },
		NavicIconsNull = { fg = colors.blue },
		NavicIconsEnumMember = { fg = colors.blue },
		NavicIconsStruct = { fg = colors.blue },
		NavicIconsEvent = { fg = colors.blue },
		NavicIconsOperator = { link = "Operator" },
		NavicIconsTypeParameter = { fg = colors.blue },
		NavicText = { fg = colors.blue },
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

		-- GitSigns
		GitSignsAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
	}
	return vim.tbl_deep_extend("force", syntax, editor, treesitter, lsp, plugins)
end

function M.loader()
	if vim.g.colors_name then
		vim.cmd("hi clear")
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

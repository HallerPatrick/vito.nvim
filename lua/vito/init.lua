local vito_colors = require("vito.colors").colors
local vito_themes = require("vito.colors").themes

local cmd = vim.cmd
local fn = vim.fn

local defaults = {
    comment_italics = true,
    float_background = false,
    reverse_visual = false
}

local M = {
    Color = require("colorbuddy.init").Color,
    colors = require("colorbuddy.init").colors,
    Group = require("colorbuddy.init").Group,
    groups = require("colorbuddy.init").groups,
    styles = require("colorbuddy.init").styles
}

function M.setup(opts)
    if not opts then opts = {} end

    for k, v in pairs(defaults) do if opts[k] == nil then opts[k] = v end end

    -- typos are annoying
    for k, _ in pairs(opts) do
        if defaults[k] == nil then print("vito: unknown setting: ", k) end
    end

    -- only needed to clear when not the default colorscheme
    if vim.g.colors_name then vim.cmd("hi clear") end

    if fn.exists("syntax_on") then cmd("syntax reset") end

    vim.g.colors_name = "vito"

    local Color = M.Color
    local colors = M.colors
    local Group = M.Group
    local groups = M.groups
    local styles = M.styles

    Color.new("black", vito_colors.black)
    Color.new("black1", vito_colors.black1)
    Color.new("black2", vito_colors.black2)
    Color.new("black3", vito_colors.black3)
    Color.new("white3", vito_colors.white3)
    Color.new("white2", vito_colors.white2)
    Color.new("white1", vito_colors.white1)
    Color.new("white", vito_colors.white)
    Color.new("purple6", vito_colors.purple6)

    Color.new("primary", vito_themes.primary)

    Color.new("baseForeground", vito_themes.foreground)
    Color.new("activeForeground", vito_themes.activeForeground)
    Color.new("secondaryForeground", vito_themes.secondaryForeground)
    Color.new("ignored", vito_themes.ignored)
    Color.new("border", vito_themes.border)

    Color.new("background", vito_themes.background)
    Color.new("activeBackground", vito_themes.activeBackground)

    Color.new("lowBackground", vito_themes.lowBackground)
    Color.new("lowActiveBackground", vito_themes.lowActiveBackground)
    Color.new("lowBorder", vito_themes.lowBorder)

    Color.new("comment", vito_themes.comment)
    Color.new("string", vito_themes.string)
    Color.new("variable", vito_themes.variable)
    Color.new("keyword", vito_themes.keyword)
    Color.new("number", vito_themes.number)
    Color.new("boolean", vito_themes.boolean)
    Color.new("operator", vito_themes.operator)
    Color.new("func", vito_themes.func)
    Color.new("constant", vito_themes.constant)
    Color.new("class", vito_themes.class)
    Color.new("interface", vito_themes.interface)
    Color.new("type", vito_themes.type)
    Color.new("builtin", vito_themes.builtin)
    Color.new("property", vito_themes.property)
    Color.new("namespace", vito_themes.namespace)
    Color.new("punctuation", vito_themes.punctuation)
    Color.new("decorator", vito_themes.decorator)
    Color.new("regex", vito_themes.regex)

    Group.new("Comment", colors.comment, colors.none,
              opts.comment_italics and styles.italic or styles.NONE)
    Group.new("String", colors.string)
    Group.new("Variable", colors.variable)
    Group.new("Keyword", colors.keyword)
    Group.new("Number", colors.number)
    Group.new("Boolean", colors.boolean)
    Group.new("Operator", colors.operator)
    Group.new("Function", colors.func)
    Group.new("Constant", colors.constant)
    Group.new("Class", colors.class)
    Group.new("Interface", colors.interface)
    Group.new("Type", colors.type)
    Group.new("Builtin", colors.builtin)
    Group.new("Property", colors.property)
    Group.new("Namespace", colors.namespace)
    Group.new("Punctuation", colors.punctuation)
    Group.new("Decorator", colors.decorator)
    Group.new("Regex", colors.regex)

    Color.new("green", vito_themes.green)
    Color.new("cyan", vito_themes.cyan)
    Color.new("blue", vito_themes.blue)
    Color.new("red", vito_themes.red)
    Color.new("orange", vito_themes.orange)
    Color.new("yellow", vito_themes.yellow)
    Color.new("magenta", vito_themes.magenta)

    Color.new("bg", colors.background)
    Group.new("Error", colors.red)
    Group.new("Warning", colors.yellow)
    Group.new("Information", colors.blue)
    Group.new("Hint", colors.cyan)

    -- normal non-current text
    Group.new("Normal", colors.baseForeground, colors.background)
    Group.new("NormalNC", colors.secondaryForeground, colors.background)
    if opts.float_background == false then
        Group.new("NormalFloat", colors.none)
    end

    Group.new("Identifier", colors.class)

    -- any statement, conditional, repeat (for, do while), label, operator
    Group.new("Statement", colors.green)
    Group.new("PreProc", colors.red) -- was orange
    Group.new("Special", colors.property) -- was red
    Group.new("SpecialKey", colors.property)
    Group.new("Underlined", colors.red)
    Group.new("Strikethrough", colors.activeBackground, colors.none,
              styles.strikethrough)
    Group.new("Ignore", colors.activeBackground)
    Group.new("Todo", colors.magenta, colors.none, styles.bold)

    Group.link("Include", groups.PreProc)
    Group.link("Macro", groups.PreProc)
    Group.link("Delimiter", groups.Special)
    Group.link("Repeat", groups.Statement)
    Group.link("Conditional", groups.Statement)
    Group.link("Define", groups.PreProc)
    Group.link("Character", groups.Constant)
    Group.link("Float", groups.Constant)
    Group.link("Debug", groups.Special)
    Group.link("Label", groups.Statement)
    Group.link("Exception", groups.Statement)
    Group.link("StorageClass", groups.Type)

    Group.link("SpecialChar", groups.Special)
    Group.new("SpecialKey", colors.black3, colors.black1, styles.bold)
    Group.link("String", groups.String)
    Group.new("NonText", colors.black3, colors.none, styles.bold)
    Group.new("StatusLine", colors.lowBackground, colors.black1, styles.reverse)
    Group.new("StatusLineNC", colors.lowActiveBackground, colors.black1,
              styles.reverse)
    Group.new("Visual", colors.none, colors.black3,
              opts.reverse_visual and styles.reverse or styles.none)
    Group.new("Directory", colors.blue)
    Group.new("ErrorMsg", colors.red, colors.none, styles.reverse)

    Group.new("IncSearch", colors.orange, colors.none, styles.standout)
    Group.new("Search", colors.yellow, colors.none, styles.reverse)

    Group.new("MoreMsg", colors.blue, colors.none, styles.NONE)
    Group.new("ModeMsg", colors.blue, colors.none, styles.NONE)
    Group.new("Question", colors.cyan, colors.none, styles.bold)
    Group.new("VertSplit", colors.black3, colors.none, styles.NONE)
    Group.new("Title", colors.orange, colors.none, styles.bold)
    Group.new("VisualNOS", colors.none, colors.black1, styles.reverse)
    Group.new("WarningMsg", colors.orange, colors.none, styles.bold)
    Group.new("WildMenu", colors.baseForeground, colors.black1, styles.reverse)
    Group.new("Folded", colors.secondaryForeground, colors.black1, styles.bold,
              colors.black3)
    Group.new("FoldColumn", colors.secondaryForeground, colors.black1)

    Group.new("DiffAdd", colors.green, colors.black1, styles.bold, colors.green)
    Group.new("DiffChange", colors.yellow, colors.black1, styles.bold,
              colors.yellow)
    Group.new("DiffDelete", colors.red, colors.black1, styles.bold)
    Group.new("DiffText", colors.blue, colors.black1, styles.bold, colors.blue)

    Group.new("SignColumn", colors.secondaryForeground, colors.none, styles.NONE)
    Group.new("Conceal", colors.blue, colors.none, styles.NONE)

    Group.new("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
    Group.new("SpellCap", colors.none, colors.none, styles.undercurl,
              colors.purple6)
    Group.new("SpellRare", colors.none, colors.none, styles.undercurl,
              colors.cyan)
    Group.new("SpellLocal", colors.none, colors.none, styles.undercurl,
              colors.yellow)
    -- These are nice alternatives if you like a little more color
    -- Group.new("SpellBad", colors.purple6, colors.bg, styles.undercurl)
    -- Group.new("SpellCap", colors.purple6, colors.bg, styles.undercurl)
    -- Group.new("SpellLocal", colors.yellow, colors.bg, styles.undercurl)
    -- Group.new("SpellRare", colors.cyan, colors.bg, styles.undercurl)

    -- pum (popup menu)
    Group.new("Pmenu", groups.Normal, colors.black1, styles.none) -- popup menu normal item
    Group.new("PmenuSel", colors.activeBackground, colors.baseForeground,
              styles.reverse) -- selected item
    Group.new("PmenuSbar", colors.black1, colors.none, styles.reverse)
    Group.new("PmenuThumb", colors.black2, colors.none, styles.reverse)

    -- be nice for this float border to be cyan if active
    Group.new("FloatBorder", colors.primary)

    Group.new("TabLine", colors.secondaryForeground, colors.black1, styles.NONE,
              colors.secondaryForeground)
    Group.new("TabLineFill", colors.secondaryForeground, colors.black1)
    Group.new("TabLineSel", colors.yellow, colors.bg)
    Group.new("TabLineSeparatorSel", colors.cyan, colors.none)

    Group.new("LineNr", colors.ignored:light():light(), colors.background,
              styles.NONE)
    Group.new("CursorLine", colors.none, colors.lowActiveBackground, styles.NONE)
    Group.new("CursorLineNr", colors.activeForeground, colors.none, styles.NONE)
    Group.new("Cursor", colors.black3, colors.secondaryForeground, styles.NONE)
    Group.link("lCursor", groups.Cursor)
    Group.link("TermCursor", groups.Cursor)
    Group.new("TermCursorNC", colors.black3, colors.activeBackground)

    Group.new("MatchParen", colors.red, colors.activeBackground, styles.bold)

    -- vim highlighting
    Group.link("vimVar", groups.Identifier)
    Group.link("vimFunc", groups.Identifier)
    Group.link("vimUserFunc", groups.Identifier)
    Group.link("helpSpecial", groups.Special)
    Group.link("vimSet", groups.Normal)
    Group.link("vimSetEqual", groups.Normal)
    Group.new("vimCommentString", colors.purple6)
    Group.new("vimCommand", colors.yellow)
    Group.new("vimCmdSep", colors.blue, colors.NONE, styles.bold)
    Group.new("helpExample", colors.baseForeground)
    Group.new("helpOption", colors.cyan)
    Group.new("helpNote", colors.magenta)
    Group.new("helpVim", colors.magenta)
    Group.new("helpHyperTextJump", colors.blue, colors.NONE, styles.underline)
    Group.new("helpHyperTextEntry", colors.green)
    Group.new("vimIsCommand", colors.black3)
    Group.new("vimSynMtchOpt", colors.yellow)
    Group.new("vimSynType", colors.cyan)
    Group.new("vimHiLink", colors.blue)
    Group.new("vimGroup", colors.blue, colors.NONE,
              styles.underline + styles.bold)

    Group.new("gitcommitSummary", colors.green)
    Group.new("gitcommitComment", colors.activeBackground, colors.NONE,
              styles.italic)
    Group.link("gitcommitUntracked", groups.gitcommitComment)
    Group.link("gitcommitDiscarded", groups.gitcommitComment)
    Group.new("gitcommitSelected", groups.gitcommitComment)
    Group.new("gitcommitUnmerged", colors.green, colors.NONE, styles.bold)
    Group.new("gitcommitOnBranch", colors.activeBackground, colors.NONE,
              styles.bold)
    Group.new("gitcommitBranch", colors.magenta, colors.NONE, styles.bold)
    Group.link("gitcommitNoBranch", groups.gitcommitBranch)
    Group.new("gitcommitDiscardedType", colors.red)
    Group.new("gitcommitSelectedType", colors.green)
    Group.new("gitcommitHeader", colors.activeBackground)
    Group.new("gitcommitUntrackedFile", colors.cyan)
    Group.new("gitcommitDiscardedFile", colors.red)
    Group.new("gitcommitSelectedFile", colors.green)
    Group.new("gitcommitUnmergedFile", colors.yellow)
    Group.new("gitcommitFile", colors.secondaryForeground)
    Group.link("gitcommitDiscardedArrow", groups.gitCommitDiscardedFile)
    Group.link("gitcommitSelectedArrow", groups.gitCommitSelectedFile)
    Group.link("gitcommitUnmergedArrow", groups.gitCommitUnmergedFile)

    Group.link("diffAdded", groups.Statement)
    Group.link("diffLine", groups.Identifier)

    Group.link("DiagnosticError", groups.Error)
    Group.new("DiagnosticWarn", colors.yellow)
    Group.new("DiagnosticInfo", colors.cyan)
    Group.new("DiagnosticHint", colors.green)
    Group.new("DiagnosticUnderlineError", colors.none, colors.none,
              styles.underline)
    Group.new("DiagnosticUnderlineWarn", colors.none, colors.none,
              styles.underline)
    Group.new("DiagnosticUnderlineInfo", colors.none, colors.none,
              styles.underline)
    Group.new("DiagnosticUnderlineHint", colors.none, colors.none,
              styles.underline)
    Group.link("DiagnosticVirtualTextHint", groups.Comment)
    Group.link("DiagnosticTextWarn", groups.WarningMsg)

    Group.new("LspReferenceRead", colors.none, colors.none, styles.underline)
    Group.link("LspReferenceText", groups.LspReferenceRead)
    Group.new("LspReferenceWrite", colors.none, colors.none, styles.underline)
    Group.new("LspFloatWinBorder", colors.primary)
    Group.new("LspLinesDiagBorder", colors.primary)

    -- plugins
    require("vito.plugins.cmp")
    require("vito.plugins.telescope")
    require("vito.plugins.which-key")
    require("vito.plugins.indent_blankline")

    -- group names with an ampersand throw an error until they gain support in 0.8.0
    if fn.has("nvim-0.8.0") then
        -- XML-like tags
        Group.new("@tag", colors.green)
        Group.new("@tag.attribute", colors.property)
        Group.new("@tag.delimiter", colors.punctuation)

        Group.new("@none", colors.none)
        Group.link("@comment", groups.Comment)
        Group.link("@error", groups.Error)
        Group.link("@preproc", groups.PreProc)
        Group.link("@define", groups.Define)
        Group.link("@operator", groups.Operator)

        Group.new("@punctuation", colors.punctuation)
        Group.link("@punctuation.delimiter", groups.Delimiter)
        Group.new("@punctuation.bracket", colors.cyan)
        Group.link("@punctuation.special", groups.Builtin)

        Group.link("@string", groups.String)
        Group.link("@string.regex", groups.Regex)
        Group.link("@string.escape", groups.String)
        Group.link("@string.special", groups.Special)

        Group.link("@character", groups.Character)
        Group.link("@character.special", groups.Special)

        Group.link("@boolean", groups.Builtin)
        Group.link("@number", groups.Number)
        Group.link("@float", groups.Float)

        Group.link("@function", groups.Function)
        Group.link("@function.call", groups.Function)
        Group.link("@function.builtin", groups.Function)
        Group.link("@function.macro", groups.Macro)

        Group.link("@method", groups.Function)
        Group.link("@method.call", groups.Function)

        Group.link("@constructor", groups.Function)
        -- not sure about this one, special is true and kinda nice?
        Group.link("@parameter", groups.Variable)

        Group.link("@keyword", groups.Keyword)
        Group.link("@keyword.function", groups.Operator)
        Group.link("@keyword.operator", groups.Operator)
        Group.link("@keyword.return", groups.Keyword)

        Group.link("@conditional", groups.Conditional)
        Group.link("@repeat", groups.Repeat)
        Group.link("@debug", groups.Debug)
        Group.link("@label", groups.Label)
        Group.link("@include", groups.Include)
        Group.link("@exception", groups.Exception)

        Group.link("@type", groups.Type)
        Group.link("@type.builtin", groups.Type)
        Group.link("@type.qualifier", groups.Builtin)
        Group.link("@type.definition", groups.Type)

        Group.link("@storageclass", groups.Keyword)
        Group.link("@attribute", groups.Function)
        Group.link("@field", groups.Identifier)
        Group.link("@property", groups.Property)

        Group.new("@variable", colors.variable)
        Group.link("@variable.builtin", groups.Variable)

        Group.link("@constant", groups.Constant)
        Group.link("@constant.builtin", groups.Constant)
        Group.link("@constant.macro", groups.Constant)

        Group.link("@namespace", groups.Namespace)
        Group.link("@symbol", groups.Identifier)

        Group.link("@text", groups.Normal)
        Group.new("@text.strong", colors.baseForeground, colors.none,
                  styles.bold)
        Group.new("@text.emphasis", colors.white, colors.none, styles.bold)
        Group.link("@text.underline", groups.Underlined)
        Group.link("@text.strike", groups.Strikethrough)
        Group.link("@text.title", groups.Title)
        Group.link("@text.literal", groups.String)
        Group.link("@text.uri", groups.Underlined)
        Group.link("@text.math", groups.Special)
        Group.link("@text.environment", groups.Macro)
        Group.link("@text.environment.name", groups.Type)
        Group.link("@text.reference", groups.String)

        Group.link("@text.todo", groups.Todo)
        Group.link("@text.note", groups.Comment)
        Group.link("@text.warning", groups.WarningMsg)
        Group.new("@text.danger", colors.red, colors.none, styles.bold)
    end

    function M.translate(group)
        if fn.has("nvim-0.6.0") == 0 then return group end

        if not string.match(group, "^LspDiagnostics") then return group end

        local translated = group
        translated = string.gsub(translated, "^LspDiagnosticsDefault",
                                 "Diagnostic")
        translated = string.gsub(translated, "^LspDiagnostics", "Diagnostic")
        translated = string.gsub(translated, "Warning$", "Warn")
        translated = string.gsub(translated, "Information$", "Info")
        return translated
    end

    local lspColors = {
        Error = groups.Error,
        Warning = groups.Warning,
        Information = groups.Information,
        Hint = groups.Hint
    }
    for _, lsp in pairs({"Error", "Warning", "Information", "Hint"}) do
        local lspGroup = Group.new(M.translate("LspDiagnosticsDefault" .. lsp),
                                   lspColors[lsp])
        Group.link(M.translate("LspDiagnosticsVirtualText" .. lsp), lspGroup)
        Group.new(M.translate("LspDiagnosticsUnderline" .. lsp), colors.none,
                  colors.none, styles.undercurl, lspColors[lsp])
    end

    for _, name in pairs({
        "LspReferenceText", "LspReferenceRead", "LspReferenceWrite"
    }) do Group.link(M.translate(name), groups.CursorLine) end

    return M
end

return M

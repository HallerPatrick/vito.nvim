local colors = require("colorbuddy.init").colors
local Group = require("colorbuddy.init").Group
local groups = require("colorbuddy.init").groups

Group.new("TelescopeMatching", colors.orange, groups.Special, groups.Special, groups.Special)
Group.new("TelescopeBorder", groups.FloatBorder) -- float border not quite dark enough, maybe that needs to change?
Group.new("TelescopePromptBorder", groups.FloatBorder) -- active border lighter for clarity
Group.new("TelescopeTitle", groups.Normal) -- separate them from the border a little, but not make them pop
Group.new("TelescopePromptPrefix", groups.Normal) -- default is groups.Identifier
Group.link("TelescopeSelection", groups.CursorLine)
Group.new("TelescopeSelectionCaret", colors.cyan)

local colors = require("colorbuddy.init").colors
local Group = require("colorbuddy.init").Group
local styles = require("colorbuddy.init").styles


Group.new("WhichKeySeparator", colors.activeBackground, colors.black1, styles.bold)
Group.new("WhichKeyDesc", colors.cyan, colors.black1)

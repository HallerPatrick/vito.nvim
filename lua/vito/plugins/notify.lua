local colors = require("colorbuddy.init").colors
local Group = require("colorbuddy.init").Group
-- local groups = require("colorbuddy.init").groups
local styles = require("colorbuddy.init").styles

Group.new("NotifyINFOBorder", colors.activeBackground, colors.white, styles.bold)
Group.new("NotifyERRORBorder", colors.activeBackground, colors.red, styles.bold)
Group.new("NotifyWARNBorder", colors.activeBackground, colors.black1, styles.bold)
Group.new("NotifyDEBUGBorder", colors.activeBackground, colors.black1, styles.bold)

-- Group.new("NotifyERRORBorder", colors.
-- Group.new("NotifyWARNBorder"
Group.new("NotifyINFOBorder", colors.white)
-- Group.new("NotifyDEBUGBorder"
-- Group.new("NotifyTRACEBorder"
-- Group.new("NotifyERRORIcon"
-- Group.new("NotifyWARNIcon"
-- Group.new("NotifyINFOIcon"
-- Group.new("NotifyDEBUGIcon"
-- Group.new("NotifyTRACEIcon"
-- Group.new("NotifyERRORTitle"
-- Group.new("NotifyWARNTitle"
-- Group.new("NotifyINFOTitle"
-- Group.new("NotifyDEBUGTitle"
-- Group.new("NotifyTRACETitle"
--


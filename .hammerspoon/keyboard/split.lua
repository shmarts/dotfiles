local cjson = require "cjson"

-- Send message(s) to a running instance of yabai.
local function yabai(commands)
  for _, cmd in ipairs(commands) do
    os.execute("yabai -m " .. cmd)
  end
end


local function alt(key, commands)
  hs.hotkey.bind({ "alt" }, key, function()
    hs.alert.show("Alt + " .. key)
    yabai(commands)
  end)
end


function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

hs.hotkey.bind({ "alt", "ctrl" }, "W", function()
  local windows = hs.window.allWindows()
  local logger = hs.logger.new('split', 'debug')
  -- logger.i('windows: ' .. dump(windows))
  local d = os.execute('yabai -m query --displays --window')
  hs.alert.show(d)
end)

alt("f", { "window --grid 1:1:0:0:1:1" })

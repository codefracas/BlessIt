bi.log = { }

-- https://opensource.com/article/22/11/iterate-over-tables-lua

local colors = {
    -- classes
    Druid = "|cAAFF7D0A",
    Hunter = "|cAAABD473",
    Mage = "|cAA69CCF0",
    Paladin = "|caaf58cba",
    Priest = "|cAAFFFFFF",
    Rogue = "|cAAFFF569",
    Shaman = "|cAA0070DE",
    Warlock = "|cAA9482C9",
    Warrior = "|cAAC79C6E",

    -- item quality
    Poor = "|cAA889D9D",
    Common = "|cAAFFFFFF",
    Uncommon = "|cAA1EFF0C",
    Rare = "|cAA0070FF",
    Superior = "|cAAA335EE",
    Legendary = "|cAAFF8000",
    Heirloom = "|cAAE6CC80",

    -- palette
    Blue = "|cff0F52BA",
    LightGreen = "|cff80FF77",
    LightOrange = "|cffFEB781",
    LightRed = "|cffFF7777",
    LightYellow = "|cffffff70",
    Gray = "|cff808080",
    Green = "|cff00ff00",
    DarkGreen = "|cff009900",
    SickGreen = "|cffafd437",
    LightGray = "|cffBBBBBB",
    Magenta = "|cffff00ff",
    Orange = "|cFFFF6F00",
    Purple = "|cAABD45ED",
    Red = "|cffff0000",
    White = "|cffffffff",
    Yellow = "|cffffff00",

    Clear = "|r",
}

function bi.log.Format3Var(title, var1, val1, var2, val2, var3, val3)
    local o =
        bi.log.C("LightGray") .. title .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var1 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val1 .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var2 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val2 .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var3 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val3 .. bi.log.C("Clear")
    return o;
end

function bi.log.Format2Var(title, var1, val1, var2, val2)
    local o =
        bi.log.C("LightGray") .. title .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var1 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val1 .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var2 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val2 .. bi.log.C("Clear")
    return o;
end

function bi.log.Format1Var(title, var1, val1)
    local o =
        bi.log.C("LightGray") .. title .. bi.log.C("Clear") ..
        bi.log.C("Orange") .. var1 .. bi.log.C("Clear") ..
        bi.log.C("LightGreen") .. val1 .. bi.log.C("Clear")
    return o;
end

function bi.log.Damage(event, arg1)
    if (event ~= nil and arg1 ~= nil) then
        local o =
            bi.log.C("LightYellow") .. arg1 .. bi.log.C("Clear")
        return o;
    end
end

function bi.log.DamageToSelf(event, arg1)
    if (event ~= nil and arg1 ~= nil) then
        local o =
            bi.log.C("LightRed") .. arg1 .. bi.log.C("Clear")
        return o;
    end
end

function bi.log.Healing()
    if (event ~= nil and arg1 ~= nil) then
        local o =
            bi.log.C("LightGreen") .. arg1 .. bi.log.C("Clear")
        return o;
    end
end

function bi.log.UnpackEvent(event, arg1)
    if     (event ~= nil and arg1 == nil) then
        bi.log.Log("0a: " .. event)
    elseif (event ~= nil and arg1 ~= nil) then
        bi.log.Log("1a: " .. event .. " // " .. arg1)
    end
end

function bi.log.Log(a)
    --DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0[DEBUG] |cffffffff" .. a)
    --print('console == ' .. VRGO.console)
    --print('playerclass == ' .. VRGO.playerclass)

    --if VRGO.Console == 1 then
    --    ChatFrame1:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 2 then
    --    ChatFrame2:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 3 then
    --    ChatFrame3:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 4 then
    --    --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_playerclass) .. "[VR] |cffffffff" .. a)
    --    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_PlayerClass) .. "[VR] |cffffffff" .. a)
    --    return;
    --end

    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. a)
end

function bi.log.Ability(ability, notification, delta)

    if not getglobal("Ability" .. ability) then
        DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. notification)
        setglobal("Ability" .. ability, GetTime())
    end

    local timestamp = tonumber(getglobal("Ability" .. ability))
    --local dtime = 1000

    -- local arse = 3406438.001
    -- local dtime = 3404438.001

    if getglobal("Ability" .. ability) then
        --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. "Ability" .. ability .. " has timestamp " .. getglobal("Ability" .. ability))

        --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. "arse = ".. arse)



        if bi.api.MilliSecondsSince(timestamp) > delta then
            DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. notification)
            setglobal("Ability" .. ability, GetTime())
        end
    else
        --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. "no have mr fawlty")
        setglobal("Ability" .. ability, GetTime())      -- creates global var and assigns timestamp to it
    end

    --setglobal(aaa, 1)

end

function bi.log.Action(a)
    --DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0[DEBUG] |cffffffff" .. a)
    --print('console == ' .. VRGO.console)
    --print('playerclass == ' .. VRGO.playerclass)

    if not GOg("WLAction") or (bi.wr.isRunning and GOg("SuppressBlessItLogging")) then
        return;
    end

    --if VRGO.Console == 1 then
    --    ChatFrame1:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 2 then
    --    ChatFrame2:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 3 then
    --    ChatFrame3:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 4 then
    --    --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_playerclass) .. "[VR] |cffffffff" .. a)
    --    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_PlayerClass) .. "[VR] |cffffffff" .. a)
    --    return;
    --end

    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. a)
end

function bi.log.Debug(a)
    --DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0[DEBUG] |cffffffff" .. a)
    --print('console == ' .. VRGO.console)
    --print('playerclass == ' .. VRGO.playerclass)

    if true then
        return;
    end

    --if VRGO.Console == 1 then
    --    ChatFrame1:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 2 then
    --    ChatFrame2:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 3 then
    --    ChatFrame3:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 4 then
    --    --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_playerclass) .. "[VR] |cffffffff" .. a)
    --    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_PlayerClass) .. "[VR] |cffffffff" .. a)
    --    return;
    --end

    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C("LightGray") .. "[VR] " .. bi.log.C("LightGray") .. a)
end

function bi.log.Report(ability, notification, delta)
    if not getglobal("AbilityReport" .. ability) then
        setglobal("AbilityReport" .. ability, GetTime() - delta)
    end

    local timestamp = tonumber(getglobal("AbilityReport" .. ability))

    if bi.api.MilliSecondsSince(timestamp) > delta then
        --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. notification)
        bi.log.Say(notification)
        setglobal("AbilityReport" .. ability, GetTime())
    end
end

function bi.log.LogThrottle(ability, notification, delta)
    if not getglobal("AbilityReport" .. ability) then
        setglobal("AbilityReport" .. ability, GetTime() - delta)
    end

    local timestamp = tonumber(getglobal("AbilityReport" .. ability))

    if bi.api.MilliSecondsSince(timestamp) > delta then
        --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. notification)
        bi.log.Log(notification)
        setglobal("AbilityReport" .. ability, GetTime())
    end
end

function bi.log.Say(a)
    SendChatMessage(a, "SAY");
end

function bi.log.Emote(a)
    SendChatMessage(a, "EMOTE");
end

function bi.log.TargetChangeAnnounce()
    if not GOg("VerboseTargeting") or (bi.wr.isRunning and GOg("SuppressBlessItLogging")) then
        return false;
    end
    if UnitExists('target') then
        if bi.mobdb.Match() then
            if (UnitIsEnemy("player","target")) then
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("Red") .. "[" .. bi.log.C("LightRed") .. bi.api.TargetName .. bi.log.C("Red") .."]")
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("Red") .. "[" .. bi.log.C("LightRed") .. bi.api.TargetName .. bi.log.C("Red") .."]")
            elseif (UnitCanAttack("player", "target")) then
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("Yellow") .. "[" .. bi.log.C("LightYellow") .. bi.api.TargetName .. bi.log.C("Yellow") .."]")
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("Yellow") .. "[" .. bi.log.C("LightYellow") .. bi.api.TargetName .. bi.log.C("Yellow") .."]")
            else
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("Green") .. "[" .. bi.log.C("LightGreen") .. bi.api.TargetName .. bi.log.C("Green") .."]")
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("Green") .. "[" .. bi.log.C("LightGreen") .. bi.api.TargetName .. bi.log.C("Green") .."]")
            end
        else
            if (UnitIsEnemy("player","target")) then
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("LightRed") .. bi.api.TargetName)
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("LightRed") .. bi.api.TargetName)
            elseif (UnitCanAttack("player", "target")) then
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("LightYellow") .. bi.api.TargetName)
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("LightYellow") .. bi.api.TargetName)
            else
                DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target acquired: " .. bi.log.C("LightGreen") .. bi.api.TargetName)
                ----bi.api.XMLSetText("GeneralOptionsFrame", "_Target", bi.log.C("LightGreen") .. bi.api.TargetName)
            end
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C("Legendary") .. "Target cleared.")
    end
end

function bi.log.Warn(a)
    --DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0[DEBUG] |cffffffff" .. a)
    --print('console == ' .. VRGO.console)
    --print('playerclass == ' .. VRGO.playerclass)

    -- if not VRGO["WLDebug"] then
    --     return;
    -- end

    --if VRGO.Console == 1 then
    --    ChatFrame1:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 2 then
    --    ChatFrame2:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 3 then
    --    ChatFrame3:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
    --    return;
    --elseif VRGO.Console == 4 then
    --    --DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_playerclass) .. "[VR] |cffffffff" .. a)
    --    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(BlessIt_PlayerClass) .. "[VR] |cffffffff" .. a)
    --    return;
    --end

    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C("LightOrange") .. "[VR] " .. bi.log.C("LightOrange") .. a)
end

---[ bi.log.LogEvent ]---------------------------------------------------------
function bi.log.LogEvent(a)
    if not GOg("WLEvent") then
        return;
    end
    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] |cffffffff" .. a)
end

---[ bi.log.LogBoolVarToggle ]-------------------------------------------------
function bi.log.LogBoolVarToggle(var, state)
    if state then
        DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C('LightGray') .. var .. ":" .. bi.log.C("LightGreen") .. tostring(state))
    else
        DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C('LightGray') .. var .. ":" .. bi.log.C("LightRed") .. tostring(state))
    end
end

---[ bi.log.LogStateVarChange ]------------------------------------------------
function bi.log.LogStateVarChange()

end

---[ bi.log.LogStateVarChange ]------------------------------------------------
function bi.log.LogIntVarChange(var, val)
    DEFAULT_CHAT_FRAME:AddMessage(bi.log.C(UnitClass('Player')) .. "[VR] " .. bi.log.C('LightGray') .. var .. ":" .. bi.log.C("LightGreen") .. tostring(val))
end

---[ bi.log.C ]----------------------------------------------------------------
function bi.log.C(color)
    --print('colors')
    for k, v in pairs(colors) do
        --print(k .. " " .. v)
        if color == k then
            return(v)
        end
    end
end

function BlessIt_WLPrint(a)
    DEFAULT_CHAT_FRAME:AddMessage("|cff69ccf0[VR] |cffffffff" .. a)
end
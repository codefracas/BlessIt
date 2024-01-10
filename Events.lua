BlessIt_EventCollection = {
    BlessIt_EventsMandatory = {
        "PLAYER_TARGET_CHANGED",
        "VARIABLES_LOADED",
        "VARIABLES_LOADED",
        "UNIT_PET",
        "PARTY_MEMBERS_CHANGED",
        "PARTY_LEADER_CHANGED",
        "RAID_ROSTER_UPDATE",
        "PLAYER_ENTERING_WORLD",
        "CHARACTER_POINTS_CHANGED",

        -- for backstab error messages
        "COMBAT_LOG_EVENT_UNFILTERED",
        "COMBAT_LOG_EVENT",
        "CHAT_MSG_SPELL_FAILED_LOCALPLAYER",

        -- for sync
        "CHAT_MSG_ADDON",

        -- 1.5.beta.2 this better not be off DOH
        "SPELLS_CHANGED",
    },
    BlessIt_EventsSwitched = {
        --"UNIT_COMBAT",
        "CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS",
        "CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES",
        "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS",
        "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES",
        "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS",
        "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES",
        "CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS",
        "CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES",
        "CHAT_MSG_COMBAT_HONOR_GAIN",
        "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS",
        "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES",
        "CHAT_MSG_COMBAT_LOG_ERROR",
        "CHAT_MSG_COMBAT_LOG_MISC_INFO",
        --"CHAT_MSG_COMBAT_MISC_INFO", 2.0 removed didnt want to parse ["CHAT_MSG_COMBAT_MISC_INFO"] = "Your equipped items suffer a 10% durability loss.",
        "CHAT_MSG_COMBAT_PARTY_HITS",
        "CHAT_MSG_COMBAT_PARTY_MISSES",
        "CHAT_MSG_COMBAT_PET_HITS",
        "CHAT_MSG_COMBAT_PET_MISSES",
        "CHAT_MSG_COMBAT_SELF_HITS",
        "CHAT_MSG_COMBAT_SELF_MISSES",
        "CHAT_MSG_SPELL_BREAK_AURA",
        "CHAT_MSG_SPELL_AURA_GONE_SELF",
        "CHAT_MSG_SPELL_AURA_GONE_OTHER",
        "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
        "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",
        "CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF",
        "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE",
        "CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF",
        "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE",
        "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS",
        "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
        "CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF",
        "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_PARTY_BUFF",
        "CHAT_MSG_SPELL_PARTY_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS",
        "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS",
        "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS",
        "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS",
        "CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS",
        "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
        "CHAT_MSG_SPELL_PET_BUFF",
        "CHAT_MSG_SPELL_PET_DAMAGE",
        "CHAT_MSG_SPELL_SELF_BUFF",
        "CHAT_MSG_SPELL_SELF_DAMAGE",
        "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED",
        "PLAYER_ENTER_COMBAT",
        "PLAYER_LEAVE_COMBAT",
        "PLAYER_AURAS_CHANGED",

        -- added for 1.3.0 to get mana efficiency
        "SPELLCAST_CHANNEL_START",
        "SPELLCAST_STOP",
        "SPELLCAST_FAILED",
        "SPELLCAST_INTERRUPTED",

        -- added 1.4 for death count
        "CHAT_MSG_COMBAT_FRIENDLY_DEATH",
        "CHAT_MSG_COMBAT_HOSTILE_DEATH",

    },

}

function BlessIt_UnpauseEvents()
    local coreFrame = getglobal("BlessItFrame");
    for i, val in ipairs(BlessIt_EventCollection.BlessIt_EventsSwitched) do
        coreFrame:RegisterEvent(val);
    end

end
function BlessIt_PauseEvents()
    local coreFrame = getglobal("BlessItFrame");
    for i, val in ipairs(BlessIt_EventCollection.BlessIt_EventsSwitched) do
        coreFrame:UnregisterEvent(val);
    end
end
function BlessIt_RegisterEvents()
    for i, val in ipairs(BlessIt_EventCollection.BlessIt_EventsMandatory) do
        this:RegisterEvent(val);
    end
end
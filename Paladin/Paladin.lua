function bi.pal.test()
    bi.log.Action("invoking bi.pal.test()")
    --print('isHolyShockReady():' .. tostring(isHolyShockReady()))

    -- bi.log.Log("bi.api.LastSpellCast:" .. bi.api.LastSpellCast);
    -- --bi.log.Log("time():" .. time());

    -- local i, j = bi.api.Modf(bi.api.LastSpellCast);

    -- o = bi.api.SecondsSince(i);

    -- bi.log.Log("just the tip maam:" .. o);

    -- ss = bi.pal.SecondsSinceLastCrusaderStikeHit();
    -- bi.log.Log("bi.pal.SecondsSinceLastCrusaderStikeHit():" .. ss);

    --SetCVar("autoSelfCast", 0)
    --time = GetTime();
    --bi.pal.CheckCrusaderStike();

    -- function bi.ListTalents()
    --     for _, talent in ipairs(bi.talents) do
    --         jgp(talent)
    --     end
    -- end

    --jgp(tostring(bi.talents[PALHOLY]))

    -- if bi.trinkets.HaveTrinket("Second Wind") then
    --     bi.log.Log('i got what you need!')
    -- else
    --     bi.log.Log('is there something else i can help you with?')
    -- end

    -- if UnitExists("target") then
    --     local targetName = UnitName('target')
    --     if bi.mobdb.Match(targetName) then
    --         bi.log.Log(targetName .. " is listed in Mobdb.")
    --     end
    -- end

    --bi.api.GeneralOptionsFrameShow()

    --bi.api.InitGeneralOptionsFrame()

    --print('milli: ' .. bi.api.MilliSecondsSince(bi.pal.lastAutoQuickHeal))
    --print('mana: ' .. UnitMana("player"))

    --bi.pal.haveHolyShield

    --bi.log.Debug('HS: ' .. tostring(bi.pal.haveHolyShield) .. ' /HSA:' .. tostring(isHolyShieldActive()))

    -- bi.api.ListBuffs("Player")

    -- if bi.api.HasBuff("Player", "Blessing of Sanctuary") then
    --     print('have bos')
    -- else
    --     print('do NOT have BOS')
    -- end

    -- if isHammerOfJusticeReady() then
    --     print('hoj ready')
    -- end

    -- local number = bi.api.MilliSecondsSince(bi.pal.lastHoJSpamNotification)

    -- if number > 2000 then
    --     print('number: ' .. tostring(number))
    --     bi.pal.lastHoJSpamNotification = GetTime()
    -- end

    DEFAULT_CHAT_FRAME:AddMessage('get outta here')
    bi.log.Warn('i said get outta here')
end

--region    ---- INIT

---[ bi.pal.GetDistance ]----------------------------------------------------------
-- Returns estimated distance from target
function bi.pal.GetDistance()
    if bi.wr.isRunning then
        return bi.wr.distance
    end

    if bi.api.WoWVersionCheck("vanilla") then
        if bi.class.talent == bi.talents.PALHOLY then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitCanAttack("player", "target") then
                return 100 -- invalid target
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
        if bi.class.talent == bi.talents.PALPROT then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitCanAttack("player", "target") then
                return 100 -- invalid target
            elseif Yard10 and IsActionInRange(Yard05) == 1 then
                return 5 -- 5 yards
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
        if bi.class.talent == bi.talents.PALRET then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitCanAttack("player", "target") then
                return 100 -- invalid target
            elseif Yard05 and IsActionInRange(Yard05) == 1 then
                return 5 -- 5 yards
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
    end

    if bi.api.WoWVersionCheck("twow") then
        if bi.class.talent == bi.talents.PALHOLY then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitExists("target") then --need variant for hostile/friendly
                return 100 -- invalid target
            elseif Yard05 and IsActionInRange(Yard05) == 1 then
                return 5 -- 5 yards
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
        if bi.class.talent == bi.talents.PALPROT then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitExists("target") then
                return 100 -- invalid target
            elseif Yard05 and IsActionInRange(Yard05) == 1 then
                return 5 -- 5 yards
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
        if bi.class.talent == bi.talents.PALRET then

            --bi.log.Debug(" /Yard10:" .. tostring(Yard10) .. " /Yard20:" .. tostring(Yard20));

            if not UnitExists("target") then
                return 100 -- invalid target
            elseif Yard05 and IsActionInRange(Yard05) == 1 then
                return 5 -- 5 yards
            elseif Yard10 and IsActionInRange(Yard10) == 1 then
                return 10 -- 8 - 10 yards
            elseif Yard20 and IsActionInRange(Yard20) == 1 then
                return 20 -- 11 - 25 yards
            else
                return 100
            end
            return 100 -- 31 - <na> yards
        end
    end

end

---[ bi.api.SyncClassData ]--------------------------------------------------------
function bi.pal.SyncClassData()

    bi.pal.InitDistance()
    bi.pal.GetDistance()

    bi.pal.lastCrusaderStrikeHit = GetTime();
    bi.pal.lastJudgementOfTheCrusader = GetTime();
    bi.pal.lastSealOfCommand = GetTime();
    bi.pal.lastSealOfRighteousness = GetTime();

    bi.pal.lastAutoQuickHeal = GetTime();
    bi.pal.lastAutoAttackNotification = GetTime();

    bi.pal.lastCastHoJ = GetTime()

    bi.pal.lastCastBoP = GetTime()
    bi.pal.lastBoPTarget = ''

    bi.pal.lastCastLoH = GetTime()
    bi.pal.lastLoHTarget = ''

    bi.pal.lastCastBoF = GetTime()
    bi.pal.lastBoFTarget = ''

    bi.class.talent = bi.pal.ScanTalents()
    
    if bi.class.talent == bi.talents.PALHOLY then
        bi.pal.InitHolyPaladinData()
    elseif bi.class.talent == bi.talents.PALPROT then
        bi.pal.InitProtPaladinData()
    elseif bi.class.talent == bi.talents.PALRET then
        bi.pal.InitRetPaladinData()
    end

    bi.log.Debug("Scanning Talent Tree");

    if bi.api.WoWVersionCheck("vanilla") then

        -- Check for Divine Favor
        local _, _, _, _, currRank = GetTalentInfo(1, 11)
        if currRank > 0 then
            bi.log.Debug("+Divine Favor")
            bi.api.XMLSetText("AbilitiesFrame", "_DivineFavor", "Divine Favor: yes")
            bi.pal.haveDivineFavor = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_DivineFavor", "Divine Favor: no")
            bi.pal.haveDivineFavor = false;
        end

        -- Check for Holy Shock
        local _, _, _, _, currRank = GetTalentInfo(1, 14)
        if currRank > 0 then
            bi.log.Debug("+Holy Shock")
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShock", "Holy Shock: yes")
            bi.pal.haveHolyShock = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShock", "Holy Shock: no")
            bi.pal.haveHolyShock = false;
        end

        -- Check for Holy Shield
        local _, _, _, _, currRank = GetTalentInfo(2, 15)
        if currRank > 0 then
            bi.log.Debug("+Holy Shield")
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShield", "Holy Shield: yes")
            bi.pal.haveHolyShield = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShield", "Holy Shield: no")
            bi.pal.haveHolyShield = false;
        end

        -- Check for Improved Judgement
        local name, iconPath, tier, column, currRank = GetTalentInfo(3, 3)
        if currRank > 0 then
            bi.log.Debug("+Improved Judgement")
        end
        bi.api.XMLSetText("AbilitiesFrame", "_ImprovedJudgement", "Improved Judgement: " .. currRank)
        bi.pal.haveImprovedJudgement = currRank;

    elseif bi.api.WoWVersionCheck("twow") then

        -- Check for Blessing of Sanctuary
        local _, _, _, _, currRank = GetTalentInfo(1, 6)
        if currRank > 0 then
            bi.log.Debug("+Blessing of Sanctuary")
            bi.api.XMLSetText("AbilitiesFrame", "_BlessingOfSanctuary", "Blessing of Sanctuary: yes")
            bi.pal.haveBlessingOfSanctuary = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_BlessingOfSanctuary", "Blessing of Sanctuary: no")
            bi.pal.haveBlessingOfSanctuary = false;
        end

        -- Check for Divine Favor
        local _, _, _, _, currRank = GetTalentInfo(1, 11)
        if currRank > 0 then
            bi.log.Debug("+Divine Favor")
            bi.api.XMLSetText("AbilitiesFrame", "_DivineFavor", "Divine Favor: yes")
            bi.pal.haveDivineFavor = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_DivineFavor", "Divine Favor: no")
            bi.pal.haveDivineFavor = false;
        end

        -- Check for Holy Shock
        local _, _, _, _, currRank = GetTalentInfo(1, 14)
        if currRank > 0 then
            bi.log.Debug("+Holy Shock")
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShock", "Holy Shock: yes")
            bi.pal.haveHolyShock = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShock", "Holy Shock: no")
            bi.pal.haveHolyShock = false;
        end

        -- Check for Holy Shield
        local _, _, _, _, currRank = GetTalentInfo(2, 12)
        if currRank > 0 then
            bi.log.Debug("+Holy Shield")
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShield", "Holy Shield: yes")
            bi.pal.haveHolyShield = true;
        else
            bi.api.XMLSetText("AbilitiesFrame", "_HolyShield", "Holy Shield: no")
            bi.pal.haveHolyShield = false;
        end

        -- Check for Improved Judgement
        local name, iconPath, tier, column, currRank = GetTalentInfo(3, 3)
        if currRank > 0 then
            bi.log.Debug("+Improved Judgement")
        end
        bi.api.XMLSetText("AbilitiesFrame", "_ImprovedJudgement", "Improved Judgement: " .. currRank)
        bi.pal.haveImprovedJudgement = currRank;

        -- Check for Sanctified Command

    end



end

---[ bi.api.InitDistance ]---------------------------------------------------------
-- Detects distance from target by gauging spell icons
function bi.pal.InitDistance()
    --bi.log.Debug(">>> /v:" .. tostring(bi.api.WoWVersionCheck("vanilla")) .. " /c:" .. bi.class.talent)
    if bi.api.WoWVersionCheck("twow") then
        if bi.class.talent == bi.talents.PALHOLY then

            local found = 0
            Yard20 = nil
            Yard10 = nil
            Yard05 = nil
            for i = 1, 120 do
                local t = GetActionTexture(i)
                if t then
                    --print(tostring(t));
                    if not Yard20 then --Holy Shock
                        --if string.find(t, "Ability_Warrior_Charge") -- Charge
                        --        or string.find(t, "Ability_Rogue_Sprint") then -- Intercept
                        if string.find(t, "Spell_Holy_SearingLight") then -- Intercept

                            --bi.log.Debug("found holy shock")

                            Yard20 = i
                            bi.log.Debug("20 yard: "..t)
                            found = found + 1
                        end
                    end
                    if not Yard10 then --Judgement
                        --if string.find(t, "Ability_GolemThunderClap")
                        --        or string.find(t, "Spell_Nature_ThunderClap") then -- Thunder Clap
                        if string.find(t, "Spell_Holy_RighteousFury") then

                            --bi.log.Debug("found judgement")

                            Yard10 = i
                            bi.log.Debug("10 yard: "..t)
                            found = found + 1
                        end
                    end
                    if not Yard05 then --Crusader Strike
                        --if string.find(t, "Ability_GolemThunderClap")
                        --        or string.find(t, "Spell_Nature_ThunderClap") then -- Thunder Clap
                        if string.find(t, "Spell_Holy_CrusaderStrike") then

                            --bi.log.Debug("found crusader strike")

                            Yard05 = i
                            bi.log.Debug("05 yard: "..t)
                            found = found + 1
                        end
                    end
                    if found == 3 then
                        bi.log.Debug("Found all distance check spells ("..i..")")
                        return
                    end
                end
            end
            -- -- Print if any distance check spell is missing
            -- if not yard30 or not yard08 then
            --     Print(CHAT_MISSING_SPELL_SHOOT_THROW_FURY)
            -- end
            -- if not yard25 then
            --     Print(CHAT_MISSING_SPELL_INTERCEPT_CHARGE_FURY)
            -- end
            -- if not yard10 then
            --     Print(CHAT_MISSING_SPELL_THUNDERCLAP_FURY)
            -- end
            -- if not yard05 then
            --     Print(CHAT_MISSING_SPELL_PUMMEL_FURY)
            -- end
        end
    end

    if bi.api.WoWVersionCheck("vanilla") then
        if bi.class.talent == bi.talents.PALHOLY then

            local found = 0
            Yard20 = nil
            Yard10 = nil
            for i = 1, 120 do
                local t = GetActionTexture(i)
                if t then
                    --print(tostring(t));
                    if not Yard20 then --Holy Shock
                        --if string.find(t, "Ability_Warrior_Charge") -- Charge
                        --        or string.find(t, "Ability_Rogue_Sprint") then -- Intercept
                        if string.find(t, "Spell_Holy_SearingLight") then -- Intercept

                            --bi.log.Debug("found holy shock")

                            Yard20 = i
                            bi.log.Debug("20 yard: "..t)
                            found = found + 1
                        end
                    end
                    if not Yard10 then --Judgement
                        --if string.find(t, "Ability_GolemThunderClap")
                        --        or string.find(t, "Spell_Nature_ThunderClap") then -- Thunder Clap
                        if string.find(t, "Spell_Holy_RighteousFury") then

                            --bi.log.Debug("found judgement")

                            Yard10 = i
                            bi.log.Debug("10 yard: "..t)
                            found = found + 1
                        end
                    end
                    if found == 2 then
                        bi.log.Debug("Found all distance check spells ("..i..")")
                        return
                    end
                end
            end
            -- -- Print if any distance check spell is missing
            -- if not yard30 or not yard08 then
            --     Print(CHAT_MISSING_SPELL_SHOOT_THROW_FURY)
            -- end
            -- if not yard25 then
            --     Print(CHAT_MISSING_SPELL_INTERCEPT_CHARGE_FURY)
            -- end
            -- if not yard10 then
            --     Print(CHAT_MISSING_SPELL_THUNDERCLAP_FURY)
            -- end
            -- if not yard05 then
            --     Print(CHAT_MISSING_SPELL_PUMMEL_FURY)
            -- end
        end
    end








end

---[ bi.api.InitHolyPaladinData ]--------------------------------------------------
function bi.pal.InitHolyPaladinData()
    bi.log.Debug("I am " .. bi.class.talent)
    local playerName = UnitName("player")
    bi.api.XMLSetText("AbilitiesFrame", "_Spec", bi.talents.PALHOLY)
    ClassSpec = "VRPALHOLY"
end

---[ bi.api.InitProtPaladinData ]--------------------------------------------------
function bi.pal.InitProtPaladinData()
    bi.log.Debug("I am " .. bi.class.talent)
    local playerName = UnitName("player")
    bi.api.XMLSetText("AbilitiesFrame", "_Spec", bi.talents.PALPROT)
    ClassSpec = "VRPALPROT"
end

---[ bi.api.InitRetPaladinData ]---------------------------------------------------
function bi.pal.InitRetPaladinData()
    bi.log.Debug("I am " .. bi.class.talent)
    local playerName = UnitName("player")
    bi.api.XMLSetText("AbilitiesFrame", "_Spec", bi.talents.PALRET)
    ClassSpec = "VRPALRET"
end

---[ bi.pal.InitRole ]-----------------------------------------------------
function bi.pal.InitRole()
    --print('invoking bi.war.InitRole()')
    -- Depending on [MODE_HEADER_PROT], [MODE_HEADER_MITITHREAT] and [MODE_HEADER_AOE], trigger weapon set change
    --bi.pal.InitWeapon()

    -- Initialize BlessIt API Variables
    -- bi.api.Attack = nil
    -- bi.api.AttackEnd = GetTime()
    -- bi.api.Combat = nil
    -- bi.api.CombatEnd = GetTime()
    bi.api.CombatTotal = 0
    bi.api.EnemySpellcast = nil
    bi.api.InterruptSpell = nil
    bi.api.LastSpellCast = 0
    -- bi.api.Mount = false

    -- Initialize Paladin Variables
    -- if not bi.war.ChargeLastCast then
    --     bi.war.ChargeLastCast = GetTime()
    -- end
    -- bi.war.ExecuteSwapped = false
    -- bi.war.OldStance = nil
    -- bi.war.RevengeReadyUntil = 0

end

---[ bi.api.ScanTalents ]----------------------------------------------------------
function bi.pal.ScanTalents()
    local _, _, pointsSpentInHoly = GetTalentTabInfo(1)
    local _, _, pointsSpentInProt = GetTalentTabInfo(2)
    local _, _, pointsSpentInRet = GetTalentTabInfo(3)
    
    if pointsSpentInProt > pointsSpentInRet and pointsSpentInProt > pointsSpentInHoly then
        --bi.log.Log("bork: " .. tostring(bi.talents.PALRET));
        return bi.talents.PALPROT
    elseif pointsSpentInHoly > pointsSpentInRet and pointsSpentInHoly > pointsSpentInProt then
        --bi.log.Log("dabu: " .. tostring(bi.talents.PALHOLY));
        return bi.talents.PALHOLY
    elseif pointsSpentInRet > pointsSpentInHoly and pointsSpentInRet > pointsSpentInProt then
        --bi.log.Log("arse: " .. tostring(bi.talents.PALRET));
        return bi.talents.PALRET
    end
end

--endregion ---- INIT

--region    ---- CLASS

---[ bi.pal.castBlessingOfFreedom ]--------------------------------------------
function bi.pal.castBlessingOfFreedom()
    CastSpellByName("Blessing of Freedom")
end

---[ bi.pal.castBlessingOfProtection ]-----------------------------------------
function bi.pal.castBlessingOfProtection()
    CastSpellByName("Blessing of Protection")
end

---[ bi.pal.castDivineFavor ]--------------------------------------------------
function bi.pal.castDivineFavor()
    CastSpellByName("Divine Favor")
end

---[ bi.pal.castHammerOfJustice ]----------------------------------------------
function bi.pal.castHammerOfJustice()
    CastSpellByName("Hammer of Justice")
end

---[ bi.pal.castHolyShock ]----------------------------------------------------
function bi.pal.castHolyShock()
    CastSpellByName("Holy Shock")
end

---[ bi.pal.castLayOnHands ]---------------------------------------------------
function bi.pal.castLayOnHands()
    CastSpellByName("Lay on Hands")
end

---[ bi.pal.CrusaderStrikeStacks ]---------------------------------------------
function bi.pal.CrusaderStrikeStacks(unit, stacks)

	if not UnitExists(unit) then
		return false;
	end

	local s = Zorlen_GetDebuffStack("Spell_Holy_CrusaderStrike", unit)
	if s < stacks then
		--print(UnitName('target') .. " has " .. s .. " stacks of Crusader Strike");
		return true
	elseif s == stacks then
		-- if bi.pal.CheckCrusaderStrike() then
        --     return true
		-- end
	else
		return false
	end
end

---[ bi.pal.isBlessingOfProtectionActive ]-------------------------------------
function bi.pal.isBlessingOfProtectionActive()
    return bi.api.HasBuff('target', "Blessing of Protection")
	-- local SpellName = LOCALIZATION_ZORLEN.BlessingOfProtection
	-- return Zorlen_checkBuffByName(SpellName)
end

---[ bi.pal.isBoFReady ]-------------------------------------------------------
function bi.pal.isBoFReady()
	if bi.api.IsSpellReady("Blessing of Freedom") then
		return true;
	end
	return false;
end

--Added by Dispatch
function bi.pal.isBoPReady()
	if bi.api.IsSpellReady("Blessing of Protection") then
		return true;
	end
	return false;
end

---[ bi.pal.isDivineFavorActive ]----------------------------------------------
function bi.pal.isDivineFavorActive()
    return bi.api.HasBuff('player', "Divine Favor")
end

---[ bi.pal.isDivineFavorReady ]-----------------------------------------------
function bi.pal.isDivineFavorReady()
	if bi.api.IsSpellReady("Divine Favor") then
		return true;
	end
	return false;
end

---[ bi.pal.isExorcismReady ]--------------------------------------------------
function bi.pal.isExorcismReady()
	if bi.api.IsSpellReady("Exorcism") then
		return true;
	end
	return false;
end

---[ bi.pal.isHammerOfJusticeUsable ]------------------------------------------
function bi.pal.isHammerOfJusticeUsable()
end

---[ bi.pal.isHolyShockReady ]-------------------------------------------------
function bi.pal.isHolyShockReady()
	if bi.api.IsSpellReady("Holy Shock") then
		return true;
	end
	return false;
end

---[ bi.pal.isHammerOfJusticeReady ]-------------------------------------------
function bi.pal.isHammerOfJusticeReady()
	if bi.api.IsSpellReady("Hammer of Justice") then
		return true;
	end
	return false;
end

---[ bi.pal.isHammerOfJusticeUsable ]------------------------------------------
function bi.pal.isHammerOfJusticeUsable()
	for i = 1, 120 do
		local t = GetActionTexture(i)
		if t then
			if string.find(t, "Spell_Holy_SealOfMight") then
				Ability_Hammer_of_Justice = i
			end
		end
	end
	if Ability_Hammer_of_Justice and IsActionInRange(Ability_Hammer_of_Justice) == 1 then
		return true
	end
	return false
end

---[ bi.pal.isHolyShockUsable ]------------------------------------------------
function bi.pal.isHolyShockUsable()
	for i = 1, 120 do
		local t = GetActionTexture(i)
		if t then
			if string.find(t, Textures['Holy Shock']) then
				Ability_Holy_Shock = i
			end
		end
	end
	if Ability_Holy_Shock and IsActionInRange(Ability_Holy_Shock) == 1 then
		return true
	end
	return false
end

--Added by Dispatch
function bi.pal.isLoHReady()
	if bi.api.IsSpellReady("Lay on Hands") then
		return true;
	end
	return false;
end

--endregion ---- CLASS

--region    ---- ROTATIONS

--endregion ---- ROTATIONS

--region    ---- EVENTS

---[ bi.pal.CHAT_MSG_SPELL_SELF_BUFF ]---------------------------------------------
function bi.pal.CHAT_MSG_SPELL_SELF_BUFF(event, arg1)
    bi.log.LogEvent(bi.log.Damage(event, arg1));
end

---[ bi.pal.CHAT_MSG_SPELL_SELF_DAMAGE ]-------------------------------------------
function bi.pal.CHAT_MSG_SPELL_SELF_DAMAGE(event, arg1)

    -- Holy Shock
    if string.find(arg1, ".*Holy Shock.*") then
        if string.find(arg1, ".*is parried.*") 
            or string.find(arg1, ".*was dodged.*")
            or string.find(arg1, ".*missed.*")
            or string.find(arg1, ".*was resisted.*") then
                --bi.log.Log("HOLY SHOCK FAILED...")
        else
            --bi.log.Log("HOLY SHOCK HIT!!!")
        end
    end

    -- Crusader Strike
    if string.find(arg1, ".*Crusader Strike.*") then
        if string.find(arg1, ".*is parried.*") 
            or string.find(arg1, ".*was dodged.*")
            or string.find(arg1, ".*missed.*")
            or string.find(arg1, ".*was resisted.*") then
                --bi.log.Log("CRUSADER STRIKE FAILED...")
        else
            --bi.log.Log("CRUSADER STRIKE HIT!!!")
            bi.pal.lastCrusaderStrikeHit = GetTime();
        end
    end

    --bi.log.Log(" /e:" .. event .. " /a:" .. arg1)

    bi.log.LogEvent(bi.log.Damage(event, arg1));
end

--endregion ---- EVENTS



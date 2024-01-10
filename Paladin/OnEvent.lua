function bi.pal.OnEvent(event, arg1)

    --bi.log.Log("bi.pal.OnEvent /event:" .. tostring(event) .. " /arg1:" .. tostring(arg1))

    if event == 'CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS' then

        -- Blessing of Freedom
        -- extract target name
        local _,_,name = string.find(arg1, '(.+) gains Blessing of Freedom.')
        -- have you cast bof in the 2000 milliseconds?
        if name then
            if bi.api.MilliSecondsSince(bi.pal.lastCastBoF) < 2000 then
                -- and was the target of that event also the target of your last bof?
                if bi.pal.lastBoFTarget == name then
                    --bi.log.Say('Casting BoF on ' .. UnitName('target'))
                    bi.log.Emote('cast BoF on ' .. name .. '!')
                end
            end
        end

        -- Blessing of Protection
        -- extract target name
        local _,_,name = string.find(arg1, '(.+) gains Blessing of Protection.')
        -- have you cast bop in the 2000 milliseconds?
        if name then
            if bi.api.MilliSecondsSince(bi.pal.lastCastBoP) < 2000 then
                -- and was the target of that event also the target of your last bop?
                if bi.pal.lastBoPTarget == name then
                    --bi.log.Say('Casting BoP on ' .. UnitName('target'))
                    bi.log.Emote('cast BoP on ' .. name .. '!')
                end
            end
        end

        -- Lay on Hands     RET WILL NOT DETECT THIS b/c LACK OF IMP LOH
        -- extract target name
        -- local _,_,name = string.find(arg1, '(.+) gains Lay on Hands.')
        -- if name then
        --     -- have you cast loh in the 2000 milliseconds?
        --     if bi.api.MilliSecondsSince(bi.pal.lastCastLoH) < 2000 then
        --         -- and was the target of that event also the target of your last loh?
        --         if bi.pal.lastLoHTarget == name then
        --             --bi.log.Say('Casting LoH on ' .. UnitName('target'))
        --             bi.log.Emote('cast LoH on ' .. name .. '!')
        --         end
        --     end
        -- end

    end

    if event == 'CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS' then

        -- Blessing of Freedom
        -- extract target name
        local _,_,name = string.find(arg1, '(.+) gain Blessing of Freedom.')
        -- have you cast bof in the 2000 milliseconds?
        if name then
            if bi.api.MilliSecondsSince(bi.pal.lastCastBoF) < 2000 then
                -- if you were the target..
                if name == 'You' then
                    --bi.log.Say('Casting BoF on ' .. UnitName('target'))
                    bi.log.Emote('cast BoF on ' .. name .. '!')
                end
            end
        end

        -- Blessing of Protection (self)
        -- extract target name ("You")
        local _,_,name = string.find(arg1, '(.+) gain Blessing of Protection.')
        -- have you cast bop in the 2000 milliseconds?
        if name then
            if bi.api.MilliSecondsSince(bi.pal.lastCastBoP) < 2000 then
                -- if you were the target..
                if name == 'You' then
                    if UnitSex('target') == 2 then
                        bi.log.Emote('cast BoP on himself. Dirty-ass bubsturbator!')
                    elseif UnitSex('target') == 3 then
                        bi.log.Emote('cast BoP on herself. Dirty-ass bubsturbator!')
                    end
                end
            end
        end

        -- Lay on Hands (self)    RET WILL NOT DETECT THIS b/c LACK OF IMP LOH
        -- extract target name ("You")
        -- local _,_,name = string.find(arg1, '(.+) gain Lay on Hands.')
        -- if name then
        --     -- have you cast loh in the 2000 milliseconds?
        --     if bi.api.MilliSecondsSince(bi.pal.lastCastLoH) < 2000 then
        --         -- if you were the target..
        --         if name == 'You' then
        --             --bi.log.Say('Casting LoH on ' .. UnitName('target'))
        --             bi.log.Emote('cast LoH on ' .. name .. '!')
        --         end
        --     end
        -- end

    end

    if event == 'CHAT_MSG_SPELL_SELF_BUFF' then

        -- Lay on Hands
        -- extract target name
        local _,_,name = string.find(arg1, '(.+) gains Lay on Hands.')
        if name then
            -- have you cast loh in the 2000 milliseconds?
            if bi.api.MilliSecondsSince(bi.pal.lastCastLoH) < 2000 then
                -- and was the target of that event also the target of your last loh?
                if bi.pal.lastLoHTarget == name then
                    --bi.log.Say('Casting LoH on ' .. UnitName('target'))
                    bi.log.Emote('cast LoH on ' .. name .. '!')
                end
            end
            return
        end

        -- Lay on Hands (self)
        -- extract target name ("you")
        local _,_,name = string.find(arg1, 'Your Lay on Hands heals (.+) for (.+).')
        if name then
            -- have you cast loh in the 2000 milliseconds?
            if bi.api.MilliSecondsSince(bi.pal.lastCastLoH) < 2000 then
                -- if you were the target..
                if name == 'you' then
                    --bi.log.Say('Casting LoH on ' .. UnitName('target'))
                    bi.log.Emote('cast LoH on ' .. name .. '!')
                elseif bi.pal.lastLoHTarget == name then
                    --bi.log.Say('Casting LoH on ' .. UnitName('target'))
                    bi.log.Emote('cast LoH on ' .. name .. '!')
                end
            end
            return
        end

        local _,_,name = string.find(arg1, 'Your Lay on Hands critically heals (.+) for (.+).')
        if name then
            -- have you cast loh in the 2000 milliseconds?
            if bi.api.MilliSecondsSince(bi.pal.lastCastLoH) < 2000 then
                -- if you were the target..
                if name == 'you' then
                    --bi.log.Say('Casting LoH on ' .. UnitName('target'))
                    bi.log.Emote('cast LoH on ' .. name .. '!')
                elseif bi.pal.lastLoHTarget == name then
                    --bi.log.Say('Casting LoH on ' .. UnitName('target'))
                    bi.log.Emote('cast LoH on ' .. name .. '!')
                end
            end
            return
        end

    end

end
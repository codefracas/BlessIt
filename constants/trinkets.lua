bi.trinkets = {}

bi.trinkets.available = {}

bi.trinkets.numberOfTrinkets = 0;

function bi.trinkets.ScanTrinkets()
	local idx,i,j,k,texture = 1
	local itemLink,itemID,itemName,equipSlot,itemTexture

	-- go through bags and gather trinkets into .BaggedTrinkets
	for i=0,4 do
		for j=1,GetContainerNumSlots(i) do
			itemLink = GetContainerItemLink(i,j)

			if itemLink then
				_,_,itemID,itemName = string.find(GetContainerItemLink(i,j) or "","item:(%d+).+%[(.+)%]")
				_,_,_,_,_,_,_,equipSlot,itemTexture = GetItemInfo(itemID or "")
				if equipSlot=="INVTYPE_TRINKET" then
					if not bi.trinkets.available[idx] then
						bi.trinkets.available[idx] = {}
					end
					bi.trinkets.available[idx].bag = i
					bi.trinkets.available[idx].slot = j
					bi.trinkets.available[idx].name = itemName
					bi.trinkets.available[idx].texture = itemTexture
					idx = idx + 1
                    --bi.log.Debug("trinket: +" .. itemName);
				end
			end
		end
	end
    bi.trinkets.numberOfTrinkets = idx - 1;
end

function bi.trinkets.ReportTrinkets()
    for i = 1, table.getn(bi.trinkets.available) do
        bi.log.Debug(bi.trinkets.available[i].name)
    end
end

function bi.trinkets.HaveTrinket(trinketName)
    for i = 1, bi.trinkets.numberOfTrinkets do
        if bi.trinkets.available[i].name == trinketName then
            return true;
        end
    end
    return false;
end


-- bi.trinkets = {
--     DraconicInfusedEmblem = "Draconic Infused Emblem",
--     ScrollsOfBlindingLight = "Scrolls of Blinding Light",
--     ZandalarianHeroCharm = "Zandalarian Hero Charm",
-- }


-- function Account:Withdraw (v)
--     self.balance = self.balance - v
-- end

-- function Account:New (o)
--     o = o or {}   -- create object if user does not provide one
--     setmetatable(o, self)
--     self.__index = self
--     return o
-- end
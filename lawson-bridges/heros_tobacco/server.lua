local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("cigar", function(source, item)
		TriggerClientEvent('prop:cigar', source)
		TriggerClientEvent("vorp:TipRight", source, Config.Text.Cigar, 3000)
end)

RSGCore.Functions.CreateUseableItem("chewingtobacco", function(source, item)
	TriggerClientEvent('prop:chewingtobacco', source)
	TriggerClientEvent("vorp:TipRight", source, Config.Text.TextA, 3000)
end)

RSGCore.Functions.CreateUseableItem("cigarette", function(source, item)
	TriggerClientEvent('prop:cigaret', source)
	TriggerClientEvent("vorp:TipRight", source, Config.Text.cigarette, 3000)
end)

RSGCore.Functions.CreateUseableItem("pipe_smoker", function(source, item)
		TriggerClientEvent('prop:pipe_smoker', source)
		TriggerClientEvent("vorp:TipRight", source, Config.Text.Pipe, 3000)
end)
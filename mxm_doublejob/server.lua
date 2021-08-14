
ESX = exports.es_extended:getSharedObject()

local doublejob = {}
local AllJob = {}


Citizen.CreateThread(function()
    for k,v in pairs(Config.ListJob) do
        AllJob[k] = {name = k}
        AllJob[k].grade_table = {}
        for a,s in pairs(v.listgrade) do
            if AllJob[k] then
                AllJob[k].grade_table[tostring(s.grade)] = {name = k , label = v.label, grade = s.grade, grade_name = s.grade_name , grade_label = s.grade_label ,salary = s.salary }
            end
        end
    end
end)


AddEventHandler('esx:playerLoaded',function (src)
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll('SELECT job_2 FROM users WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    }, function(result) 
        if result ~= nil then
            local table = json.decode(result[1].job_2)
            if AllJob[table.name] ~= nil then
                if AllJob[table.name].grade_table[tostring(table.grade)] then
                    doublejob[xPlayer.identifier] = AllJob[table.name].grade_table[tostring(table.grade)] 
                    xPlayer.triggerEvent("mxm_doublejob:updateJob",doublejob[xPlayer.identifier])
                end
            end
        end
    end)
end)



--[[

    local getJob = exports["mxm_doublejob"]:getJob(src)

        getJob.name =           "job name"              type = string
        getJob.label =          "job Label"             type = string
        getJob.grade =          "grade number"          type = int
        getJob.grade_name =     "grade name"            type = string
        getJob.grade_label =    "grade Label"           type = string
        getJob.salary =         "grade salary"          type = int
]]

exports('getJob',function(source)
    local xPlayer =  ESX.GetPlayerFromId(source)
    if xPlayer then
        if doublejob[xPlayer.identifier] ~= nil then
            return doublejob[xPlayer.identifier]
        end 
    end
end)



--[[
  local setJob = exports["mxm_doublejob"]:setJob(src,job,grade)

    setJob == "set"         -- has been set
    setJob == "no_grade"    -- the grade does not exist
    setJob == "no_job"      -- the job does not exist
]]

exports('setJob',function(source,job,grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if AllJob[job] ~= nil then
            if AllJob[job].grade_table[grade] then
                doublejob[xPlayer.identifier] = AllJob[job].grade_table[grade]
                xPlayer.triggerEvent("mxm_doublejob:updateJob", doublejob[xPlayer.identifier])
                return "set"
            else
                return "no_grade"
            end
        else
            return "no_job"
        end
    end
end)


AddEventHandler('playerDropped', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer then
        if doublejob[xPlayer.identifier] ~= nil then 
            local JobTable = {
                name = doublejob[xPlayer.identifier].name,
                grade = doublejob[xPlayer.identifier].grade
            }
            MySQL.Async.execute('UPDATE users SET job_2 = @job_2 WHERE identifier = @identifier', {
                ['@job_2'] = json.encode(JobTable), 
                ["@identifier"] = xPlayer.identifier
            }, function(c2)
                doublejob[xPlayer.identifier] = nil
            end)
        end 
	end
end)



RegisterCommand("setjob_2",function (src,args)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Config.Admin[xPlayer.getGroup()] then
        if tonumber(args[1]) then
            if args[2] then
                if args[3]  then
                    local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
                    if xPlayer then
                        local setJob = exports["mxm_doublejob"]:setJob(tonumber(args[1]),args[2],args[3])
                        if setJob == "set" then
                            xPlayer.showNotification(Lang["set"]..args[2])
                        elseif setJob == "no_grade" then
                            xPlayer.showNotification(Lang["no_grade"])
                        elseif setJob == "no_job" then
                            xPlayer.showNotification(Lang["no_job"])
                        end
                    else
                        xPlayer.showNotification(Lang["player_not_online"])
                    end    
                else
                    xPlayer.showNotification(Lang["arg_3_notvalid"])
                end  
            else
                xPlayer.showNotification(Lang["arg_2_notvalid"])
            end
        else
            xPlayer.showNotification(Lang["arg_1_notvalid"])
        end 
    end
end)


StartPayCheck = function()
	function payCheck()
        for a, getplayers in pairs(GetPlayers()) do   
            if tonumber(getplayers) ~= nil then
                local xPlayer = ESX.GetPlayerFromId(getplayers)
                if xPlayer then
                    local getJob = exports["mxm_doublejob"]:setJob(getplayers)
                    if getJob.salary > 0 then
                        if Config.SocietyPayCheck then 
                            local RemoveMoney = removeMoneySociety(getJob.name,getJob.salary)
                            if RemoveMoney then
                                xPlayer.addAccountMoney(Config.AccountType, getJob.salary)
                                xPlayer.showNotification(Lang["pay_check"]..getJob.salary)
                            elseif RemoveMoney == "no_money" then
                                xPlayer.showNotification(Lang["no_money"])
                            elseif RemoveMoney == "no_account" then
                                xPlayer.addAccountMoney(Config.AccountType, getJob.salary)
                                xPlayer.showNotification(Lang["pay_check"]..getJob.salary)
                            end
                        else
                            xPlayer.addAccountMoney(Config.AccountType, getJob.salary)
                            xPlayer.showNotification(Lang["pay_check"]..getJob.salary)
                        end  
                    end
                end
            end
            Citizen.Wait(50)
        end
		SetTimeout(Config.TickPayCheck, payCheck)
	end
	SetTimeout(Config.TickPayCheck, payCheck)
end


Citizen.CreateThread(function()
    if Config.StartPayCheck then 
        StartPayCheck()
    end
end)

    
removeMoneySociety = function(job,amount)
local bool = false
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..job, function(account)
        if account ~= nil then
            if account.money >= amount then
                account.removeMoney(tonumber(amount))
                bool = true
            else
                bool = "no_money"
            end
        else
            bool = "no_account"
        end
    end)
    return bool 
end
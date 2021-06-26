ESX = exports.es_extended:getSharedObject()

local PlayerJob_2 = {}


RegisterNetEvent("mxm_dublejob:updateJob")
AddEventHandler("mxm_dublejob:updateJob",function (job)
    PlayerJob_2 = job
end)



--[[

    local getJob = exports["mxm_dublejob"]:getJob()

        getJob.name =           "job name"              type = string
        getJob.label =          "job Label"             type = string
        getJob.grade =          "grade number"          type = int
        getJob.grade_name =     "grade name"            type = string
        getJob.grade_label =    "grade Label"           type = string
        getJob.salary =         "grade salary"          type = int
]]


exports('getJob',function()
    return PlayerJob_2
end)



--[[  --Example Usage
    local getJob = exports["mxm_dublejob"]:getJob()

    if  getJob.name == "fazione1" and getJob.grade > 1 then 
            --continue...
    end
]]

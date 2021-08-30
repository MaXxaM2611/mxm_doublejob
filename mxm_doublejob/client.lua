ESX = exports.es_extended:getSharedObject()

local PlayerJob_2 = {}


RegisterNetEvent("mxm_doublejob:updateJob")
AddEventHandler("mxm_doublejob:updateJob",function (job)
    PlayerJob_2 = job
end)



--[[

    local getJob = exports["mxm_doublejob"]:getJob()

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

TriggerEvent('chat:addSuggestion', '/setjob_2', 'help text', {
    { name="[id]", help="server id" },
    { name="[Jobname]", help="Job Name" },
    { name="[jobgrade]", help="Job Grade" }
})


--[[  --Example Usage
    local getJob = exports["mxm_doublejob"]:getJob()

    if  getJob.name == "fazione1" and getJob.grade > 1 then 
            --continue...
    end
]]

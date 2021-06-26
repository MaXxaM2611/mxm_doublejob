Config = {

    ListJob = {

        ["disoccupato"] = {  -- Dont Delete 
            ["label"] = "No Duble Job",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "disoccupato1" , ["grade_label"] = "No Duble Job" , ["salary"] = 100 },
            }
        },
    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
 
        --\\Police//--
        ["police"] = {
            ["label"] = "Police",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "police1" , ["grade_label"] = "Cadet" , ["salary"] = 1200 },
            }
        },


    },

    StartPayCheck = false,

    SocietyPayCheck = false,

    AccountType = 'bank',

    TickPayCheck = 10 * 60000,
    
    Admin = {
        ["user"] = false,
        ["admin"] = true,
        ["superadmin"] = true
    }
    
}


Lang = {
    ["no_money"] = "La societa\' non ha abbastanza soldi per pagarti lo stipendio",
    ["pay_check"] = "Hai ricevuto lo stipendio di ",
    ["arg_1_notvalid"] = "Il primo argomento non è valido",
    ["arg_2_notvalid"] =  "Il secondo argomento non è valido",
    ["arg_3_notvalid"] =  "Il terzo argomento non è valido",
    ["player_not_online"] = "Il player non è online",
    ["no_job"] = "Il job esiste",
    ["no_grade"] = "Il grado non esiste",
    ["set"] = "Hai Settato il player job: ",
}
Config = {

    ListJob = {

        ["disoccupato"] = {  -- Dont Delete 
            ["label"] = "No Double Job",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "disoccupato1" , ["grade_label"] = "No Double Job" , ["salary"] = 100 },
            }
        },
    --\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\--
 
        ["ballas"] = {
            ["label"] = "Ballas",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "recluta", ["grade_label"] = "Sicario", ["salary"] = 0},
                { ["grade"] = 1, ["grade_name"] = "capo_sicario", ["grade_label"] = "Capo Sicario", ["salary"] = 0},
                { ["grade"] = 2, ["grade_name"] = "vice", ["grade_label"] = "Vice Capo", ["salary"] = 0},
                { ["grade"] = 3, ["grade_name"] = "boss", ["grade_label"] = "Capo", ["salary"] = 0},
            }
        },

        ["vagos"] = {
            ["label"] = "Vagos",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "recluta", ["grade_label"] = "Sicario", ["salary"] = 0},
                { ["grade"] = 1, ["grade_name"] = "capo_sicario", ["grade_label"] = "Capo Sicario", ["salary"] = 0},
                { ["grade"] = 2, ["grade_name"] = "vice", ["grade_label"] = "Vice Capo", ["salary"] = 0},
                { ["grade"] = 3, ["grade_name"] = "boss", ["grade_label"] = "Capo", ["salary"] = 0},
            }
        },

        ["lost"] = {
            ["label"] = "Lost MC",
            ["listgrade"] = {
                { ["grade"] = 0, ["grade_name"] = "recluta", ["grade_label"] = "Sicario", ["salary"] = 0},
                { ["grade"] = 1, ["grade_name"] = "capo_sicario", ["grade_label"] = "Capo Sicario", ["salary"] = 0},
                { ["grade"] = 2, ["grade_name"] = "vice", ["grade_label"] = "Vice Capo", ["salary"] = 0},
                { ["grade"] = 3, ["grade_name"] = "boss", ["grade_label"] = "Capo", ["salary"] = 0},
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
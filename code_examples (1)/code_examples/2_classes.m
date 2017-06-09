const Person <- class Person [ name : String ]

    export function getName [] -> [ret : String]
        ret <- name
    end getName


end Person

const Teacher <- class Teacher ( Person ) [ position : String ]

    export function returnPosition[] -> [ret : String]
        ret <- position
    end returnPosition

end Teacher


const simulate <- object simulate
    var p1 : Person <- Person.create["Per"]
    var t1 : Teacher <- Teacher.create["Kari", "Lektor"]


    process
        (locate self)$stdout.putString[p1.getName || "\n"]  (locate self)$stdout.flush
        (locate self)$stdout.putString[t1$name || " is a " || t1.returnPosition || "\n"]  (locate self)$stdout.flush
    end process

end simulate

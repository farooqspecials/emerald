const Watcher <- class Watcher[]

    export operation getLNN [] -> [LNN : Integer]
        LNN <- (locate self).getLNN
    end getLNN

    export operation getName [] -> [name : String]
        name <- (locate self).getName
    end getName

    export operation checkME [] -> []

    end checkME


end Watcher



const watchdog <- object watchdog

    const home <- locate self
    var there : Node
    var all : NodeList
    var wa : Watcher
    var nodeCount : Integer

    var LogicalNodeNumberArray : Array.of[Integer]
    var machineNameArray : Array.of[String]
    var WatcherArray : Array.of[Watcher]
    var statusArray : Array.of[Boolean]

    operation DoSomeWatching [] -> []
        var index : Integer
        for i : Integer <- 0 while i < nodeCount by i <- i + 1
                index <- i
                if statusArray[i] then
                    WatcherArray[i].checkME
                end if
        end for

        unavailable
            statusArray[index] <- false
            (locate self)$stdout.putString["Node on " || machineNameArray[index] || " whit LNN " || LogicalNodeNumberArray[index].asString || " is down\n"]  (locate self)$stdout.flush
            return
        end unavailable
    end DoSomeWatching

    initially

        all <- home.getActiveNodes

        nodeCount <- all.upperbound + 1

        LogicalNodeNumberArray <- Array.of[Integer].create[nodeCount]
        machineNameArray <- Array.of[String].create[nodeCount]
        WatcherArray <- Array.of[Watcher].create[nodeCount]
        statusArray <- Array.of[Boolean].create[nodeCount]


        for i : Integer <- 0 while i < nodeCount by i <- i + 1
            wa <- watcher.create
            there <- all[i]$theNode
            fix wa at there
            LogicalNodeNumberArray[i] <- wa.getLNN
            machineNameArray[i] <- wa.getName
            WatcherArray[i] <- wa
            statusArray[i] <- true
        end for

    end initially

    process
        loop
            self.DoSomeWatching
            home. delay[Time.create[1,0]]
        end loop
    end process

end watchdog

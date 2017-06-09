const movingMan <- object movingMan

    process
        const home <- locate self
        var there : Node
        var all : NodeList

        all <- home.getActiveNodes


        var LogicalNodeNumberArray : Array.of[Integer] <- Array.of[Integer].create[all.upperbound + 1]

        for i : Integer <- 0 while i <= all.upperbound by i <- i + 1
            there <- all[i]$theNode
            move self to there
            LogicalNodeNumberArray[i] <- there.getLNN
        end for

        move movingMan to home

        for i : Integer <- 0 while i <= all.upperbound by i <- i + 1
            home$stdout.PutString["Node visited as number " || i.asString || " as the Node identification number: " || LogicalNodeNumberArray.getElement[i].asString || "\n"]
        end for

        unavailable
            (locate self)$stdout.putString["Node down/crashed!\n"]  (locate self)$stdout.flush
        end unavailable

    end process

end movingMan


const SimpleCollection <- typeobject SimpleCollection
    operation add [ String ] -> [ Boolean ]
    function contains [ String ] ->[ Boolean ]
    operation remove [ String ] ->[ Boolean ]
end SimpleCollection


const List <- object List

    var first : element
    var last : element

    const element <- class element[name : String]
        var nextElement : element

        export function getNextElement [] -> [retE : element]
            retE <- nextElement
        end getNextElement

        export operation setNextElement [newE : element] -> []
            nextElement <- newE
        end setNextElement


        export function getString [] -> [retS : String]
            retS <- name
        end getString
    end element


    export operation add [ s : String ] -> [retBool : Boolean]
        var newElement : element <- element.create[s]

        if first == nil then
            first <- newElement
            last <- newElement
            retBool <- true
        elseif self.contains[s] then
            retBool <- false
        else
            last.setNExtElement[newElement]
            last <- last.getNextElement
            retBool <- true
        end if
    end add

    export operation remove [s : String] -> [ret : Boolean]
        var tmp : element <- first
        ret <- false

        if first == nil then
            return
        end if

        if first$String = s then
            if first == last then
                first <- nil
                last <- nil
            else
                first <- first$nextElement
            end if
            ret <- true
            return
        end if


        loop
            exit when tmp$nextElement == nil
            (locate self)$stdout.putString["ee\n"]  (locate self)$stdout.flush
            if tmp.getnextElement.getString = s then
                tmp.setNextELement[tmp.getnextElement.getnextElement]
                ret <- true
                exit
            end if
            tmp <- tmp.getNextElement
        end loop
    end remove

    export function contains [s : String] -> [ret : Boolean]
        var tmp : element <- first
        ret <- false
        loop
        exit when tmp == nil
            if tmp$String = s then
                ret <- true
                exit
            end if
            tmp <- tmp.getNextElement
        end loop
    end contains

end List



const run <- object run

    var aCollection : SimpleCollection

    process
(locate self)$stdout.putString["hei\n"]  (locate self)$stdout.flush
        if !(typeof List *> SimpleCollection) then
            (locate self)$stdout.putString["List do  not conform to SimpleCollection\n"]  (locate self)$stdout.flush
        else
            var b : Boolean
            aCollection <- list
            b <- aCollection.add["per"]
            b <- aCollection.add["per"]
            b <- aCollection.add["pål"]
            b <- aCollection.add["espen"]
            b <- aCollection.add["askeladden"]


            if aCollection.contains["espen"] then
                (locate self)$stdout.putString["espen is in collection\n"]  (locate self)$stdout.flush
            end if

            if aCollection.remove["espen"] then
                (locate self)$stdout.putString["espen removed from collection\n"]  (locate self)$stdout.flush
            end if
            (locate self)$stdout.putString["end\n"]  (locate self)$stdout.flush
        end if

    end process

end run


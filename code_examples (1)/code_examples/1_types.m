const SimpleCollection <- typeobject SimpleCollection
    operation add [ navn : String ] -> [ res : Boolean ]
    function contains [ navn : String ] ->[ res : Boolean ]
    operation remove [ navn : String ] ->[ res : Boolean ]
end SimpleCollection


const dummyCollection <- object dummyCollection
    export operation add[ navn : String ] -> [ res : Boolean ]
    end add

    export function contains [ navn : String ] ->[ res : Boolean ]
    end contains

    export operation remove [ navn : String ] ->[ res : Boolean ]
    end remove

end dummyCollection



const conformityTest <- object conformityTest

    process
        if typeof dummyCollection *> SimpleCollection then
            (locate self)$stdout.putString["dummyCollection conforms to SimpleCollection\n"]  (locate self)$stdout.flush
        else
            (locate self)$stdout.putString["dummyCollection do not conforms to SimpleCollection\n"]  (locate self)$stdout.flush
        end if
    end process


end conformityTest


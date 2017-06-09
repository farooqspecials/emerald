const initialObject <- object initialObject
	const limit <- 10
	const newobj <- monitor object innerObject
		var flip: Boolean <- true
		const c: Condition <- Condition.create
		
		export operation Hi
			if ! flip then
				stdout.putstring["Waiting Hi\n"]
				wait c
			end if
			stdout.putstring["Hi\n"]
			flip <- false
			signal c
		end hi
		export operation Ho
			if flip then
				stdout.putstring["Waiting Ho\n"]
				wait c
			end if
			stdout.putstring["Ho\n"]
			flip <- true
			signal c
		end ho
		initially
			stdout.putstring["Starting Ho Ho Program\n"]
		end initially
	end innerObject
	
	const hoer <- object hoer
		process
			var i: Integer <- 0
			loop
				exit when i = limit
				newobj.Hi
				i <- i + 1
				end loop
			end process
		end hoer
		
		process
			var i: Integer <- 0
			loop
				exit when i = limit
				newobj.Ho
				i <- i + 1
				end loop
			end process
		end initialObject
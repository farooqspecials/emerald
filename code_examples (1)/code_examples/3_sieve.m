
const sieve <- object sieve

    const supported <- 100

    process
        var PrimeArray : Array.of[Boolean] <- Array.of[Boolean].create[supported]

% All numbers are prime
        for i : Integer <- 2 while i < supported by i <- i + 1
            PrimeArray[i] <- true
        end for
        PrimeArray[0] <- false
        PrimeArray[1] <- false

% mark non prime using sieve
        for i : Integer <- 2 while i*i < supported by i <- i + 1
            if PrimeArray[i] then
                for j : Integer <- i while i*j < supported by j <- j + 1
                    PrimeArray[i*j] <- false
                end for
            end if
        end for

        for i : Integer <- 0 while i < supported by i <- i + 1
            if PrimeArray[i] then
                (locate self)$stdout.putString[i.asString || "\n"]  (locate self)$stdout.flush
            end if
        end for

    end process

end sieve

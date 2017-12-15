ssid_AP="Rutt_AP"
pswd_AP="poiuytrewq"

ssid_STA="Rutt"
pswd_STA="poiuytrewq"

tmr.alarm(0, 1000, 1, function() 
    uart.on("data", 3,
        function(data)
            if data=="apt" then
                tmr.stop(0)
                uart.on("data") -- unregister callback function
                
                print("Wybrano tryb AP")
                wifi.setmode(wifi.SOFTAP)
                --wifi.ap.config({ssid="Rutt2",pwd="poiuytrewq"})
                --wifi.ap.config({ssid="Rutt2222",pwd = "poiuytrewq"})

                tmr.alarm(1, 2000, 1, function() 
                    if wifi.ap.getip()== nil then 
                        print("Czekam na adres IP...") 
                    else 
                        tmr.stop(1)
                        --tmr.unregister(0)
                        print("Konfiguracja skonczona, adres IP to: "..wifi.ap.getip())
                        dofile("server.lua")
                    end 
                end)

            elseif data=="sta" then
                tmr.stop(0)
                uart.on("data") -- unregister callback function
                
                print("Wybrano tryb STA")
                wifi.setmode(wifi.STATION)
            --
                print("Podaj SSID: ")
            --  
                wifi.sta.config("Rutt", "poiuytrewq")
                wifi.sta.connect()
                
                tmr.alarm(1, 2000, 1, function() 
                    if wifi.sta.getip()  == nil then 
                        print("Czekam na adres IP...") 
                    else 
                        tmr.stop(1)
                        print("Konfiguracja skonczona, adres IP to: "..wifi.sta.getip())
                        dofile("server.lua")
                    end 
                end)
            end
    end, 0)
end)

gpio.mode(4,gpio.OUTPUT)
gpio.write(4,gpio.HIGH)

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    
--conn:on("receive",function(conn,payload)
  conn:on("receive",function(client,request)      
    local buf = "";



    local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
    if(method == nil)then
        _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
    end



        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end

    buf = buf.."<h1>No siema, dzialamyyy!</h1>";
    buf = buf.."<h1>Praca magisterska</h1>";
    buf = buf.."<p>LED <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";

    buf = buf.."<p>Przekaznik 1 <a href=\"?pin=RELON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=RELOFF1\"><button>OFF</button></a></p>";
    buf = buf.."<p>Przekaznik 2 <a href=\"?pin=RELON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=RELOFF2\"><button>OFF</button></a></p>";
    buf = buf.."<p>Przekaznik 3 <a href=\"?pin=RELON3\"><button>ON</button></a>&nbsp;<a href=\"?pin=RELOFF3\"><button>OFF</button></a></p>";
    buf = buf.."<p>Przekaznik 4 <a href=\"?pin=RELON4\"><button>ON</button></a>&nbsp;<a href=\"?pin=RELOFF4\"><button>OFF</button></a></p>";
    

    if(_GET.pin == "ON1")then
              gpio.write(4, gpio.LOW);
              uart.write(0, "Dioda swieci\n")
    elseif(_GET.pin == "OFF1")then
              gpio.write(4, gpio.HIGH);
              uart.write(0, "Dioda nie swieci\n")
--Sterowanie przekaznikami
    --Przekaznik 1
    elseif(_GET.pin == "RELON1")then
              uart.write(0, "RELON1\n")
    elseif(_GET.pin == "RELOFF1")then
              uart.write(0, "RELOFF1\n")
    --Przekaznik 2
    elseif(_GET.pin == "RELON2")then
              uart.write(0, "RELON2\n")
    elseif(_GET.pin == "RELOFF2")then
              uart.write(0, "RELOFF2\n")
    --Przekaznik 3
    elseif(_GET.pin == "RELON3")then
              uart.write(0, "RELON3\n")
    elseif(_GET.pin == "RELOFF3")then
              uart.write(0, "RELOFF3\n")
    --Przekaznik 4
    elseif(_GET.pin == "RELON4")then
              uart.write(0, "RELON4\n")
    elseif(_GET.pin == "RELOFF4")then
              uart.write(0, "RELOFF4\n")
--Koniec sterowania przekaznikami           
    end
            
--conn:send(buf)
--conn:close()
client:send(buf)
client:close()

collectgarbage();
end)
end)

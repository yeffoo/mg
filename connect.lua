--wifi.setmode(wifi.STATION)
--wifi.sta.config("Rutt","poiuytrewq")

gpio.mode(4,gpio.OUTPUT)
gpio.write(4,gpio.LOW)

print(wifi.sta.getip())

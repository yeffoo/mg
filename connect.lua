wifi.setmode(wifi.STATION)
wifi.sta.config("SSID","HASLO")
print(wifi.sta.getip())


ssid        = 'huang'
pwd         = 'sh19901222'

uart_debug = 1
oled_debug = 1
dev	= nil

if dev then
	server_ip   = '192.168.2.163'
	server_port = 8080 
	server_name = 'localhost'
	path   = '/smart'

	mqtt_ip = '192.168.2.163'
	mqtt_port = 1883
else
	server_ip   = '45.78.38.250'
	server_port = 8080 
	server_name = 'localhost'
	path   = '/smart'

	mqtt_ip = '45.78.38.250'
	mqtt_port = 1883
end

query_url = 'http://'..server_ip..':'..server_port..path

temp, hum = 0, 0
http_log = ''
user_input = ''

d_ip, d_temp, d_hum, d_upload = 2, 4, 6, 7
d_input, d_heap = 9, 11

display = {
	{ x = 0, y = 0,	data = 'ip: '	},
	{ x = 30,y = 0, data = ''    	},
	{ x = 0, y = 12,data = 'Temp: '	},
	{ x = 30,y = 12,data = ''		},
	{ x = 60,y = 12,data = 'Hum: '	},
	{ x = 90,y = 12,data = ''		},
	{ x = 0, y = 36,data = ''		},
	{ x = 0, y = 48,data = 'input: '},
	{ x = 36, y = 48,data = ''		},
	{ x = 0, y = 24,data = 'node:'	},
	{ x = 30, y = 24,data = ''	},
}

clientid = mac .. ':' .. chipid
lwt_t = '/smart:lwt:' 
sub_t = '/smart/sub/' .. mac .. ':' .. chipid .. '/#' 
pub_t = '/smart/pub/' .. mac .. ':' .. chipid
m_is_connecting = false
m_is_subscribing = false


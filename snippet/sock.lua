local moduleName = ...
local M = {}
_G[moduleName] = M

M.initconn = function()
end

M.send = function(data)

	if not checkip() then return end

    conn=net.createConnection(net.TCP, 0) 
    conn:connect(s_port, s_ip) 

    conn:on("sent",function(conn)
		http_log = 'Closing connection'
		log(http_log)
    end)

    conn:on("disconnection", function(conn)
		http_log = "Got disconnection..."
		log(http_log)
    end)

    conn:on("receive", function(conn, payload) 
		http_log = payload
		log(payload)
    end)


    conn:send(
		'POST ' .. path .. " HTTP/1.0\r\n" ..
		"Host: localhost\r\n" ..
		"Accept: */*\r\n" ..
		"Content-Length: ".. string.len(data) .. 
		"\r\n\r\n" ..
		data .. "\r\n\r\n"
    )

end

return M

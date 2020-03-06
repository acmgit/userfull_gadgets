local S = userfull_gadgets.S

-- Writes a Message in a specific color or Logs it
function userfull_gadgets.print(name, message, color)

    if(color ~= userfull_gadgets.none) then
        minetest.chat_send_player(name, core.colorize(color, message))
        return
		
    else 
        minetest.chat_send_player(name,  message)
        return
    end
			
end -- userfull_gadgets.print_message()

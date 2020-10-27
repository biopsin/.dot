-- show the name of current playing file
-- press SPACE to call the function

local mp = require 'mp'
local utils = require 'mp.utils'
local options = require 'mp.options'

local M = {}

function M.prompt_msg(msg, ms)
    mp.commandv('show-text', msg, ms)
end

function M.show_filename()
	local str = mp.get_property('path') .. "\n" .. mp.get_property('media-title')
    M.prompt_msg(str, 10000)
end

function M.bind_enter()
    mp.add_key_binding('ENTER', 'check_file_name', M.show_filename)
end


function M.unbind_enter()
    mp.remove_key_binding('ENTER')
end


function M.main() 
    M.bind_enter()
end

mp.register_event('file-loaded', M.main)



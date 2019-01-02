require 'config'
require 'action'

init(config.pkgName, 0)

function timer()
	while true 
	do
		t = os.date('%H-%M')
		if t == '08-00' then
			for i = 1, 2 do
				task(config.users[i])
				mSleep(3000)
			end
		end
		mSleep(2000)
	end 
end

timer()
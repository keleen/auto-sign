require 'config'

function tap (x, y)
	touchDown(1, x, y)
	mSleep(300)
	touchUp(1, x, y)
	mSleep(1000)
end

function moveX (x1, y1, x2, y2)
	touchDown(1, x1, y1)
	for i = 0, x2, 10 do
		touchMove(1, x1 + i, y1)
		mSleep(2)
	end
	touchUp(1, x2, y2)
end

function moveY (x1, y1, x2, y2)
	touchDown(1, x1, y1)
	for i = y1, y2, 10 do
		touchMove(1, x1, y1 - 2)
		mSleep(2)
	end
	touchUp(1, x2, y2)
end


function snap ()
	current_time = os.date("%Y-%m-%d", os.time())
	snapshot(current_time..".png", 0, 0, 700, 1200);  --截图并以当前时间戳命名
end

	
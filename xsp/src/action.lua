require 'config'
require 'tool'

function task (user)

	restart()
	mSleep(2000)
	login(user)
	mSleep(2000)
	sign()
	mSleep(2000)
	logout()
end

-- 打卡
function sign () 
	-- 移动到保世界侧边栏
	moveX(0, 300, 500, 300)
	mSleep(2000)
	for i = 1, 2 do 
		x = config.clicks[i][1]
		y = config.clicks[i][2]
		print(x)
		print(y)
		tap(x, y)
		mSleep(2000)
	end
	snap()
	
	pressKey('BACK',false)
	pressKey('BACK',false)
end

-- 登录
function login (user)
--	获取焦点
	tap(300, 570)
--	删除文本
	inputText("#CLEAR#")
	toast('清空用户名')
	mSleep(1000); 
--	录入文本
	inputText(user[1]..".#ENTER#");
	toast('录入用户名')
	mSleep(1000)
--	点击下一步
	tap(370, 760)
--	输入密码
	mSleep(2000)
	tap(86, 559)
	toast('录入密码')
--	获取焦点
	mSleep(1000); 
	inputText(user[2]..".#ENTER#");
	mSleep(1000)
	tap(360, 760)
end

--登出并退出
function logout () 
	tap(610, 1225)
	tap(350, 930)
	tap(340, 750)
	closeApp(config.pkgName)
end

function restart ()
--	如果启动
	flag = appIsRunning(config.pkgName) 
	if flag == 1 then
		closeApp(config.pkgName)
		mSleep(5000)
		toast('程序已关闭')
	end
	runApp(config.pkgName)
	mSleep(15000)
	toast('程序开启')
	toast('程序重启完毕……')
end
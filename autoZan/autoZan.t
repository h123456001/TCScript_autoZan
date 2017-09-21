var 线程ID
var hwnd
var mousewillmovex,mousewillmovey
var windowsizewidth,windowssizeheight

var flag

var findstartx,findstarty
//从这里开始执行
function 执行()
    //从这里开始你的代码
    //hwnd在顶部已经声明 
    //windowfind查找窗口标题为Freestyle! 类名为GAMEFRAMEWORK
    hwnd = windowfind("Freestyle!","GAMEFRAMEWORK")
    
    //如果windowsfind返回结果不是0 则说明窗口又找到
    if(hwnd!=0)
        //使用 windowclienttoscreen 方法得到窗口客户端区域 (不含蓝色条 ) 存入findstartx,findstarty
        windowclienttoscreen(hwnd,0,0,findstartx,findstarty)
        windowsizewidth = 1024+findstartx
        windowssizeheight = 768+findstarty
        var ret=windowactivate(hwnd) 
        sleep(200)
        //执行界面判断 并将结果存入ret
        ret = is选角色界面()
        
    end
end
//启动_热键操作
function 启动_热键()
    线程ID=threadbegin("执行","")
    var loopfindpic = threadbegin("循环3秒找图","")
end

//终止热键操作
function 终止_热键()
    threadclose(线程ID)
end

function is选角色界面()
    var picindex,x,y
    picindex=findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:选择角色.bmp|rc:选择角色1.bmp",#202020,1.0,1,x,y)
    if (picindex!=-1)
        //消息框("找到当前界面")
        //找到创建角色图片 
        
        var    ret = isfind创建角色按钮()
        if(ret)
            ret = windowmousemove(hwnd,mousewillmovex,mousewillmovey)
            if(ret)
                mousemiddleclick(2)
            else
                messagebox("没找到找到当前界面")
            end
        end
        
        return true
    else
        //消息框("没找到找到当前界面")
        return false
    end
    
    
end

function isfind创建角色按钮()
    flag = false
    var x,y,isfindBtn
    
    isfindBtn= findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:创建角色.bmp|rc:创建角色1.bmp",#101010,1.0,1,x,y)
    if (isfindBtn!=-1)
        flag = true
        //消息框("找到当前界面")
        //找到创建角色图片 
        var movex = x+3
        var movey = y+3
        //windowclienttoscreen(hwnd,movex,movey,mousewillmovex,mousewillmovey) 
        //mousemove(movex+findstartx,movey+findstarty)
        mousemove(movex,movey)
        mouseleftdclick(2)
        sleep(200)
        //移动中锋
        var rx,ry
        var ret = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:创建C.bmp",#101010,1.0,1,rx,ry)
        if(ret!=-1)
            mousemove(rx+3,ry+1)
            mouseleftdclick(2)
            sleep(200)
            //创建昵称
            var i = 0
            var ii= 0
            //9英文 4数字
            while(i<9)
                var keycode = rnd(65,90)
                keypress(keycode)
                i++
            end
            while(ii<3)
                //var rndchar = rnd(65,90)//A-Z:65-90  0-9:48-57  //jianpan A-Z:29-54   0-9 7-16
                var keycode = rnd(48,57)
                
                //keysendstring(keycode)
                keypress(keycode)
                ii++
            end
			var lastret = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:创建角色last.bmp",#101010,1.0,1,rx,ry)
            if(lastret!=-1)
                mousemove(rx+3,ry+1)
				mouseleftdclick(2)
				sleep(200)
            end
            
            sleep(1000)
            //检查弹窗 成功 恭喜您完成....成就
            var createSuccessResult = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:创建成功确定.bmp",#101010,1.0,1,rx,ry)
            if(createSuccessResult!=-1)
                mousemove(rx+3,ry+1)
				mouseleftdclick(2)
				sleep(1000)
                //
            end
            
            var createSuccessResult1 = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:进入游戏.bmp",#101010,1.0,1,rx,ry)
            if(1!=-1)
                mousemove(rx+3,ry+1)
				mouseleftdclick(2)
				sleep(7000)
                //
            end
            
            //进入游戏大厅 弹窗检测
            var alertTipResult = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:创建成功确定.bmp",#101010,1.0,1,rx,ry)
            if(alertTipResult!=-1)
                mousemove(rx+3,ry+1)
				mouseleftdclick(2)
				sleep(1000)
                //
            end
            
            //调出直播列表
            var livinglist = findpic(findstartx,findstarty,windowsizewidth,windowssizeheight,"rc:调出直播列表.bmp",#101010,1.0,1,rx,ry)
            if(livinglist!=-1)
                mousemove(rx+3,ry+1)
				mouseleftdclick(2)
				sleep(3000)
                //
            end
            
            
        end
        return true
        
    else
        return false
        //消息框("没找到找到当前界面") 
    end    
    
end

function 循环3秒找图()
    var ret
    var timestop = 3000
    while(ret!=true&& timestop >0)
        ret = isfind创建角色按钮()
        sleep(100)
        timestop = timestop - 100
    end
    traceprint("over loop")
end


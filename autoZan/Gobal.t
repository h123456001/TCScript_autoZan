var 线程ID,handelid
var hwnd
var iswatchsuccessflag,iscreatesuccess,lastsencecode
var findstartx,findstarty
var sencecode//场景代码
var backcount

function init()
    backcount = 10
    setdict("rc:tcsoft.txt",0)
    iswatchsuccessflag=false
    hwnd = windowfind("Freestyle!","GAMEFRAMEWORK")
    
    //如果windowsfind返回结果不是0 则说明窗口又找到
    if(hwnd!=0)
        //使用 windowclienttoscreen 方法得到窗口客户端区域 (不含蓝色条 ) 存入findstartx,findstarty
        windowclienttoscreen(hwnd,0,0,findstartx,findstarty)
        
        var ret=windowactivate(hwnd) 
        sleep(200)
        //执行界面判断 并将结果存入ret
        if(线程ID!=0)
            线程关闭(线程ID)
        end
        线程开启("runloop","")
        
    end    
    
end




function runloop()
    //var lastsencecode//上一个场景
    //无限循环当 hwnd窗口不为0的时候进入执行
    while(hwnd!=0)
        sencecode= senceRecognition()
        select(sencecode)
            
            case 1//角色选择界面
            traceprint("角色选择界面1")
            doSelectSenceActionByFlag()
            lastsencecode=1
            
            case 2//角色创建界面
            traceprint("角色创建界面2")
            docreateHeroAction()
            lastsencecode=2
            case 3//大厅界面
            traceprint("大厅界面3")
            doGameHallActionByFlag()
            lastsencecode=3
            case 4//观战中界面
            traceprint("观战界面4")
            finishWatching()
            lastsencecode=4
            default
            traceprint("检测失败")
            closeAlertWindow()
            //关闭弹窗
            sleep(1000)
            reflashHwnd()
            backcount--
            if(backcount<0)
                backsence()
                backcount= 10
            end
        end
        //全局界别识别完成后间隔
        sleep(800)
    end
end









//鼠标移动并点击一次 方法
function mouseAction(x,y)
    mousemove(x,y)
    sleep(300)
    mouseleftclick(1)
    sleep(500)
end




function reflashHwnd()
    hwnd = windowfind("Freestyle!","GAMEFRAMEWORK")
end

function closeAlertWindow()
    if(lastsencecode!=4&&sencecode!=4)
        mouseAction(findstartx+660,findstarty+472)
    end
    
end



//场景识别          方法
function senceRecognition()
    //找字方法  起点x         起点y             终点x           终点y                要找的字                 颜色偏差
    var ret = findtextex(findstartx+375,findstarty,findstartx+375+310,findstarty+60,"选择角色|创建角色a|大厅|观战中","451f00-202020|ffffff-000000",1.0)
    //如果结果部位空字符串,说明又找到图	4
    if(ret!="")
        //分割字符串
        var retarr 
        var stringindex = strsplit(ret,",",retarr) 
        return retarr[0]+1
        
    end
    return 0
end

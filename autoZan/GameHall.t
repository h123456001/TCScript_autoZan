function doGameHallActionByFlag()
    //未观战成功
    if(iswatchsuccessflag==false)
        traceprint("观战未成功,打开直播列表")
        
        openLivingList()
        reflashLivingList()        
        getGodPlayerName()
        
        //观战成功
    else
        traceprint("观战完成,返回角色界面")
        backsence()
        //设置管控参数
        //iscreatesuccess = false
        //iswatchsuccessflag =false
    end
end

function openLivingList()
    mouseAction(findstartx+540,findstarty+340)
    sleep(1000)
    traceprint("直播列表打开完成")
    
end



function getGodPlayerName()
    var targetname = 编辑框获取文本("编辑框0")
    //var ret = ocrex(findstartx+180,findstarty+100,findstartx+180+211,findstarty+100+343,targetname,"ffffff-000000",1.0)
    var ret = findtextex(findstartx+180,findstarty+100,findstartx+180+211,findstarty+100+343,"政府","ffffff-000000",1.0)
    if(ret!="")
        traceprint("找到大神正在尝试观战...")
        //分割字符串
        var retarr
        var n = strsplit(ret,",",retarr)
        mouseAction(retarr[1]+10,retarr[2]+3)
        mouseleftdclick(1)
        sleep(2000)
        //找不到设定的大神...重新打开直播列表    
    else
        reflashLivingList()
    end
end
function reflashLivingList()
    //425,93 线下大神直播  290,93 ELO大神直播  170,295关闭直播列表
    mouseAction(findstartx+425,findstarty+93)
    mouseAction(findstartx+290,findstarty+93)
    
end
function backsence()
    traceprint("后退角色界面")
    mouseAction(findstartx+175,findstarty+20)
    sleep(3000)    
end
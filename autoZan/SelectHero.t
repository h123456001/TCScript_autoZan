function deleteHero()
    //移动到删除角色 按钮 并单击  mouseAction内置完成后等500毫秒
    mouseAction(findstartx+970,findstarty+745)
    //确认删除 确定 单击
    mouseAction(findstartx+590,findstarty+470)
    //删除成功 确定 单击
    mouseAction(findstartx+660,findstarty+472)
    traceprint("角色删除成功")
end


function createHero()
    //移动到角色创建按钮 并单击
    traceprint("底部创建角色按钮")
    mouseAction(findstartx+880,findstarty+745)
    
end

//角色选择界面 根据iswatchsuccessflag 执行 删除 or 创建角色
function doSelectSenceActionByFlag()
    if(lastsencecode == 2)
        traceprint("创建结果成功")
        iscreatesuccess = true
    end
    if(iswatchsuccessflag==true)
        traceprint("观看了,即将删除角色")
        deleteHero()
        //设置flag为flase
        iswatchsuccessflag=false
        iscreatesuccess = false
        //角色创建失败 并且 观战失败    
    elseif(iswatchsuccessflag == false && iscreatesuccess== false)
        createHero()
        //执行后界面切换等待一秒
        sleep(1000)
        //角色创建成功 并且 观看失败
    else         
        //进入游戏
        mouseAction(findstartx+500,findstarty+700)
        sleep(3000)
    end
end




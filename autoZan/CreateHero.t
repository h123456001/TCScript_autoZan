function docreateHeroAction()
    //移动到中锋 位置 点击选择
    mouseAction(findstartx+660,findstarty+576)
    //等待2秒
    sleep(2000)
    //随机输入角色名
    inputHeroName()
    sleep(500)
    //点击底部创建角色按钮
    mouseAction(findstartx+510,findstarty+720)
    //等待2秒 后检测界面
    sleep(2000)
    iscreatesuccess = false
end

function inputHeroName()
    //创建临时
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
end

//清空角色名方法 back recreate
function clearHeroName()
    mouseAction(findstartx+175,findstarty+20)
    sleep(2000)
    
end
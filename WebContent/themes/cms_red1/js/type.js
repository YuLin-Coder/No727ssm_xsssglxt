function tabs_cg(Oobj,Otabch,event,ClassName,Find,level){//选项卡切换  1.点击的对象  2.切换的的对象  3.事件   4.类名  5.查找下一级   6.如果Find实参存在,缺少值是为 1  

	
	if(level==1){
			$(Oobj)[event](function(){
				var t=$(this).index();
				$(this).addClass(ClassName).siblings().removeClass(ClassName);
				$(this).parents(Otabch).find(Find).eq(t).show().siblings().hide();
			});
		}else{
				$(Otabch).hide();
				$(Otabch).first().show();
				$(Oobj)[event](function(){
					$(this).addClass(ClassName).siblings().removeClass(ClassName);
					$(Otabch).hide()
					$(Otabch).eq($(this).index()).show();
				})
			}
	
}



function two_scroll(number,cli_left,cli_right,click_cirl,textp,ovalue,ots){//滚动轮播 1.元素的个数	2.左点击对象	3.右点击对象	4.小圆点对击对象[可选项] 5.文字变化 6.滚动的距离[必选项] 7.滚动的个数[必选项]
	var olit=$(number).length;//元素的数量
	ots=parseInt($(number).parent().parent().width()/$(number).width());
	ovalue=$(number).width()+parseInt($(number).css("margin-left"));
	$(number).parent().css({"width":ovalue*olit+"px","position":"absolute"}).parent().css({"position":"relative","overflow":"hidden","height":$(number).height()});/*计算宽度*/
	var objscr=$(number).parent()//滚动的对像
	var j=0;//统计 
	var setotimer=null;//时间变量	
	setotimer=setInterval(orcroauto,3000);
	
	$(cli_left).hover(function(){
			clearInterval(setotimer);
		},function(){
			setotimer=setInterval(orcroauto,3000);
			})
	$(cli_right).hover(function(){
			clearInterval(setotimer);
		},function(){
			setotimer=setInterval(orcroauto,3000);
			})
	$(click_cirl).hover(function(){
			clearInterval(setotimer);
		},function(){
			setotimer=setInterval(orcroauto,3000);
			})
			
    $(cli_left).click(function(){
			j--;
			if(j<0){j=olit-ots}
			$(objscr).stop().animate({"left":-j*ovalue+"px"},600,"swing");
			$(click_cirl).eq(j).addClass('acti').siblings().removeClass('acti');
			$(textp).animate({"top":-j*$(textp).parent().height()+"px"});
		})
		
	$(cli_right).click(function(){
			orcroauto()
	})
	$(click_cirl).click(function(){
			j=$(this).index();
			$(objscr).stop().animate({"left":-j*ovalue+"px"},600,"swing");
			$(this).addClass('acti').siblings().removeClass('acti');
			$(textp).animate({"top":-j*$(textp).parent().height()+"px"});
			
		})
	function orcroauto(){
		j++;
		if(j>olit-ots){j=0}
		$(objscr).stop().animate({"left":-j*ovalue+"px"},600,"swing");
		$(click_cirl).eq(j).addClass('acti').siblings().removeClass('acti');
		$(textp).animate({"top":-j*$(textp).parent().height()+"px"});
		}
}
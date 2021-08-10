
	if (mtDropDown.isSupported()) {


		var ms = new mtDropDownSet(mtDropDown.direction.down, 0, 0, mtDropDown.reference.bottomLeft);


		var menu1 = ms.addMenu(document.getElementById("menu1"));
		menu1.addItem("- 公司简介","about.asp"); // send no URL if nothing should happen onclick
		menu1.addItem("- 公司文化","Culture.asp"); // send no URL if nothing should happen onclick
		menu1.addItem("- 组织机构","Organize.asp");
		menu1.addItem("- 成长历程","Principle.asp");
		menu1.addItem("- 联系我们","Contact.asp");

		
	
//第二菜单
		var menu2 = ms.addMenu(document.getElementById("menu2"));
		menu2.addItem("- 企业新闻", "news.asp"); 
		menu2.addItem("- 业内资讯", "yenews.asp"); // send no URL if nothing should happen onclick

	
		// menu : 3
		var menu3 = ms.addMenu(document.getElementById("menu3"));
		menu3.addItem("- 产品展示", "Product.asp");
		menu3.addItem("- 产品分类", "Products.asp");
	    menu3.addItem("- 产品搜索", "search.asp");
		
		// menu : 4
		var menu4 = ms.addMenu(document.getElementById("menu4"));
		menu4.addItem("- 企业荣誉", "Honor.asp");
		menu4.addItem("- 企业形象", "Img.asp");
		
		// menu : 5
		var menu5 = ms.addMenu(document.getElementById("menu5"));
		menu5.addItem("- 国内市场", "Sale.asp");
		menu5.addItem("- 国外市场", "Salea.asp");

		// menu : 6
		var menu6 = ms.addMenu(document.getElementById("menu6"));
		menu6.addItem("- 人才招聘", "Job.asp");
		menu6.addItem("- 人才策略", "Jobs.asp");
		

		// menu : 7
	//	var menu7 = ms.addMenu(document.getElementById("menu7"));
		//menu7.addItem("- 用户注册", "reg.asp");
		//menu7.addItem("- 用户登录", "myuser.asp?action=login");

				
		// menu : 8
		var menu8 = ms.addMenu(document.getElementById("menu8"));
		menu8.addItem("- 会员中心", "Server.asp");
		menu8.addItem("- 信息反馈", "Went.asp");
		menu8.addItem("- 留言中心", "NetBook.asp");
		menu8.addItem("- 订单查询", "E_shop.asp");	
		
	
		mtDropDown.renderAll();
	}

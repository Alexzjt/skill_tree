var skill_tem='';
//console.log(skill_tem);
//konami code plugin
(function ($) {

    $.fn.konami = function (callback, code) {
        if (code == undefined) code = "38,38,40,40,37,39,37,39,66,65"; //Super secret!

        return this.each(function () {
            var kkeys = [];
            $(this).keydown(function (e) {
                kkeys.push(e.keyCode);
                if (kkeys.toString().indexOf(code) >= 0) {
                    $(this).unbind('keydown', arguments.callee);
                    callback(e);
                }
            });
        });
    }

})(jQuery);

/*$.get(
	"/professions/get_skills_json",
	{
		id: 2
	},
	function(data) {
		skill_tem = data;
		skill_tem.skills.forEach(function(item, index, array){
			for(var i in item){
				if(item[i] == null) {
					delete item[i];
				}
			}
		});
		console.dir(data)
	}
);*/

$.get('../json/pe/pe.json').done(function(obj){
    var skill = eval(obj);
    skill_tem = JSON.stringify(skill.skills);

	//console.log(skill_tem);
});

//Custom closure
(function($, ko, data){

	//IE checks
	function getInternetExplorerVersion() {
	    var rv = -1; // Return value assumes failure.
	    if (navigator.appName == 'Microsoft Internet Explorer') {
	        var ua = navigator.userAgent;
	        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	        if (re.exec(ua) != null)
	            rv = parseFloat(RegExp.$1);
	    }
	    return rv;
	}
	function isInvalidIEVersion() {
		var ver = getInternetExplorerVersion();
		if (ver > -1 && ver < 9) {
			$('html').addClass("ltIE9");
			return true;
		}
		return false;
	}

	//On page load
	$(function(){

		//Quit if using an IE we don't like
		if (isInvalidIEVersion()) return;

		//Create and bind the viewmodel
		var vm = new tft.skilltree.Calculator(data);
		ko.applyBindings(vm);

		//apply konami code plugin
		$(window).konami(function () { vm.open(); vm.godMode(); });

		//Allow a split second for binding before turning on animated transitions for the UI
		setTimeout(function(){
			$('.page').addClass('animated');
		}, 50);
	});


})(window.jQuery, window.ko, {
	learnTemplate: 'Learn {n} to unlock.',
	portraitPathTemplate: 'img/avatar/{n}.png', 
	numPortraits: 36, 
	defaultStats: {
		'Charisma': 9
		, 'Dexterity': 9
		, 'Fortitude': 9
		, 'Intellect': 9
		, 'Strength': 9
		, 'Wisdom': 9
	},
   //  skills: skill_tem

	"skills": [
	{
		"id": 1,
		"title": "系统思维",
		"dependsOn": [],
		"description": "对于任何事情，都倾向于看作系统中的一个部分，而非割裂的独立事件。",
		"rankDescriptions": [
			"可以利用系统动力图，对能感知的系统进行系统东西分析。",
			"解决问题时，会有意识关注问题所处的系统，在必要的时候能够进行分析。",
			"解决问题时，会感觉到来自不同系统的动力，包括可见和不可见的，方法论变成思维方式。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 2,
		"title": "设计思维",
		"dependsOn": [],
		"description": "在问题和答案之间，用逻辑的方式硬拆出了一个Gap进行研究",
		"rankDescriptions": [
			"熟悉设计思维从信息收集到原型部署的全过程，并且能够在设计时使用这些方法论。",
			"解决问题时，会有意识停下线性找答案的过程，转而从研究问题本身，方法论逐渐变成条件反射。",
			"解决问题时，会感觉到对问题的理解存在缺失，同时对于非完美解决方案感到舒适，设计思维从方法论变成思维方式。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 3,
		"title": "用户理解",
		"dependsOn": [],
		"description": null,
		"rankDescriptions": [
			"了解人的基本心理常识，知道将就就好，反馈和动力，意志力，兴趣等基本知识。",
			"能进行有效的用户访谈，包括提前做好InterviewGuide，过程中熟练开放式和封闭式问题使用等，并从中生成insights。",
			"能进行有效的Empathy，通过角色切换，浸入，FieldResearch等方式获取用户无法直接表达的信息，并从中生成insights。",
			"能够将收集的信息做很好的整理和传达，让其它人可以从信息中生成insights。\n"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 4,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 4,
		"title": "HTML",
		"dependsOn": [],
		"description": "The main language for creating web pages, HTML is written in the form of tags enclosed in angle brackets (like &lt;html&gt;).",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 2,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 5,
		"title": "项目管理",
		"dependsOn": [],
		"description": null,
		"rankDescriptions": [
			"能够制定清晰的项目计划并且不断维护计划的执行"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 6,
		"title": "时间管理",
		"dependsOn": [],
		"description": null,
		"rankDescriptions": [
			"time log，规律化",
			"有效时间达到70%，几乎没有无聊时间和浪费的时间"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 2,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 7,
		"title": "Empathy",
		"dependsOn": [],
		"description": null,
		"rankDescriptions": [
			"管理，包括知识，时间，idea，团队，项目进度，确保所有事情都在可接受范围内。（不是可控，避免二元删除可能性）",
			"排序，随着insights多了，idea也会变多，什么最重要，会需要选择和排序的能力。常常不同的选择和排序会引导出截然不同的结果，现在流行标准就是的impact最大。",
			"建立反馈循环，让产品改进也好，参与工作的人也好，能够有前进的进程感和参考的坐标系。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 8,
		"title": "倾听",
		"dependsOn": [],
		"description": null,
		"rankDescriptions": [
			"有足够广的信息输入频谱，可以收集和接收各种类型的信息。",
			"理解场景，知道在市场，在用户，在行业等维度，现状和之后的趋势。",
			"传播，影响，沟通，让协作的小伙伴Get到自己的vision",
			"建立，维护，兑现通向vision的路线图"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 4,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 9,
		"title": "U型",
		"dependsOn": [
			1,
			2
		],
		"description": "补充了设计思维方法论过于逻辑，比较难探寻内心和动力的部分。",
		"rankDescriptions": [
			"能够在Ulab的环境下，停止下载和判断，保持平静的接收信息，生成图像，并且表达出来。",
			"能够组织Ulab，或通过静心，自己进入相对无知的状态接收信息，通过静默，内观到自己的意识，情绪，身体反应并且表达。",
			"内观变成相对的常态，知道自己什么时候在判断，通过降维理解信息，可以比较容易切换到放空的状态倾听，然后随时通过静默获取从底层上升出来的期待和未来景象。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 10,
		"title": "产品设计",
		"dependsOn": [
			3
		],
		"description": null,
		"rankDescriptions": [
			"会基本的功能，交互和界面设计，可以使用纸面或软件，清晰呈现自己的设计。（包括草图，User flow等)",
			"能够组合多个功能和界面，完成简单架构的产品设计，并且清晰表达设计，理解信息架构，复杂系统中实体的相互作用等。",
			"能够很好结合insight，用户需求，市场环境，进行多方trade off的设计。",
			"能够进行跨领域的设计，比如从软件到实体到服务到空间，并且开始设计产品的环境，氛围等系统元素。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 4,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 11,
		"title": "原型制作",
		"dependsOn": [
			3
		],
		"description": null,
		"rankDescriptions": [
			"能够使用PPT，Axure等简单工具制作原型",
			"能够根据不同测试环境，兼顾效率和效果的，熟练选择高保真，低保真原型进行制作"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 2,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 12,
		"title": "CSS",
		"dependsOn": [
			4
		],
		"description": null,
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": null,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 13,
		"title": "Javascript",
		"dependsOn": [
			4
		],
		"description": null,
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": null,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 14,
		"title": "知识管理",
		"dependsOn": [
			5,
			6
		],
		"description": "把它放在第一位，是因为产品经理常常是一整个体系里，知识和信息的汇集点，收集和整理知识的能力也直接影响到IDEA的质量。",
		"rankDescriptions": [
			"自己的所有知识体系会记录下来",
			"能够使用框架来表述自己知识体系的结构和相互作用",
			"能够呈现"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 15,
		"title": "团队管理",
		"dependsOn": [
			5,
			6
		],
		"description": null,
		"rankDescriptions": [
			"从事的角度管理团队，团队每一个成员可以清晰知道自己做事的标准。",
			"从人的角度管理团队，团队成员能够被很好motived",
			"从动力角度管理团队，团队的目标，项目的目标，团队成员的目标能够很好的吻合，团队成员个人的追求不被压制，个人动力能很好转化成做事的动力和团队动力"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 16,
		"title": "体验测试",
		"dependsOn": [
			9
		],
		"description": null,
		"rankDescriptions": [
			"观察和记录用户的产品使用行为，很好的访谈用户的使用过程。"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 17,
		"title": "打破产品－设计－技术之间的壁垒",
		"dependsOn": [
			18
		],
		"description": "Mengto做了很多这部分工作，它不属于产品经理必备的技能，但是应该是常常会关注的问题，它影响着产品从idea到上线的质量衰减率",
		"rankDescriptions": [
			"在Sketch中制作界面，并且文件能同时用于原型和UI(意味着分层，复用，命名都足够规范)",
			"动态的效果可以使用FramerJS，Origami，Form等工具制作并输出逻辑数字代码",
			"能够使用Xcode，Html＋Css直接建构软件界面"
		],
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 3,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 18,
		"title": "Java",
		"dependsOn": [10,11],
		"description": "Java是一种可以撰写跨平台应用程序的面向对象的程序设计语言。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 19,
		"title": "Database",
		"dependsOn": [12,13],
		"description": "数据库指的是以一定方式储存在一起、能为多个用户共享、具有尽可能小的冗余度的特点、是与应用程序彼此独立的数据集合",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 20,
		"title": "Xcode (swift)",
		"dependsOn": [],
		"description": "Xcode 是运行在操作系统Mac OS X上的集成开发工具（IDE），由苹果公司开发。Xcode是开发OS X 和 iOS 应用程序的最快捷的方式。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 21,
		"title": "思维方式",
		"dependsOn": [

		],
		"description": "它决定了其他部分的技能，能够发挥到什么程度，大师手里的木棍，力量超过小孩手里的武士刀的。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 22,
		"title": "设计",
		"dependsOn": [

		],
		"description": "这是个可以自然发展出的能力，只要对问题有足够的理解，设计每一个人都会，常常不能很好的做设计，只是因为输入不足。不知道类比的案例，不知道设计如何表达等等。所以设计领域的能力，基本是围绕输入和硬技能的。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 23,
		"title": "技术",
		"dependsOn": [
			19,
			20,
			21,
			22
		],
		"description": "技术是理解什么可以什么不行，产品的设计开发有大量的trade off，这个部分的理解能够节约很多很多沟通的时间和精力，相当多的Trade off可以在脑子里完成，不用再一点点靠说和商量来达成了。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 24,
		"title": "管理",
		"dependsOn": [
			14,
			15
		],
		"description": "自己的管理，对团队的管理，对产品的管理，管理就是为了好的结果生成，不想要的结果别出现。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	},
	{
		"id": 25,
		"title": "沟通",
		"dependsOn": [
			7,
			8
		],
		"description": "产品经理多半带着程序员和设计师一起的，把沟通单独拿出来，是因为它涉及到管理，涉及到设计，涉及到技术。",
		"rankDescriptions": null,
		"links": [
			{
				"label": "HTML.net Tutorials",
				"url": "http://www.html.net/tutorials/html/"
			}
		],
		"maxPoints": 1,
		"stats": [
			{
				"title": "Intellect",
				"value": "1"
			}
		]
	}
]

});
create database weblibrary default character set utf8mb4;
use weblibrary;

create table user
(
    id int unsigned auto_increment,
    username varchar(50) unique not null,
    passwd varchar(50) not null,
    name varchar(50) not null,
    cellphone varchar(50) not null,
    primary key (id)
);

insert into user (username,passwd,name,cellphone) values('user1',md5('123456'),'用户1','13399098476'),('user2',md5('1234'),'用户2','13877637890');

create table book
(
    id int unsigned auto_increment,
    name varchar(255) not null,
    isbn varchar(255) unique not null,
    author varchar(255) not null,
    publisher varchar(255) not null,
    pubdate date not null,
    url varchar(255) not null default '',
    abstract text not null,
    intime timestamp not null default now(),
    primary key (id) 
);

insert into book(name,isbn,author,publisher,pubdate,url,abstract) values 
('Java从入门到精通（第4版）','9787302444541', '明日科技 著','清华大学出版社','2016-10-01','','《Java从入门到精通（第4版）》从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细介绍了使用Java语言进行程序开发需要掌握的知识。全书分为28章，包括初识Java，熟悉Eclipse开发工具，Java语言基础，流程控制，字符串，数组，类和对象，包装类，数字处理类，接口、继承与多态，类的高级特性，异常处理，Swing程序设计，集合类，I/O（输入/输出），反射，枚举类型与泛型，多线程，网络通信，数据库操作，Swing表格组件，Swing树组件，Swing其他高级组件，高级布局管理器，高级事件处理，AWT绘图与音频播放，打印技术和企业进销存管理系统等。书中所有知识都结合具体实例进行介绍，涉及的程序代码给出了详细的注释，可以使读者轻松领会Java程序开发的精髓，快速提高开发技能。另外，本书除了纸质内容之外，配书光盘中还给出了海量开发资源库'),
('Python基础教程（第2版 修订版）','9787115353528','[挪] Magnus Lie Hetland 著；司维，曾军崴，谭颖华 译','人民邮电出版社','2014-06-01','','《图灵程序设计丛书：Python基础教程（第2版 修订版）》包括Python程序设计的方方面面，首先从Python的安装开始，随后介绍了Python的基础知识和基本概念，包括列表、元组、字符串、字典以及各种语句。然后循序渐进地介绍了一些相对高级的主题，包括抽象、异常、魔法方法、属性、迭代器。此后探讨了如何将Python与数据库、网络、C语言等工具结合使用，从而发挥出Python的强大功能，同时介绍了Python程序测试、打包、发布等知识。结尾，作者结合前面讲述的内容，按照实际项目开发的步骤向读者介绍了几个具有实际意义的Python项目的开发过程。
　　《图灵程序设计丛书：Python基础教程（第2版 修订版）》内容涉及的范围较广，既能为初学者夯实基础，又能帮助程序员提升技能，适合各个层次的Python开发人员阅读参考'),
('第一行代码 Android 第2版','9787115439789','郭霖 著','人民邮电出版社','2016-12-01','','本书被Android开发者誉为Android学习经典。全书系统全面、循序渐进地介绍了Android软件开发的知识、经验和技巧。
第2版基于Android 7.0对第1版进行了全面更新，将所有知识点都在新的Android系统上进行重新适配，使用全新的Android Studio开发工具代替之前的Eclipse，并添加了对Material Design、运行时权限、Gradle、RecyclerView、百分比布局、OkHttp、Lambda表达式等全新知识点的详细讲解。
本书内容通俗易懂，由浅入深，既适合Android初学者的入门，也适合Android开发者的进阶。'),
('JavaScript高级程序设计（第3版）','9787115275790','[美] Nicholas C.Zakas 著；李松峰，曹力 译','人民邮电出版社','2012-03-01','','作为JavaScript技术经典名著，《JavaScript高级程序设计（第3版）》承继了之前版本全面深入、贴近实战的特点，在详细讲解了JavaScript语言的核心之后，条分缕析地为读者展示了现有规范及实现为开发Web应用提供的各种支持和特性。
　　《JavaScript高级程序设计（第3版）》主要内容包括：
　　对JavaScript实现各个组成部分的详尽解读；
　　对JavaScript面向对象编程的全方位阐述；
　　对DOM、BOM及浏览器事件模型的透彻剖析；
　　Web应用基本数据格式JSON、XML及其存取；
　　Ajax、Comet服务器端通信和基于File API的拖放式文件上传；
　　ECMAScript 5定义的新核心语言特性；
　　HTML5涵盖的表单、媒体、Canvas（包括WebGL）；
　　Selectors、Web? Workers、地理定位及跨文档传递消息等新API；
　　离线应用及客户端存储（包括IndexedDB）；
　　维护、性能、部署相关的开发实践；
　　新兴API及ECMAScript Harmony展望。
　　《JavaScript高级程序设计（第3版）》适合有一定编程经验的Web应用开发人员阅读，也可作为高校及社会实用技术培训相关专业课程的教材。'),
('Head First设计模式（中文版）','9787508353937','[美] 弗里曼（Freeman E.） 等 著；UML China 编','中国电力出版社','2007-09-01','','本书共有14章，每章都介绍了几个设计模式，完整地涵盖了四人组版本全部23个设计模式。
　　★前言介绍了这本书的用法
　　★第1章至第11章陆续介绍了设计模式：Strategy、Observer、Decorator、Abstract　Factory、Factory　Method、Singleton、Command、Adapter、Facade、TemplatMethod、Iterator、Composite、State、Proxy。
　　★第12章介绍了如何将两个以上的设计模式结合起来成为新的设计模式（例如，著名的MVC模式），作者称其为复合设计模式。
　　★第13章介绍了如何进一步学习设计模式，如何发掘新的设计模式等主题。
　　★附录A介绍了剩下的设计模式：Bridge（桥接）、Builder（生成器）、Chainof Responsibility（责任链）、Flyweight（蝇量）、Interpreter（解释器）、Mediator（中介者）、Memento（备忘录）、Prototype（原型）、Visitor（访问者）。
　　另外，第1章至第9章还穿插介绍了四个OO基本概念（抽象、封装、继承、多态），以及九个OO原则（Principle）。千万不要轻视这些OO原则，因为每个设计模式背后都包含了几个OO原则的概念。很多时候，在设计出现两难情况时我们必须回归到OO原则，以方便判断取舍。
　　可以这么说：OO原则是我们的目标，而设计模式是我们的做法！'),
    ('代码大全（第2版）','9787121022982','[美] Steve，[美] McConnell 著；金戈，汤凌，陈硕 译','电子工业出版社','2011-09-01', 'download/book1.pdf', '代码大全(第2版)是著名Ⅱ畅销书作者、《IEEESoftware》杂志前主编、具有20年编程与项目管理经验的SteveMcConneU十余年前的经典著作的全新演绎：第2版做了全面的更新，增加了很多与时俱进的内容，包括对新语言、新的开发过程与方法论的讨论，等等。这是一本百科全书式的软件构建手册，涵盖了软件构建活动的方方面面，尤其强调提高软件质量的种种实践方法。
作者特别注重源代码的可读性，详细讨论了类和函数命名、变量命名、数据类型和控制结构、代码布局等编程的基本要素，也讨论了防御式编程、表驱动法、协同构建、开发者测试、性能优化等有效开发实践，这些都服务于软件的技术使命：管理复杂度。为了培养程序员编写高质量代码的习惯，书中展示了大量高质量代码示例(以及用作对比的低质量代码)，提高软件质量是降低开发成本的重要途径。除此之外，本书归纳总结了来自专家的经验、业界研究以及学术成果，列举了大量软件开发领域的真实案例与统计数据，提高本书的说服力。
本书中所论述的技术不仅填补了初级与高级编程实践之间的空白，而且也为程序员们提供了一个有关软件开发技术的信息来源。本书对经验丰富的程序员、技术带头人、自学的程序员及没有太多编程经验的学生都是大有裨益的。可以说，只要您具有一定的编程基础，想成为一名优秀的程序员，阅读本书都不会让您失望。'),
    ('UNIX环境高级编程','9787111523871','[美] W·理查德·史蒂文斯 著','机械工业出版社','2016-01-01','download/book2.pdf','书是被誉为UNIX编程“圣经”的AdvancedProgrammingintheUNIXEnvironment一书的第3版。在本书第2版出版后的8年中，UNIX行业发生了巨大的变化，特别是影响UNIX编程接口的有关标准变化很大。本书在保持前一版风格的基础上，根据*新的标准对内容进行了修订和增补，反映了*新的技术发展。书中除了介绍UNIX文件和目录、标准I/O库、系统数据文件和信息、进程环境、进程控制、进程关系、信号、线程、线程控制、守护进程、各种I/O、进程间通信、网络IPC、伪终端等方面的内容，还在此基础上介绍了众多应用实例，包括如何创建数据库函数库以及如何与网络打印机通信等。此外，还在附录中给出了函数原型和部分习题的答案。'),
    ('JavaScript DOM编程艺术（第2版）','9787115249999','[英] Jeremy Keith，[加] Jeffrey Sambells 著','人民邮电出版社','2011-04-01','','JavaScript是Web开发中重要的一门语言，它强大而优美。无论是桌面开发，还是移动应用。JavaScript都是必须掌握的技术。W3C的DOM标准是开发Web应用的基石。已经得到所有现代浏览器的支持，这使得跨平台Web开发成了一件轻松惬意的事。 
　　《JavaScript DOM编程艺术（第2版）》是超级畅销书的升级版，由倡导Web标准的领军人物执笔，揭示了前端开发的真谛，是学习JavaScript和DOM开发的必读之作。 
　　《JavaScript DOM编程艺术（第2版）》在简洁明快地讲述JavaScript和DOM的基本知识之后，通过几个实例演示了专业水准的网页开发技术，透彻阐述了平稳退化等一批至关重要的JavaScript编程原则和实践，并全面探讨了HTML5以及jQuery等JavaScript库。读者将看到JavaScript、HTML5和CSS如何协作来创建易用的、与标准兼容的Web设计，掌握使用JavaScript和DOM通过客户端动态效果和用户控制的动画来加强Web页面的必备技术；同时，还将对如何利用库提高开发效率有全面深入的理解。');

insert into book (name,isbn,author,publisher,pubdate,url,abstract,intime) values ('山海经','9787302404330','陈丝雨 绘；孙见坤 注','清华大学出版社','2015-11-01','','图画是《山海经》的灵魂，本书精选了《山海经》中经典、唯美、极具代表性的精怪典故，以至美至感的绘本激发艺术想象力，给读者穿越时空的灵感。为丰富内文，特请自幼痴爱研读《山海经》的国学天才孙见坤解读。本书经文主要参考的是宋淳熙七年池阳郡斋刻本，《山经》部分的各山位置及里程数主要参考的是谭其骧先生的观点兼有作者多年的探究。','2016-3-21 15:30:02'),
       ('程序员面试宝典（第5版）','9787121270574','欧立奇，刘洋，段韬 著','电子工业出版社','2015-09-01','','《程序员面试宝典（第5版）》是《程序员面试宝典》的第5 版，在保留第4 版的数据结构、面向对象、程序设计等主干的基础上，修正了前4 版近40 处错误，解释清楚一些读者提出的问题，并使用各大IT 公司及相关企业全新面试题（2014-2015）替换和补充原内容，以反映自第4 版以来两年多的时间内所发生的变化。
　　《程序员面试宝典（第5版）》取材于各大公司面试真题（笔试、口试、电话面试、英语面试，以及逻辑测试和智商测试），详细分析了应聘程序员（含网络、测试等）职位的常见考点。《程序员面试宝典（第5版）》不仅对传统的C 系语言考点做了详尽解释，还根据外企出题全新特点，新增加了对友元、Static、图形/音频、树、栈、ERP 等问题的深入讲解。最后《程序员面试宝典（第5版）》着力讲述了如何进行英语面试和电话面试，并对求职中签约、毁约的注意事项及群体面试进行了解析。
　　《程序员面试宝典（第5版）》的面试题除了有详细解析和答案外，对相关知识点还有扩展说明。真正做到了由点成线，举一反三，对读者从求职就业到提升计算机专业知识都有显著帮助。
　　《程序员面试宝典（第5版）》适合计算机相关专业应届毕业生阅读，也适合作为正在应聘软件行业的相关就业人员和计算机爱好者的参考书。','2014-02-11 09:32:02'),
    ('解决问题最简单的方法 [Think smart,act smart]','9787510448522','[英] 达伦·布里奇，[英] 戴维·路易斯 著；','新世界出版社','2014-04-01','','每天我们都会遇到各种问题，需要你好好琢磨琢磨。哪怕像要去哪儿度假之类的问题，都会很费心神。你需要考虑外出的风险，权衡各种选择，照顾到别人的需要，而且还要考虑费用问题。生活越丰富，你需要做出的决定就越多。很多看起来普通的问题，却不容易快速解决好。在本书中，我们将总结来自心理学家、数学家、商业顾问、竞技高手，甚至军事战略家的智慧，并提供给读者多项大脑练习和自我评估，同时附有各种有趣的背景信息和名人轶事。告诉你该怎样分析问题，理出方案，并找到简单聪明的办法来解决问题——你一定需要这本书！','2015-11-12 14:45:18');
    
create table bbs
(
    id int unsigned auto_increment,
    title varchar(255) not null,
    user_id int unsigned not null,
    content text not null,
    time timestamp not null default now(),
    primary key (id),
    foreign key (user_id) references user (id) on update cascade
);

insert into bbs(title,user_id,content) values
('今天我入职',(select id from user where username='user1'),'今天我坐了三趟牛车，才到了新公司。'),
('今天的中饭',(select id from user where username='user1'),'今天的中饭是肯德基，主管说了拿麦当劳的发票可以来报销中饭。');


#### 视图
create view v_bbs as
select bbs.id, bbs.title, user.username as author, bbs.time, bbs.content, user.id as author_id
from bbs
join user on bbs.user_id = user.id
;

create table bbs_reply
(
    id int unsigned auto_increment,
    bbs_id int unsigned not null,
    user_id int unsigned not null,
    content text not null,
    time timestamp not null default now(),
    primary key (id),
    foreign key (bbs_id) references bbs (id) on delete cascade on update cascade,
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

insert into bbs_reply(bbs_id,user_id,content) values (1,2,'我四级又没过啊'),(1,1,'关我屁事'),(2,2,'你特么在逗我');

create view v_bbs_reply as
select bbs_reply.id, bbs.id as bbs_id, user.username as author, user.id as author_id, bbs_reply.time, bbs_reply.content 
from bbs_reply
join user on bbs_reply.user_id = user.id
join bbs on bbs_reply.bbs_id = bbs.id
;

create table borrowing
(
    id int unsigned auto_increment,
    user_id int unsigned not null,
    book_id int unsigned not null,
    borrow_date date,
    return_date date,
    primary key (id),
    foreign key (user_id) references user (id) on delete cascade on update cascade,
    foreign key (book_id) references book (id) on delete cascade on update cascade
);

create view v_borrowing as
select borrowing.id,book_id as book_id, book.name, book.isbn, book.author, book.publisher, book.pubdate, book.url, borrowing.borrow_date, borrowing.return_date, user_id
from borrowing
join user on borrowing.user_id = user.id
join book on borrowing.book_id = book.id
;
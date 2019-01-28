import 'package:flutter/material.dart';
import './constants.dart' show AppColors,constants;
import './home/conversation_page.dart'show ConversationPage;

enum ActionItems{
  GROUP_CHAT,ADD_FRIEND,QR_SCAN,PAYMENT,HELP}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: FirstScreen(),
      theme: ThemeData(
        primaryColor: Color(AppColors.APPBAR_COLOR),
        cardColor: Color(AppColors.APPBAR_COLOR)
      ),
    );
  }

}
class NavigationIconView{
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;
  NavigationIconView({
    Key key,
    String title,
    IconData icon,
    IconData activeIcon
  }):_title = title, _icon = icon,_activeIcon = activeIcon,
      item = BottomNavigationBarItem(
        icon: Icon(icon),
        title: Text(title,),
        activeIcon: Icon(activeIcon,),
        backgroundColor: Colors.white,
      );
}

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstScreenState();
  }

}
class _FirstScreenState extends State<FirstScreen>{

  List<NavigationIconView> _navigationViews;
  int _currentIndex = 0;
  PageController _pageController;
  List<Widget> pages;



  _buildPopupMenuItem(int iconName , String title){
    return Row(
      children: <Widget>[
        Icon(IconData(
          iconName,
          fontFamily: constants.APP_ICONFONT_FAMILY
        ),
          size: 22.0,
          color: Color(AppColors.APPBAR_POPUP_MENU_COLOR),
        ),
        Container(width:16.0),
        Text(title,style: TextStyle(color: Color(AppColors.APPBAR_POPUP_MENU_COLOR)),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      fixedColor: Color(AppColors.TAB_ICON_ACTIVE),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;

          _pageController.animateToPage(_currentIndex,
              duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
        });
        print("点击的是第$index个Tab");
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search,size: 22.0,),
              onPressed: (){
                //Scaffold.of(context).showSnackBar(SnackBar(content: Text("你按了查找按钮")));
                print("你按了查找按钮");
              }
          ),
          PopupMenuButton(
              itemBuilder: (BuildContext context){
                return <PopupMenuItem<ActionItems>>[
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe634, "发起群聊"),
                    value: ActionItems.GROUP_CHAT,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe8ca, "添加朋友"),
                    value: ActionItems.ADD_FRIEND,
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe661, "扫一扫"),
                  value: ActionItems.QR_SCAN
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe6ae, "收付款"),
                    value: ActionItems.PAYMENT
                  ),
                  PopupMenuItem(
                    child: _buildPopupMenuItem(0xe605, "帮助与反馈"),
                    value: ActionItems.HELP
                  )
                ];
              },
            icon: Icon(Icons.add,size: 22.0,),
            onSelected: (ActionItems selected){
              //Scaffold.of(context).showSnackBar(SnackBar(content: Text("你按了$selected按钮")));
              print("你按了$selected按钮");
            },
          )
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (context,index){
          return pages[index];
        },
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
    NavigationIconView(
      title:"微信",
      icon: IconData(0xe64f,fontFamily: constants.APP_ICONFONT_FAMILY),
      activeIcon: IconData(0xe63f,fontFamily: constants.APP_ICONFONT_FAMILY)
    ),
    NavigationIconView(
        title:"通讯录",
        icon: IconData(0xe601,fontFamily: constants.APP_ICONFONT_FAMILY),
        activeIcon: IconData(0xe600,fontFamily: constants.APP_ICONFONT_FAMILY)
    ),
    NavigationIconView(
        title:"发现",
        icon: IconData(0xe656,fontFamily: constants.APP_ICONFONT_FAMILY),
        activeIcon: IconData(0xe644,fontFamily: constants.APP_ICONFONT_FAMILY)
    ),
    NavigationIconView(
        title:"我",
        icon: IconData(0xe67b,fontFamily: constants.APP_ICONFONT_FAMILY),
        activeIcon: IconData(0xe67c,fontFamily: constants.APP_ICONFONT_FAMILY)
    ),
    ];
    _pageController = PageController(
      initialPage: _currentIndex
    );
    pages = [
      ConversationPage(),
      Container(color: Colors.lightBlueAccent,),
      Container(color: Colors.amber,),
      Container(color: Colors.deepPurpleAccent,),
    ];
  }

}
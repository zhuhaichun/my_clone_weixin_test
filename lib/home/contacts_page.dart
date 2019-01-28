import 'package:flutter/material.dart';
import '../modal/contacts.dart';
import '../constants.dart';

class _ContactItem extends StatelessWidget{
  //final ContactsPageData data = ContactsPageData.mock();
  //final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed
});
  bool get _isAvatarFromNet{
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }
  @override
  Widget build(BuildContext context) {
    //图标
    Widget _avatarIcon;
    if(_isAvatarFromNet){
     _avatarIcon = Image.network(
      avatar,
      width: constants.CONTACT_AVATAR_SIZE,
      height: constants.CONTACT_AVATAR_SIZE,);
    }else{
      _avatarIcon = Image.asset(
        avatar,
        width: constants.CONTACT_AVATAR_SIZE,
        height: constants.CONTACT_AVATAR_SIZE,);
    }
    //列表项主体
    Widget _button = Container(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 16.0,right: 16.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: constants.DIVIDER_WIDTH,color: Color(AppColors.DIVIDER_COLOR))
          )
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0,),
          Text(title,)
        ],
      ),
    );
    //分组标签
    Widget _itemBody;
    if(this.groupTitle != null){
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0,right: 16.0,top: 4.0,bottom: 4.0),
            color: Color(AppColors.CONTACT_GROUP_TITLE_BG_COLOR),
            alignment: Alignment.centerLeft,
            child: Text(this.groupTitle,style: AppStyles.GroupTitleItemTextStyle,),
          ),
          _button
        ],
      );
    }else{
      _itemBody = _button;
    }
    return  _itemBody;
  }

}

class ContactsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }

}
class _ContactsPageState extends State<ContactsPage>{
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: "新的朋友",
      onPressed: (){print("添加新朋友");},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: "群聊",
      onPressed: (){print("点击群聊");},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: "标签",
      onPressed: (){print("点击标签");},
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: "公众号",
      onPressed: (){print("添加公众号");},
    ),
  ];

  @override
  void initState() {
    _contacts..addAll(data.contacts)
      ..addAll(data.contacts)..addAll(data.contacts);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          if(index < _functionButtons.length){
            return _functionButtons[index];
          }
          Contact _contact = _contacts[index - _functionButtons.length];
          return _ContactItem(avatar: _contact.avatar,title: _contact.name,groupTitle: _contact.nameIndex,);
        },
      itemCount: _contacts.length + _functionButtons.length,

        );
  }

}
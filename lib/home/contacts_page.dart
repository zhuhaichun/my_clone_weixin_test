import 'package:flutter/material.dart';

import '../constants.dart';
import '../modal/contacts.dart';

const INDEX_BAR_WORDS = [
  "↑", "☆",
  "A", "B", "C", "D", "E", "F", "G", "H",
  "I", "J", "K", "L", "M", "N", "O", "P", "Q",
  "R", "S", "T", "U", "V", "W", "X", "Y", "Z"
];

class _ContactItem extends StatelessWidget {
  //final ContactsPageData data = ContactsPageData.mock();
  //final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;


  static const double MARGIN_VERTICAL = 10.0;
  //final double BUTTON_HEIGHT = 48.0;
  static const double GROUP_TITLE_HEIGHT = 24.0;

  _ContactItem(
      {@required this.avatar,
      @required this.title,
      this.groupTitle,
      this.onPressed});

  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  static double height(bool hasGroupTitle){
    final _bottonHeight = MARGIN_VERTICAL*2
        + constants.CONTACT_AVATAR_SIZE + constants.DIVIDER_WIDTH;
    if(hasGroupTitle){
      return _bottonHeight + GROUP_TITLE_HEIGHT;
    }
    return _bottonHeight;
  }

  @override
  Widget build(BuildContext context) {
    //图标
    Widget _avatarIcon;
    if (_isAvatarFromNet) {
      _avatarIcon = Image.network(
        avatar,
        width: constants.CONTACT_AVATAR_SIZE,
        height: constants.CONTACT_AVATAR_SIZE,
      );
    } else {
      _avatarIcon = Image.asset(
        avatar,
        width: constants.CONTACT_AVATAR_SIZE,
        height: constants.CONTACT_AVATAR_SIZE,
      );
    }
    //列表项主体
    Widget _button = Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: constants.DIVIDER_WIDTH,
                  color: Color(AppColors.DIVIDER_COLOR)))),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(
            width: 10.0,
          ),
          Text(
            title,
          )
        ],
      ),
    );
    //分组标签
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, ),
            height: GROUP_TITLE_HEIGHT,
            color: Color(AppColors.CONTACT_GROUP_TITLE_BG_COLOR),
            alignment: Alignment.centerLeft,
            child: Text(
              this.groupTitle,
              style: AppStyles.GroupTitleItemTextStyle,
            ),
          ),
          _button
        ],
      );
    } else {
      _itemBody = _button;
    }
    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  Color _indexBarBg = Colors.transparent;
  String _currentLetter = '';
  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }
}

class _ContactsPageState extends State<ContactsPage> {
  final ContactsPageData data = ContactsPageData.mock();
  ScrollController _scrollController;
  final Map _letterPosMap ={INDEX_BAR_WORDS[0]:0.0};
  final List<Contact> _contacts = [];
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: "新的朋友",
      onPressed: () {
        print("添加新朋友");
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: "群聊",
      onPressed: () {
        print("点击群聊");
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: "标签",
      onPressed: () {
        print("点击标签");
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: "公众号",
      onPressed: () {
        print("添加公众号");
      },
    ),
  ];

  @override
  void initState() {
    _contacts
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts);
    _contacts.sort((Contact a, Contact b) {
      return a.nameIndex.compareTo(b.nameIndex);
    });
    //_contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    _scrollController = new ScrollController();

    var _totalPos = _functionButtons.length * _ContactItem.height(false);
    for(int i = 0; i < _contacts.length; i++){
      bool _ishasGroupTitle = true;
      if(i > 0 && _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0){
        _ishasGroupTitle = false;
      }
      if(_ishasGroupTitle){
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContactItem.height(_ishasGroupTitle);
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String getLetter(BuildContext context, double tileHeight, Offset globalPos){
    RenderBox _box = context.findRenderObject();
    var lobal = _box.globalToLocal(globalPos);
    int index = (lobal.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  void _jumpTonIndex(String letter){
    if(_letterPosMap.isNotEmpty){
      final _pos = _letterPosMap[letter];
      if(_pos != null){
        _scrollController.animateTo(_pos,
            duration: Duration(milliseconds: 100), curve: Curves.easeOut);
      }
    }
  }

  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints){
    final List<Widget> _letter = INDEX_BAR_WORDS.map((String word){
      return Expanded(
        child: Text(word),
      );
    }).toList();
    final _totalHeight = constraints.biggest.height;
    final double _tileHeight = _totalHeight / _letter.length;
    return GestureDetector(
      child:  Column(
          children: _letter
      ),
      //当点击滑动时会调用
      onVerticalDragDown: (DragDownDetails details){
        setState(() {
          widget._indexBarBg = Colors.black26;
          widget._currentLetter = getLetter(context, _tileHeight, details.globalPosition);
          _jumpTonIndex(widget._currentLetter);
        });

      },
      //当垂直滑动结束时调用（需要滑动后，没有滑动的点击结束不调用）
      onVerticalDragEnd: (DragEndDetails details){
        setState(() {
          widget._indexBarBg = Colors.transparent;
          widget._currentLetter = null;

        });
      },
      //当点击后没滑动就抬起时调用
      onVerticalDragCancel: (){
        setState(() {
          widget._indexBarBg = Colors.transparent;
          widget._currentLetter = null;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details){
        setState(() {
          widget._currentLetter = getLetter(context, _tileHeight, details.globalPosition);
          _jumpTonIndex(widget._currentLetter);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //var _totalPos =0.0;
    final List<Widget> body = [ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index < _functionButtons.length) {
//              _totalPos += _functionButtons[index].height(false);
          return _functionButtons[index];
        }
        bool _isGroupTitle = true;
        int _contactIndex = index - _functionButtons.length;
        Contact _contact = _contacts[_contactIndex];
        if (_contactIndex >= 1 &&
            _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
          _isGroupTitle = false;
        }

//            _ContactItem _contactItem = _ContactItem(
//              avatar: _contact.avatar,
//              title: _contact.name,
//              groupTitle: _isGroupTitle ? _contact.nameIndex : null,
//            );
//            if(_isGroupTitle){
//              _letterPosMap[_contact.nameIndex] = _totalPos;
//            }
//            _totalPos += _contactItem.height(_isGroupTitle);
        return _ContactItem(
          avatar: _contact.avatar,
          title: _contact.name,
          groupTitle: _isGroupTitle ? _contact.nameIndex : null,
        );
      },
      itemCount: _contacts.length + _functionButtons.length,
    ),
    Positioned(
        width: constants.INDEX_BAR_WIDTH,
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        child: Container(
        child: LayoutBuilder(builder: _buildIndexBar),
        color: widget._indexBarBg,
    )
    ),
    ];
    if(widget._currentLetter != null && widget._currentLetter.isNotEmpty){
      body.add(Center(
        child: Container(

          width: constants.INDEX_LETTER_BOX_SIZE,
          height: constants.INDEX_LETTER_BOX_SIZE,
          decoration: BoxDecoration(
            color: AppColors.INDEX_LETTER_BOX_BG,
            borderRadius: BorderRadius.all(Radius.circular(constants.INDEX_LETTER_BOX_RADIUS)),
          ),
          child: Center(
            child: Text(widget._currentLetter,style: AppStyles.IndexLetterBoxTextStyle,),
          ),
        ),
      )
      );
    }
    return Stack(
      children: body
    );
  }
}

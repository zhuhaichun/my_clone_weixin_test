import 'package:flutter/material.dart';
import '../constants.dart' show AppColors,AppStyles,constants;
import '../modal/converastion.dart';
import '../constants.dart';



class _ConversationItem extends StatelessWidget{

  const _ConversationItem({Key key,this.conversation})
      :assert(conversation != null),super(key : key);

  final Conversation conversation;
  @override
  Widget build(BuildContext context) {

    //根据图片的获取方式初始化network或asset的Image组件
    Widget avatar;
    if(conversation.isAvatarFromNet()){
      avatar = Image.network(
        conversation.avatar,
        width: constants.CONVERSATION_AVATAR_SIZE,
        height: constants.CONVERSATION_AVATAR_SIZE,
      );
    }else{
      avatar = Image.asset(
        conversation.avatar,
        width: constants.CONVERSATION_AVATAR_SIZE,
        height: constants.CONVERSATION_AVATAR_SIZE,
      );
    }
    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0) {
      //未读消息角标
      Widget unreadMsgCountText = Container(
        width: constants.UNREAD_MAG_NOTIFY_DOT_SIZE,
        height: constants.UNREAD_MAG_NOTIFY_DOT_SIZE,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              constants.UNREAD_MAG_NOTIFY_DOT_SIZE / 2.0),
          color: Color(AppColors.NOTIFY_DOT_BG_COLOR),
        ),
        child: Text(conversation.unreadMsgCount.toString(),
          style: AppStyles.UnreadMsgCountStyle,),
      );
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
              right: -6.0,
              top: -6.0,
              child: unreadMsgCountText
          ),
        ],
      );
    }else{
      avatarContainer = avatar;
    }
    //勿扰模式图标
    var _rightArea = <Widget>[
      Text(conversation.updateAt,style: AppStyles.DesStyle,),
      SizedBox(height: 10.0,)
    ];
    if(conversation.isMute){
      _rightArea.add(
          Icon(IconData(
          0xe74d,
          fontFamily: constants.APP_ICONFONT_FAMILY),
          color: Color(AppColors.CONVERSATION_MUTE_ICON_COLOR),
          size: constants.CONVERSATION_MUTE_ICON_SIZE,));
    }else{
      _rightArea.add(
          Icon(IconData(
          0xe74d,
          fontFamily: constants.APP_ICONFONT_FAMILY),
          color: Colors.transparent,
          size: constants.CONVERSATION_MUTE_ICON_SIZE,)
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Color(AppColors.CONVERSATION_BACKGTOUND_COLOR),
        border: Border(
          bottom: BorderSide(color: Color(AppColors.DIVIDER_COLOR),width: constants.DIVIDER_WIDTH)
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title,style: AppStyles.TitleStyle,),
                Text(conversation.des,style: AppStyles.DesStyle,)
              ],
            ),
          ),
          Column(
            children: _rightArea,
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ConversationPageState();
  }

}
class _ConversationPageState extends State<ConversationPage>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          return _ConversationItem(conversation:mockConversations[index]);
        },
      itemCount: mockConversations.length,
    );
  }
}
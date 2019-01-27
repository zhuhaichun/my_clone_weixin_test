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
          Image.asset(
            "assets/images/default_nor_avatar.png",
            width: constants.CONVERSATION_AVATAR_SIZE,
            height: constants.CONVERSATION_AVATAR_SIZE,
          ),
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
            children: <Widget>[
              Text(conversation.updateAt,style: AppStyles.DesStyle,)
            ],
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
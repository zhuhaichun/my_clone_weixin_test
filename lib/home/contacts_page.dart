import 'package:flutter/material.dart';
import '../modal/contacts.dart';
import '../constants.dart';

class _ContactItem extends StatelessWidget{
  //final ContactsPageData data = ContactsPageData.mock();
  //final Contact _contact = ContactsPageData.mock().contacts[0];

  final String avatar;
  final String title;
  final String groupTitle;
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle
});
  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = Image.network(
      avatar,
      width: constants.CONTACT_AVATAR_SIZE,
      height: constants.CONTACT_AVATAR_SIZE,);
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: constants.DIVIDER_WIDTH,color: Color(AppColors.DIVIDER_COLOR))
            )
        ),
        child: Row(
          children: <Widget>[
            _avatarIcon,
            SizedBox(width: 10.0,),
            Text(title)
          ],
        ),
      )
    );
  }

}

class ContactsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ContactsPageState();
  }

}
class _ContactsPageState extends State<ContactsPage>{
  final List<Contact> _contacts = ContactsPageData.mock().contacts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          Contact _contact = _contacts[index];
          return _ContactItem(avatar: _contact.avatar,title: _contact.name,);
        },
      itemCount: _contacts.length,

        );
  }

}
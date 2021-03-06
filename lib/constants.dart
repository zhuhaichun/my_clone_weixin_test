import 'package:flutter/material.dart';

enum Device{
  MAC,WIN
}

class AppColors{
    static const APPBAR_COLOR = 0xff303030;
    static const TAB_ICON_NORMAL = 0xff999999;
    static const TAB_ICON_ACTIVE = 0xff46c11b;
    static const APPBAR_POPUP_MENU_COLOR = 0xffffffff;
    static const TITLE_TEXT_COLOR = 0xff353535;
    static const CONVERSATION_BACKGTOUND_COLOR = 0xffffffff;
    static const DES_TEXT_COLOR = 0xff9e9e9e;
    static const DIVIDER_COLOR = 0xffd9d9d9;
    static const NOTIFY_DOT_BG_COLOR = 0xffff3e3e;
    static const NOTIFY_DOT_TEXT_COLOR = 0xffffffff;
    static const CONVERSATION_MUTE_ICON_COLOR = 0xffd8d8d8;
    static const DEVICE_INFO_ITEM_BG_COLOR = 0xfff5f5f5;
    static const DEVICE_INFO_ITEM_TEXT_COLOR = 0xff606062;
    static const DEVICE_INFO_ICON_COLOR = 0xff606062;
    static const CONTACT_GROUP_TITLE_BG_COLOR = 0xffebebeb;
    static const CONTACT_GUOUP_TITLE_TEXT_COLOR = 0xff888888;
    static const INDEX_LETTER_BOX_BG = Colors.black45;
    static const BACKGROUND_COLOR = 0xffededed;
}
class AppStyles{
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.TITLE_TEXT_COLOR)
  );
  static const DesStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.DES_TEXT_COLOR)
  );
  static const UnreadMsgCountStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NOTIFY_DOT_TEXT_COLOR)
  );
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DEVICE_INFO_ITEM_TEXT_COLOR),
  );
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.CONTACT_GUOUP_TITLE_TEXT_COLOR)
  );
  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white
  );
  static const MyselfNickNameTextStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black
  );
  static const MyselfWeChatAccountTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.grey
  );
}
class constants{
  static const APP_ICONFONT_FAMILY = "appIconFont";
  static const CONVERSATION_AVATAR_SIZE = 48.0;
  static const DIVIDER_WIDTH = 1.0;
  static const UNREAD_MAG_NOTIFY_DOT_SIZE = 20.0;
  static const CONVERSATION_MUTE_ICON_SIZE = 18.0;
  //static const DEVICE_INFO_ITEM_HEIGHT =
  static const CONTACT_AVATAR_SIZE = 36.0;
  static const INDEX_BAR_WIDTH = 24.0;
  static const INDEX_LETTER_BOX_SIZE = 114.0;
  static const INDEX_LETTER_BOX_RADIUS = 4.0;
  static const FULL_WIDTH_ICON_BUTTON_ICON_SIZE = 24.0;
  static const MYSELF_TITLE_ICON_SIZE = 64.0;

}
import 'package:flutter/material.dart';

class AppColors{
    static const APPBAR_COLOR = 0xff303030;
    static const TAB_ICON_NORMAL = 0xff999999;
    static const TAB_ICON_ACTIVE = 0xff46c11b;
    static const APPBAR_POPUP_MENU_COLOR = 0xffffffff;
    static const TITLE_TEXT_COLOR = 0xff353535;
    static const CONVERSATION_BACKGTOUND_COLOR = 0xffffffff;
    static const DES_TEXT_COLOR = 0xff9e9e9e;
    static const DIVIDER_COLOR = 0xffd9d9d9;

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
}
class constants{
  static const APP_ICONFONT_FAMILY = "appIconFont";
  static const CONVERSATION_AVATAR_SIZE = 48.0;
  static const DIVIDER_WIDTH = 1.0;
}
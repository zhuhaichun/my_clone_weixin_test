import 'package:flutter/material.dart';

import 'full_width_icon_button.dart';

import '../constants.dart';

class MyselfPage extends StatefulWidget {
  @override
  _MyselfPageState createState() => _MyselfPageState();
}

class _MyselfPageState extends State<MyselfPage> {
  static const SEPARATE_SIZE = 24.0;
  @override
  Widget build(BuildContext context) {
    Widget title = Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network('https://randomuser.me/api/portraits/women/66.jpg',
          width: constants.MYSELF_TITLE_ICON_SIZE,
          height: constants.MYSELF_TITLE_ICON_SIZE,),
          SizedBox(width: 8.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('多利的猫粮',style: AppStyles.MyselfNickNameTextStyle,),
              SizedBox(height: 8.0,),
              Text('微信号：cqm_old',style: AppStyles.MyselfWeChatAccountTextStyle,)
            ],
          ),
          SizedBox(width: 128.0,),
          Image.asset(
            'assets/images/ic_qrcode_preview_tiny.png',
            width: 18.0,
            height: 18.0,
          )
        ],
      ),
    );
    return SingleChildScrollView(
      //所有的列表项会在初始化时加载完成
        child: Container(
          color: Color(AppColors.BACKGROUND_COLOR),
          child: Column(
            children: <Widget>[
              SizedBox(height: SEPARATE_SIZE,),
              title,
              SizedBox(height: SEPARATE_SIZE,),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_wallet.png',
                  title: '钱包',
                  onPressed: () {}),
              SizedBox(height: SEPARATE_SIZE,),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_collections.png',
                  title: '收藏',
                  showDivider: true,
                  onPressed: () {}),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_album.png',
                  title: '相册',
                  showDivider: true,
                  onPressed: () {}),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_cards_wallet.png',
                  title: '卡包',
                  showDivider: true,
                  onPressed: () {}),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_emotions.png',
                  title: '表情',
                  onPressed: () {}),
              SizedBox(height: SEPARATE_SIZE,),
              FullWidthIconButton(
                  iconPath: 'assets/images/ic_settings.png',
                  title: '设置',
                  onPressed: () {}),
            ],
          ),
        )
    );
  }
}
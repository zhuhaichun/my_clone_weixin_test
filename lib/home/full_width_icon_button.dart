import 'package:flutter/material.dart';
import '../constants.dart';

class FullWidthIconButton extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onPressed;
  final bool showDivider;

  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  FullWidthIconButton({
   @required this.iconPath,
   @required this.title,
    this.showDivider : false,
   @required this.onPressed
}) : assert (iconPath != null),
     assert (title != null),
     assert (onPressed != null);
  @override
  Widget build(BuildContext context) {
    final pureButton = Container(
      padding: EdgeInsets.symmetric(vertical: VERTICAL_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            iconPath,
            width: constants.FULL_WIDTH_ICON_BUTTON_ICON_SIZE,
            height: constants.FULL_WIDTH_ICON_BUTTON_ICON_SIZE,
          ),
          SizedBox(width: HORIZONTAL_PADDING,),
          Text(title)
        ],
      ),
    );
    final borderedButton = Container(
      child: pureButton,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(AppColors.DIVIDER_COLOR),width: constants.DIVIDER_WIDTH)
        )
      ),
    );
    return FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: HORIZONTAL_PADDING),
        color: Colors.white,
        onPressed: (){},
        child: this.showDivider ? borderedButton : pureButton,
    );
  }
}

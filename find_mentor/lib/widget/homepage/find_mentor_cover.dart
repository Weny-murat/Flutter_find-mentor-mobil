import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/util/screen_util.dart';

class FindMentorCover extends StatelessWidget {
  const FindMentorCover({
    Key key,
    @required bool isKeyboardVisible,
    @required this.context,
    this.scale,
  })  : _isKeyboardVisible = isKeyboardVisible,
        super(key: key);

  final bool _isKeyboardVisible;
  final BuildContext context;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isKeyboardVisible ? 0.0 : 1,
      duration: Duration(milliseconds: 280),
      child: Container(
        height: !_isKeyboardVisible ? ScreenUtil.getHeight(context) * scale : 0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage(AppConstant.pngBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            AppConstant.appName,
            style: TextStyle(
                fontSize: 36.0,
                fontFamily: "Gilroy",
                foreground: Paint()
                  ..shader = AppConstant.primaryTextGradientColor),
          ),
        ),
      ),
    );
  }
}

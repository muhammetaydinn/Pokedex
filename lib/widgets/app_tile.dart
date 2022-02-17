import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constans/constants.dart';
import 'package:pokedex/constans/ui_helper.dart';

class AppTile extends StatefulWidget {
  const AppTile({Key? key}) : super(key: key);

  @override
  State<AppTile> createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  final String _pokePng = "assets/images/poke.png";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIhelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIhelper.getDefaultPadding(),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(Constants.title, style: Constants.getTitleTextStyle()),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              _pokePng,
              //dikey modda w
              //yatay modda h
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
              color: Colors.grey.withOpacity(0.3),
            ),
          )
        ],
      ),
    );
  }
}

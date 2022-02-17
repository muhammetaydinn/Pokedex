import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIhelper {
  UIhelper._();
  static double getAppTitleWidgetHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }
  static EdgeInsets getDefaultPadding(){
    if(ScreenUtil().orientation==Orientation.portrait){
      return EdgeInsets.all(12.h);
    }else{
      return EdgeInsets.all(8.w);
    }
  }
}

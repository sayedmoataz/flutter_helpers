import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilExtension on num {
  //! Custom extension for horizontal spacing using 'hs'
  Widget get hs => SizedBox(width: w); // Example: 20.hs

  //! Custom extension for vertical spacing using 'vs'
  Widget get vs => SizedBox(height: h); // Example: 15.vs

  //! Creates EdgeInsetsDirectional with all sides having the same padding
  EdgeInsetsDirectional get all => EdgeInsetsDirectional.all(toDouble().r);
  // Example: Padding(padding: 10.all)

  //! Creates EdgeInsetsDirectional with horizontal padding using 'ph'
  EdgeInsetsDirectional get ph => EdgeInsetsDirectional.symmetric(horizontal: toDouble().w);
  // Example: Padding(padding: 16.ph)

  //! Creates EdgeInsetsDirectional with vertical padding using 'pv'
  EdgeInsetsDirectional get pv => EdgeInsetsDirectional.symmetric(vertical: toDouble().h);
  // Example: Padding(padding: 12.pv)
}

extension BuildContextExtension on BuildContext {
  //! Access MediaQuery easily
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  //! Get screen width
  double get screenWidth => mediaQuery.size.width;
  // Example:
  // double width = context.screenWidth;

  //! Get screen height
  double get screenHeight => mediaQuery.size.height;
  // Example:
  // double height = context.screenHeight;

  //! Check orientation
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  // Example:
  // if (context.isPortrait) {
  // Perform action for portrait mode
  // } else {
  // Perform action for landscape mode
  // }
}

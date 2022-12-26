

import 'package:flutter/material.dart';
import 'package:sniper/feature/presentation/widgets/text_widget.dart';

// normal button
class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key, this.bgColor, this.widget, this.height, this.width, this.radius,required this.onTap}) : super(key: key);
  final Color? bgColor;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  final GestureTapCallback onTap;
  

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: bgColor ?? Colors.black.withOpacity(0.7),
        child: widget ?? const TextWidget(title: 'Title'),
        height: height ?? 35.0,
        minWidth: width ?? 85.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius??7.0)),
        onPressed: onTap);
  }
}

// LTD button

class ButtonLTDWidget extends StatelessWidget {
  const ButtonLTDWidget({Key? key, this.bgColor, this.widget, this.height, this.width, this.radius,required this.onTap, this.focusColor}) : super(key: key);
  final Color? bgColor;
  final Color? focusColor;
  final Widget? widget;
  final double? height;
  final double? width;
  final double? radius;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        disabledElevation: 8,
        disabledColor: Colors.cyan,
        elevation: 0.0,
        hoverColor: focusColor,
        highlightColor: focusColor,
        color: bgColor ?? Colors.deepPurpleAccent,
        child: widget ??  TextWidget(title: 'Title'),
        height: height ?? 35.0,
        minWidth: width ?? 85.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??4.0),

        ),
        onPressed:onTap);
  }
}




//Circle Button
class CircleBtnWidget extends StatelessWidget {
  const CircleBtnWidget({Key? key, this.bgColor, this.icon, this.iconSize, this.radius,required this.onTap, this.iconColor}) : super(key: key);
  final Color? bgColor;
  final Color? iconColor;
  final IconData? icon;

  final double? iconSize;
  final double? radius;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: radius ?? 30.0,
        color: bgColor ?? Colors.deepPurpleAccent,

        onPressed: onTap, icon: Icon(icon ?? Icons.arrow_back,color: iconColor?? Colors.white,size: iconSize ?? 24.0,),);
  }
}

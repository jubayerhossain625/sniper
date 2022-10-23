import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//normal text widget
class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, this.title, this.color, this.size, this.weight}) : super(key: key);
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? weight;


  @override
  Widget build(BuildContext context) {
    return Text(title??'Title',style: GoogleFonts.openSans(fontSize: size??14.0,color: color?? Colors.black, fontWeight: weight?? FontWeight.normal),
        overflow: TextOverflow.ellipsis,);
  }
}

//Limited Text Widget
class TextLtdWidget extends StatelessWidget {
  const TextLtdWidget(
      {Key? key, this.title, this.color, this.size, this.weight, this.line})
      : super(key: key);
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? line;


  @override
  Widget build(BuildContext context) {
    return Text(title ?? 'Title', style: GoogleFonts.openSans(
        fontSize: size ?? 14.0,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal),
      maxLines: line ?? 1, overflow: TextOverflow.ellipsis,);
  }
}
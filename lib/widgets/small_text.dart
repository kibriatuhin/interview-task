import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  double? size;
  //TextOverFlow overFlow;
  SmallText({Key? key,required this.color,required this.text, this.size=12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: color,
          fontSize: size,

      ),
    );
  }
}

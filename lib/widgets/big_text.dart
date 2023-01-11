import 'package:flutter/material.dart';
class BigText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  //TextOverFlow overFlow;
   BigText({Key? key,required this.color,required this.text,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight:  FontWeight.w400
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final Function onPressed;
  final Icon icon;
  final Color background;
  final Color color;
  final double width;
  final double height;

  const ButtonCustom(
      {Key key,
      @required this.onPressed,
      @required this.icon,
      Color color,
      double width,
      double height,
      Color background})
      : this.background = background ?? Colors.red,
        this.color = color ?? Colors.red,
        this.width = width ?? 40,
        this.height = height ?? 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1,
            offset: Offset(-1, 2),
            color: Color(0XFFa2aecf),
          )
        ],
      ),
      child: IconButton(
        color: Colors.white,
        icon: this.icon,
        onPressed: this.onPressed,
      ),
    );
  }
}

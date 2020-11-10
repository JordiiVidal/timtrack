import 'package:flutter/material.dart';

class IconShadow extends StatelessWidget {
  final IconData icon;
  final String pushNamed;
  const IconShadow({Key key, this.icon, this.pushNamed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 8,
            offset: Offset(-1, 2),
            color: Color(0XFFa2aecf),
          )
        ],
      ),
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: Icon(this.icon),
        onPressed: () => Navigator.pushNamed(context, this.pushNamed),
      ),
    );
  }
}

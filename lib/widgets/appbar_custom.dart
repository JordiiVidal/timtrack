import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final IconData icon;
  final String pushNamed;
  const AppBarCustom({Key key, this.title, this.icon, this.pushNamed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}

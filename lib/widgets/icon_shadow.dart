import 'package:flutter/material.dart';

class IconShadow extends StatelessWidget {
  final IconData icon;
  final String pushNamed;
  final bool pop;
  const IconShadow({this.icon, this.pushNamed, bool pop})
      : this.pop = pop ?? false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => (pop)
          ? Navigator.pop(context)
          : Navigator.pushNamed(context, this.pushNamed),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 8,
              offset: Offset(-1, 2),
              color: Color(0XFFa2aecf),
            )
          ],
        ),
        child: Icon(
          this.icon,
          size: 20,
        ),
      ),
    );
  }
}

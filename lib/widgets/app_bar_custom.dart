import 'package:flutter/material.dart';
import 'package:timtrack/widgets/icon_shadow.dart';

class AppBarCustom extends StatelessWidget {
  final String title;
  final IconData icon;
  final String pushNamed;
  final bool pop;
  const AppBarCustom({Key key, this.title, this.icon, this.pushNamed, bool pop})
      : this.pop = pop ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (pop)
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context))
              : SizedBox(),
          Text(
            this.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconShadow(
            icon: this.icon,
            pushNamed: this.pushNamed,
          )
        ],
      ),
    );
  }
}

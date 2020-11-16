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
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (pop)
                    ? IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    : SizedBox(),
                Text(
                  this.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          (this.icon == null)
              ? SizedBox()
              : IconShadow(
                  icon: this.icon,
                  pushNamed: this.pushNamed,
                )
        ],
      ),
    );
  }
}

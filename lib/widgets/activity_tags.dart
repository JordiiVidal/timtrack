import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timtrack/bloc/activity/activity.dart';
import 'package:timtrack/widgets/modal_create_tag.dart';

class ActivityTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tags',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showBarModalBottomSheet(
                      expand: true,
                      duration: Duration(milliseconds: 600),
                      context: context,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      topControl: Container(
                        height: 300,
                      ),
                      builder: (context) => ModalCreateTag(),
                    );
                  },
                )
              ],
            ),
          ),
          BlocBuilder<ActivityBloc, ActivityState>(
            builder: (context, state) {
              if (state is ActivityLoadSuccess) {
                if (state.activity.tags.length > 0) {
                  return Tags(
                    key: _tagStateKey,
                    spacing: 12,
                    alignment: WrapAlignment.start,
                    itemCount: state.activity.tags.length, // required
                    itemBuilder: (int index) {
                      final String tag = state.activity.tags[index];
                      return ItemTags(
                        key: Key('$index'),
                        index: index, // required
                        title: tag,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        textStyle: TextStyle(fontSize: 15),
                        pressEnabled: true,
                        combine: ItemTagsCombine.withTextBefore,
                        removeButton: ItemTagsRemoveButton(
                          size: 16,
                          onRemoved: () {
                            BlocProvider.of<ActivityBloc>(context)
                                .add(ActivityDeleteTag(index));
                            return false;
                          },
                        ),
                        onPressed: (item) =>
                            BlocProvider.of<ActivityBloc>(context)
                                .add(ActivityDeleteTag(index)),
                        // OR null,
                      );
                    },
                  );
                }
              }
              return Center(
                child: Text('Empty'),
              );
            },
          ),
        ],
      ),
    );
  }
}

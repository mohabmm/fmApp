import 'package:flutter/material.dart';
import 'package:flutter_app_test/ui/widget/common/button/custom_tag_button.dart';

class AlbumTags extends StatelessWidget {
  const AlbumTags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [CustomTagButton()],
          );
        },
      ),
    );
  }
}

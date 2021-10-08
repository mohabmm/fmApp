import 'package:flutter/material.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';

class PlayButton extends StatelessWidget {
  final double left;
  final double right;
  const PlayButton({
    required this.left,
    required this.right,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: right,
      child: Container(
        // color: Colors.grey,
        child: Icon(Icons.play_arrow),
        width: SizeConfig.screenHeight! * 0.03,
        height: SizeConfig.screenHeight! * 0.05,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.white54),
      ),
    );
  }
}

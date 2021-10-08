import 'package:flutter/material.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumMainData extends StatelessWidget {
  final String image;
  final String artist;
  final String album;
  final String listeners;
  final String smallImage;
  const AlbumMainData(
      {Key? key,
      required this.artist,
      required this.image,
      required this.listeners,
      required this.smallImage,
      required this.album})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.50,
      child: Stack(
        children: [
          Image.network(
            // "https://amayei.nyc3.digitaloceanspaces.com/2018/12/MAIN-IMAGE-GettyImages-923757908.jpg",
            image,
            width: ScreenUtil().screenWidth,
            height: MediaQuery.of(context).size.height * 0.44,
            fit: BoxFit.cover,
          ),

          // author name
          Positioned(
            // add the text name  from the backend here
            child: Text(
              // "Mitski",
              artist,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: ScreenUtil().screenWidth > 600 ? 16 : 12),
            ),
            left: SizeConfig.screenWidth! * 0.02,
            top: SizeConfig.screenWidth! * 0.05,
          ),

          // book name
          Positioned(
            // add the text name  from the backend here
            child: Text(
              // "Working For The Knife",
              album,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            left: SizeConfig.screenWidth! * 0.02,
            top: SizeConfig.screenWidth! * 0.11,
          ),

          // mini side image video
          Positioned(
            // add the text name  from the backend here
            child: Stack(
              alignment: Alignment.center,

              children: [
                Image.network(
                  smallImage,
                  width: SizeConfig.screenWidth! * 0.4,
                  height: SizeConfig.screenWidth! * 0.29,
                ),
                Container(
                  // color: Colors.grey,
                  child: Icon(Icons.play_arrow),
                  width: SizeConfig.screenWidth! * 0.16,
                  height: SizeConfig.screenWidth! * 0.16,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white54),
                ),
              ],

              // child:
            ),
            right: SizeConfig.screenWidth! * 0.008,
            bottom: 0,
          ),

          // play track button
          Positioned(
              bottom: SizeConfig.screenWidth! * 0.02,
              left: SizeConfig.screenWidth! * 0.01,
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.play_arrow),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.02,
                    ),
                    Text("Play Track"),
                  ],
                ),
                width: SizeConfig.screenWidth! * 0.29,
                height: SizeConfig.screenWidth! * 0.083,
                decoration: BoxDecoration(color: Colors.grey[350]),
              )),
          // // heart button
          Positioned(
              bottom: SizeConfig.screenWidth! * 0.02,
              left: SizeConfig.screenWidth! * 0.36,
              child: Container(
                child: Icon(Icons.favorite_border),
                width: SizeConfig.screenWidth! * 0.11,
                height: SizeConfig.screenWidth! * 0.08,
                decoration: BoxDecoration(color: Colors.grey[350]),
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';
import 'package:flutter_app_test/ui/view/album/album_details/album_details.dart';
import 'package:flutter_app_test/ui/widget/common/button/play_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeAlbumScreenData extends StatelessWidget {
  final String image;
  final String albumName;
  final String albumArtist;
  final bool clickable;
  const HomeAlbumScreenData({
    required this.image,
    required this.albumName,
    required this.albumArtist,
    Key? key,
    required this.clickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final navigationService = locator<NavigationService>();
        if (clickable) {
          navigationService.navigateToView(AlbumDetails(
            album: albumArtist,
            artist: albumName,
          ));
        }
      },
      child: Container(
        child: Stack(
          children: [
            Image.network(
              image,
              fit: BoxFit.contain,
            ),
            PlayButton(
              left: SizeConfig.screenWidth! * 0.05,
              right: SizeConfig.screenWidth! * 0.01,
            ),

            /// album name
            Positioned(
              bottom: SizeConfig.screenWidth! * 0.19,
              left: SizeConfig.screenWidth! * 0.03,
              child: Text(
                albumName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().screenWidth > 600 ? 16 : 12,
                    color: Colors.white),
              ),
            ),

            /// album artist
            Positioned(
              bottom: SizeConfig.screenWidth! * 0.16,
              left: SizeConfig.screenWidth! * 0.03,
              child: Text(
                albumArtist,
                style: (TextStyle(
                    fontSize: ScreenUtil().screenWidth > 600 ? 11 : 8,
                    color: Colors.white)),
              ),
            ),

            Positioned(
              bottom: SizeConfig.screenWidth! * 0.05,
              left: SizeConfig.screenWidth! * 0.01,
              right: SizeConfig.screenWidth! * 0.01,
              child: Text(
                "Popular right now on Last.fm",
                style: (TextStyle(
                    fontSize: ScreenUtil().screenWidth > 600 ? 16 : 12,
                    color: Colors.grey[700])),
              ),
            ),

            Positioned(
              bottom: SizeConfig.screenWidth! > 600
                  ? SizeConfig.screenWidth! * 0.08
                  : SizeConfig.screenWidth! * 0.11,
              right: SizeConfig.screenWidth! > 600
                  ? SizeConfig.screenWidth! * 0.01
                  : SizeConfig.screenWidth! * 0.02,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: SizeConfig.screenWidth! * 0.09,
                    height: SizeConfig.screenWidth! * 0.09,
                    decoration: BoxDecoration(
                        color: Colors.blue[900], shape: BoxShape.circle),
                  ),
                  Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius:
                BorderRadius.circular(SizeConfig.screenWidth! * 0.04)),
      ),
    );
  }
}

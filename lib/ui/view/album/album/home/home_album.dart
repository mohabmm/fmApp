import 'package:flutter/material.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';
import 'package:flutter_app_test/ui/view/album/album/search/search_page.dart';
import 'package:flutter_app_test/ui/widget/common/widget/home_album_screen_data.dart';

class HomeAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SearchPage())),
                icon: Icon(Icons.search))
          ],
          title: Text("FM App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 5 / 5,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return HomeAlbumScreenData(
                    image:
                        "https://amayei.nyc3.digitaloceanspaces.com/2018/12/MAIN-IMAGE-GettyImages-923757908.jpg",
                    albumName: 'My Universe',
                    albumArtist: "cold play",
                    clickable: false);
              }),
        ));
  }
}

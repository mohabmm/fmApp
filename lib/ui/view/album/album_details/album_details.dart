import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/view_model/album/details/details_view_model.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';
import 'package:flutter_app_test/ui/widget/album/album_details/album_main_data.dart';
import 'package:provider/provider.dart';

class AlbumDetails extends StatefulWidget {
  final String artist;
  final String album;
  AlbumDetails({Key? key, required this.artist, required this.album})
      : super(key: key);

  @override
  _AlbumDetailsState createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  void initState() {
    super.initState();
    Provider.of<DetailsViewModel>(context, listen: false)
        .showDetails(widget.album, widget.artist);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        body: (Provider.of<DetailsViewModel>(context).appStatus == "Loading")
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                top: true,
                child: Column(
                  children: [
                    AlbumMainData(
                      image: Provider.of<DetailsViewModel>(
                        context,
                      ).getSearchList[0].album.image[2].text,
                      album: Provider.of<DetailsViewModel>(
                        context,
                      ).getSearchList[0].album.name,
                      artist: Provider.of<DetailsViewModel>(
                            context,
                          ).getSearchList[0].album.artist ??
                          "",
                      listeners: Provider.of<DetailsViewModel>(
                        context,
                      ).getSearchList[0].album.listeners,
                      smallImage: SizeConfig.screenWidth! > 600
                          ? Provider.of<DetailsViewModel>(
                              context,
                            ).getSearchList[0].album.image[3].text
                          : Provider.of<DetailsViewModel>(
                              context,
                            ).getSearchList[0].album.image[1].text,
                    ),
                  ],
                ),
              ));
  }
}

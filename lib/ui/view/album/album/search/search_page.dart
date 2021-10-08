import 'package:flutter/material.dart';
import 'package:flutter_app_test/core/view_model/album/serach_view_model/search_view_model.dart';
import 'package:flutter_app_test/ui/utilis/size_confg.dart';
import 'package:flutter_app_test/ui/widget/common/widget/home_album_screen_data.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(SizeConfig.screenWidth! * 0.01)),
        child: Center(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Provider.of<SearchViewModel>(context, listen: false)
                        .startSearch(controller.text);

                    print(controller.text);
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
      body: Center(
          child: (Provider.of<SearchViewModel>(
                    context,
                  ).appStatus ==
                  "Loading")
              ? Center(child: CircularProgressIndicator())
              : (Provider.of<SearchViewModel>(
                        context,
                      ).getSearchList.length ==
                      0)
                  ? Text("please search on your data")
                  : Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 8,
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            childAspectRatio: (SizeConfig.screenWidth! > 600)
                                ? 3.79 / 5
                                : 3.8 / 5,
                            // childAspectRatio: 3.8 / 5,

                            crossAxisSpacing: 18,
                            mainAxisSpacing: 10),
                        itemCount: Provider.of<SearchViewModel>(
                          context,
                        ).getSearchList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HomeAlbumScreenData(
                            albumName: Provider.of<SearchViewModel>(
                              context,
                            ).getSearchList[index].name,
                            albumArtist: Provider.of<SearchViewModel>(
                              context,
                            ).getSearchList[index].artist,
                            image: ((SizeConfig.screenWidth! > 600))
                                ? Provider.of<SearchViewModel>(
                                    context,
                                  ).getSearchList[index].image[3].text
                                : Provider.of<SearchViewModel>(
                                    context,
                                  ).getSearchList[index].image[2].text,
                            clickable: true,
                          );
                        },
                      ),
                    )),
    );
  }
}

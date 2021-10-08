import 'package:flutter_app_test/core/app/app.locator.dart';
import 'package:flutter_app_test/core/service/api/api_service.dart';
import 'package:flutter_app_test/core/service/api/web_services.dart';
import 'package:flutter_app_test/core/service/api/web_services_impl.dart';
import 'package:flutter_app_test/core/service/utilities/scaffold/scaffold_service.dart';
import 'package:flutter_app_test/core/view_model/album/serach_view_model/search_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

import 'album_view_model_test.mocks.dart';

@GenerateMocks([],
    customMocks: [MockSpec<APIService>(returnNullOnMissingStub: true)])
@GenerateMocks([],
    customMocks: [MockSpec<WebService>(returnNullOnMissingStub: true)])
@GenerateMocks([],
    customMocks: [MockSpec<ScaffoldService>(returnNullOnMissingStub: true)])
@GenerateMocks([],
    customMocks: [MockSpec<NavigationService>(returnNullOnMissingStub: true)])

///Instead of using thenReturn,
/// if the function returns Future, we have to use thenAnswer.

void main() {
  void _removeRegistrationIfExists<T extends Object>() {
    if (locator.isRegistered<T>()) {
      locator.unregister<T>();
    }
  }

  WebService getAndRegisterWebService() {
    _removeRegistrationIfExists<MockWebService>();
    final service = MockWebService();
    locator.registerSingleton<WebService>(service);
    return service;
  }

  ScaffoldService getAndRegisterScaffoldService() {
    _removeRegistrationIfExists<MockScaffoldService>();
    final service = MockScaffoldService();
    locator.registerSingleton<ScaffoldService>(service);
    return service;
  }

  NavigationService getAndRegisterNavigationService() {
    _removeRegistrationIfExists<MockNavigationService>();
    final service = MockNavigationService();
    if (!locator.isRegistered<NavigationService>()) {
      locator.registerLazySingleton<NavigationService>(
          () => MockNavigationService());
    }
    return service;
  }

  APIService registerApiService() {
    _removeRegistrationIfExists<MockAPIService>();

    final service = MockAPIService();
    if (!locator.isRegistered<APIService>()) {
      locator.registerSingleton<APIService>(service);
    }
    return service;
  }

  group("Search album Tests ", () {
    void unregisterService() {
      if (locator.isRegistered<WebService>()) {
        locator.unregister<WebService>();
      }
      if (locator.isRegistered<APIService>()) {
        locator.unregister<APIService>();
      }
      if (locator.isRegistered<NavigationService>()) {
        locator.unregister<NavigationService>();
      }
      if (locator.isRegistered<ScaffoldService>()) {
        locator.unregister<ScaffoldService>();
      }
    }

    registerService() {
      registerApiService();
      getAndRegisterNavigationService();
      getAndRegisterWebService();
      getAndRegisterScaffoldService();
    }

    setUp(() => registerService());

    tearDown(() => unregisterService());

    test("The status of the app by default is Default", () async {
      var mockApiService = MockAPIService();

      when(mockApiService.search("searched"))
          .thenAnswer((_) async => ResponseObj(
                statusCode: 0,
                success: true,
                message: "Success",
                body: """
{
    "results": {
        "opensearch:Query": {
            "#text": "",
            "role": "request",
            "searchTerms": "believe",
            "startPage": "1"
        },
        "opensearch:totalResults": "138252",
        "opensearch:startIndex": "0",
        "opensearch:itemsPerPage": "50",
        "albummatches": {
            "album": [
                {
                    "name": "Believe",
                    "artist": "Disturbed",
                    "url": "https://www.last.fm/music/Disturbed/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "c559efc2-f734-41ae-93bd-2d78414e0356"
                },
                {
                    "name": "Make Believe",
                    "artist": "Weezer",
                    "url": "https://www.last.fm/music/Weezer/Make+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "9e7103bb-fc9a-4e5a-a90c-2a3ab4c08e19"
                },
                {
                    "name": "Believe (Deluxe Edition)",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe+(Deluxe+Edition)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/263880589b66186a82acd18187920c0c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/263880589b66186a82acd18187920c0c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/263880589b66186a82acd18187920c0c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/263880589b66186a82acd18187920c0c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ca337a40bbb78937bf330454761ee592.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "5d88ae0c-c4bf-4e64-bc97-45789880d910"
                },
                {
                    "name": "Believe",
                    "artist": "Cher",
                    "url": "https://www.last.fm/music/Cher/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "63b3a8ca-26f2-4e2b-b867-647a6ec2bebd"
                },
                {
                    "name": "Believers Never Die - Greatest Hits",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+-+Greatest+Hits",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/190429befa66419db3510a86774006cb.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/190429befa66419db3510a86774006cb.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/190429befa66419db3510a86774006cb.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/190429befa66419db3510a86774006cb.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "fa345686-b9cf-47d4-9862-e37e9199c4e5"
                },
                {
                    "name": "Don't Believe the Truth",
                    "artist": "Oasis",
                    "url": "https://www.last.fm/music/Oasis/Don%27t+Believe+the+Truth",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "af2763e9-ebb9-319b-93e0-02f7449e8a67"
                },
                {
                    "name": "The Bones of What You Believe",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "cac2fc42-25ce-4021-8030-39401f2563cf"
                },
                {
                    "name": "Believe Acoustic",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe+Acoustic",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "71d2222c-021e-46f6-baf7-49a7c1d0735d"
                },
                {
                    "name": "There Is a Hell, Believe Me I've Seen It. There Is a Heaven, Let's Keep It a Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+a+Hell,+Believe+Me+I%27ve+Seen+It.+There+Is+a+Heaven,+Let%27s+Keep+It+a+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "50b69889-a425-4e70-941b-7a8aea7f3b1f"
                },
                {
                    "name": "The Bones of What You Believe (Special Edition)",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe+(Special+Edition)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Hard Believer",
                    "artist": "Fink",
                    "url": "https://www.last.fm/music/Fink/Hard+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "5d1c2a68-1db2-4fa5-aa36-7d66a8e0d62f"
                },
                {
                    "name": "Believe in Nothing",
                    "artist": "Paradise Lost",
                    "url": "https://www.last.fm/music/Paradise+Lost/Believe+in+Nothing",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/184fb59b18664121c11939b81c25d865.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/184fb59b18664121c11939b81c25d865.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/184fb59b18664121c11939b81c25d865.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/184fb59b18664121c11939b81c25d865.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "735039fc-3866-49bf-a8ac-8d8ae8aa0171"
                },
                {
                    "name": "Believer",
                    "artist": "Imagine Dragons",
                    "url": "https://www.last.fm/music/Imagine+Dragons/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Master of My Make-Believe",
                    "artist": "Santigold",
                    "url": "https://www.last.fm/music/Santigold/Master+of+My+Make-Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "d80496fb-c5ea-4625-adb3-1b3dbabd0fae"
                },
                {
                    "name": "If You Can Believe Your Eyes And Ears",
                    "artist": "The Mamas & the Papas",
                    "url": "https://www.last.fm/music/The+Mamas+&+the+Papas/If+You+Can+Believe+Your+Eyes+And+Ears",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "97540853-647f-4826-91e9-438af03fd73b"
                },
                {
                    "name": "Shallow Believer",
                    "artist": "The Used",
                    "url": "https://www.last.fm/music/The+Used/Shallow+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/385a531c942341feba3bd20b52594eb1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "ea4193b8-67d7-4017-9e6b-ef286555a5b3"
                },
                {
                    "name": "True Believers",
                    "artist": "Darius Rucker",
                    "url": "https://www.last.fm/music/Darius+Rucker/True+Believers",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b624c2b6-a84a-46f5-b690-c923e3aed417"
                },
                {
                    "name": "There Is a Hell Believe Me I've Seen It, There Is a Heaven Let's Keep It a Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+a+Hell+Believe+Me+I%27ve+Seen+It,+There+Is+a+Heaven+Let%27s+Keep+It+a+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "If You Can Believe Your Eyes & Ears",
                    "artist": "The Mamas & the Papas",
                    "url": "https://www.last.fm/music/The+Mamas+&+the+Papas/If+You+Can+Believe+Your+Eyes+&+Ears",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believers Never Die (Volume Two)",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+(Volume+Two)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Orianthi",
                    "url": "https://www.last.fm/music/Orianthi/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "ad4fb2af-ab7f-4f82-9094-1726c9a53429"
                },
                {
                    "name": "Believers Never Die (Greatest Hits)",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+(Greatest+Hits)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/153636f28cb959e3510bef847c908a2a.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "4 Strings",
                    "url": "https://www.last.fm/music/4+Strings/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "1d3332d3-3b23-4f10-b0f1-736ee598370f"
                },
                {
                    "name": "Believers Never Die",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e0193847891e9113acd197e283f76733.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e0193847891e9113acd197e283f76733.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e0193847891e9113acd197e283f76733.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e0193847891e9113acd197e283f76733.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Reason To Believe",
                    "artist": "Pennywise",
                    "url": "https://www.last.fm/music/Pennywise/Reason+To+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "441659e9-eaef-431e-9f0c-6bec526119bf"
                },
                {
                    "name": "Believe",
                    "artist": "Mumford & Sons",
                    "url": "https://www.last.fm/music/Mumford+&+Sons/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Dream to Make Believe",
                    "artist": "Armor for Sleep",
                    "url": "https://www.last.fm/music/Armor+for+Sleep/Dream+to+Make+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "460b65c5-ac1b-44e1-89da-82a8ebf24d28"
                },
                {
                    "name": "You Must Believe in Spring",
                    "artist": "Bill Evans",
                    "url": "https://www.last.fm/music/Bill+Evans/You+Must+Believe+in+Spring",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "dfc0a733-c158-4eb7-9e4b-2a98492857af"
                },
                {
                    "name": "Believers",
                    "artist": "A.A. Bondy",
                    "url": "https://www.last.fm/music/A.A.+Bondy/Believers",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/688396b473854cf2cc716c676045e9a8.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "76d9a239-eea3-4bfe-b122-1412d55d59a2"
                },
                {
                    "name": "Believe",
                    "artist": "Crematory",
                    "url": "https://www.last.fm/music/Crematory/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b2a48b87-9371-4168-807a-255f69dc5207"
                },
                {
                    "name": "Do you Believe In Magic",
                    "artist": "The Lovin' Spoonful",
                    "url": "https://www.last.fm/music/The+Lovin%27+Spoonful/Do+you+Believe+In+Magic",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b01fb088-a9fe-4f12-853e-141981b83715"
                },
                {
                    "name": "To Believe",
                    "artist": "The Cinematic Orchestra",
                    "url": "https://www.last.fm/music/The+Cinematic+Orchestra/To+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believers Never Die Greatest Hits",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+Greatest+Hits",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Emile Pandolfi",
                    "url": "https://www.last.fm/music/Emile+Pandolfi/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe Me",
                    "artist": "Navos",
                    "url": "https://www.last.fm/music/Navos/Believe+Me",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Better Believe",
                    "artist": "Belly",
                    "url": "https://www.last.fm/music/Belly/Better+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Do You Believe in Gosh?",
                    "artist": "Mitch Hedberg",
                    "url": "https://www.last.fm/music/Mitch+Hedberg/Do+You+Believe+in+Gosh%3F",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "06022c49-c941-472e-9b86-9c11aa250bf9"
                },
                {
                    "name": "Believes In Patterns",
                    "artist": "I Would Set Myself on Fire for You",
                    "url": "https://www.last.fm/music/I+Would+Set+Myself+on+Fire+for+You/Believes+In+Patterns",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "1863b59b-40a7-4df8-b630-48767ebc2b1d"
                },
                {
                    "name": "The Power to Believe",
                    "artist": "King Crimson",
                    "url": "https://www.last.fm/music/King+Crimson/The+Power+to+Believe",
                    "image": [
                        {
                            "#text": "",
                            "size": "small"
                        },
                        {
                            "#text": "",
                            "size": "medium"
                        },
                        {
                            "#text": "",
                            "size": "large"
                        },
                        {
                            "#text": "",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "0a68cb19-49be-4648-8aac-106a0ac1b7fb"
                },
                {
                    "name": "There Is A Hell Believe Me I've Seen It. There Is A Heaven Let's Keep It A Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+A+Hell+Believe+Me+I%27ve+Seen+It.+There+Is+A+Heaven+Let%27s+Keep+It+A+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "I Believe You Liar",
                    "artist": "Washington",
                    "url": "https://www.last.fm/music/Washington/I+Believe+You+Liar",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "204d0ea8-d37a-4c8d-8fda-d9e99b22c247"
                },
                {
                    "name": "The Dreamer, The Believer",
                    "artist": "Common",
                    "url": "https://www.last.fm/music/Common/The+Dreamer,+The+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "d7090f14-56f9-4670-beff-830a3ffd2f8e"
                },
                {
                    "name": "Believe",
                    "artist": "Morgan Page",
                    "url": "https://www.last.fm/music/Morgan+Page/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "7dfec6a9-e9e6-4859-aac1-aae576b93023"
                },
                {
                    "name": "I Believed It (feat. Mac Miller)",
                    "artist": "DVSN",
                    "url": "https://www.last.fm/music/DVSN/I+Believed+It+(feat.+Mac+Miller)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "I BELIEVE IN ME",
                    "artist": "lynch.",
                    "url": "https://www.last.fm/music/lynch./I+BELIEVE+IN+ME",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "28cc127c-8fc3-44a6-a000-2853f52b685c"
                },
                {
                    "name": "Believer",
                    "artist": "SMERZ",
                    "url": "https://www.last.fm/music/SMERZ/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe (II)",
                    "artist": "Orianthi",
                    "url": "https://www.last.fm/music/Orianthi/Believe+(II)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "The Bones of What You Believe (Deluxe Version)",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe+(Deluxe+Version)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believer",
                    "artist": "Major Lazer",
                    "url": "https://www.last.fm/music/Major+Lazer/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                }
            ]
        },
        "@attr": {
            "for": "believe"
        }
    }
}                    
                    """,
              ));

      SearchViewModel searchViewModel = SearchViewModel();
      expect(searchViewModel.appStatus, "Default");
    });

    test("if the response is not successful show the message ", () async {
      var mockApiService = locator<APIService>();
      String searchedItem = "searched";

      final mockScaffoldService = locator<ScaffoldService>();

      when(mockApiService.search(searchedItem))
          .thenAnswer((_) async => ResponseObj(
                statusCode: 1,
                success: false,
                message: "Failed",
                body: """
{
    "results": {
        "opensearch:Query": {
            "#text": "",
            "role": "request",
            "searchTerms": "believe",
            "startPage": "1"
        },
        "opensearch:totalResults": "138252",
        "opensearch:startIndex": "0",
        "opensearch:itemsPerPage": "50",
        "albummatches": {
            "album": [
                {
                    "name": "Believe",
                    "artist": "Disturbed",
                    "url": "https://www.last.fm/music/Disturbed/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/dcf5cf4b9da64e979719a102acd222cc.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "c559efc2-f734-41ae-93bd-2d78414e0356"
                },
                {
                    "name": "Make Believe",
                    "artist": "Weezer",
                    "url": "https://www.last.fm/music/Weezer/Make+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/1c8439b16ed4ca4e0bac727e7b325581.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "9e7103bb-fc9a-4e5a-a90c-2a3ab4c08e19"
                },
                {
                    "name": "Believe (Deluxe Edition)",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe+(Deluxe+Edition)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/263880589b66186a82acd18187920c0c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/263880589b66186a82acd18187920c0c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/263880589b66186a82acd18187920c0c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/263880589b66186a82acd18187920c0c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ca337a40bbb78937bf330454761ee592.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ca337a40bbb78937bf330454761ee592.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "5d88ae0c-c4bf-4e64-bc97-45789880d910"
                },
                {
                    "name": "Believe",
                    "artist": "Cher",
                    "url": "https://www.last.fm/music/Cher/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "63b3a8ca-26f2-4e2b-b867-647a6ec2bebd"
                },
                {
                    "name": "Believers Never Die - Greatest Hits",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+-+Greatest+Hits",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/190429befa66419db3510a86774006cb.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/190429befa66419db3510a86774006cb.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/190429befa66419db3510a86774006cb.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/190429befa66419db3510a86774006cb.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "fa345686-b9cf-47d4-9862-e37e9199c4e5"
                },
                {
                    "name": "Don't Believe the Truth",
                    "artist": "Oasis",
                    "url": "https://www.last.fm/music/Oasis/Don%27t+Believe+the+Truth",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/df7a337e5a38415db87b5a9f8020806c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "af2763e9-ebb9-319b-93e0-02f7449e8a67"
                },
                {
                    "name": "The Bones of What You Believe",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4857b5e7f93d4e1e9bdde4166e7062e6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "cac2fc42-25ce-4021-8030-39401f2563cf"
                },
                {
                    "name": "Believe Acoustic",
                    "artist": "Justin Bieber",
                    "url": "https://www.last.fm/music/Justin+Bieber/Believe+Acoustic",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/60176ed0b8764fb6cfdb612566034bbc.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "71d2222c-021e-46f6-baf7-49a7c1d0735d"
                },
                {
                    "name": "There Is a Hell, Believe Me I've Seen It. There Is a Heaven, Let's Keep It a Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+a+Hell,+Believe+Me+I%27ve+Seen+It.+There+Is+a+Heaven,+Let%27s+Keep+It+a+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/278d843ca23c37a3f64dbbfea052e6b4.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "50b69889-a425-4e70-941b-7a8aea7f3b1f"
                },
                {
                    "name": "The Bones of What You Believe (Special Edition)",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe+(Special+Edition)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ccb4403c57674285a98c07c382c7172c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Hard Believer",
                    "artist": "Fink",
                    "url": "https://www.last.fm/music/Fink/Hard+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b1038a91d5084d41cd830e1f742c437e.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "5d1c2a68-1db2-4fa5-aa36-7d66a8e0d62f"
                },
                {
                    "name": "Believe in Nothing",
                    "artist": "Paradise Lost",
                    "url": "https://www.last.fm/music/Paradise+Lost/Believe+in+Nothing",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/184fb59b18664121c11939b81c25d865.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/184fb59b18664121c11939b81c25d865.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/184fb59b18664121c11939b81c25d865.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/184fb59b18664121c11939b81c25d865.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "735039fc-3866-49bf-a8ac-8d8ae8aa0171"
                },
                {
                    "name": "Believer",
                    "artist": "Imagine Dragons",
                    "url": "https://www.last.fm/music/Imagine+Dragons/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/fbb55dcc63f0a4369e29605c4ab5ddc0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Master of My Make-Believe",
                    "artist": "Santigold",
                    "url": "https://www.last.fm/music/Santigold/Master+of+My+Make-Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8433bbf1c08246ef9ef4051d07fb2254.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "d80496fb-c5ea-4625-adb3-1b3dbabd0fae"
                },
                {
                    "name": "If You Can Believe Your Eyes And Ears",
                    "artist": "The Mamas & the Papas",
                    "url": "https://www.last.fm/music/The+Mamas+&+the+Papas/If+You+Can+Believe+Your+Eyes+And+Ears",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4ddf4b3f9d1f4db883ac7644c2b7db05.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "97540853-647f-4826-91e9-438af03fd73b"
                },
                {
                    "name": "Shallow Believer",
                    "artist": "The Used",
                    "url": "https://www.last.fm/music/The+Used/Shallow+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/385a531c942341feba3bd20b52594eb1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/385a531c942341feba3bd20b52594eb1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "ea4193b8-67d7-4017-9e6b-ef286555a5b3"
                },
                {
                    "name": "True Believers",
                    "artist": "Darius Rucker",
                    "url": "https://www.last.fm/music/Darius+Rucker/True+Believers",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/2fddb1f5bccd4dc58a98b2af31d0ba53.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b624c2b6-a84a-46f5-b690-c923e3aed417"
                },
                {
                    "name": "There Is a Hell Believe Me I've Seen It, There Is a Heaven Let's Keep It a Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+a+Hell+Believe+Me+I%27ve+Seen+It,+There+Is+a+Heaven+Let%27s+Keep+It+a+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e6538acf2ba846d991a09057cba984a6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "If You Can Believe Your Eyes & Ears",
                    "artist": "The Mamas & the Papas",
                    "url": "https://www.last.fm/music/The+Mamas+&+the+Papas/If+You+Can+Believe+Your+Eyes+&+Ears",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9e6ec8635554548fe2ee61d8f4a99ed2.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believers Never Die (Volume Two)",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+(Volume+Two)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/8b74825ad6f09ca11c8449e2319defae.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Orianthi",
                    "url": "https://www.last.fm/music/Orianthi/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/18ef7e82efe04efcbfeeda24bdc6dce4.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "ad4fb2af-ab7f-4f82-9094-1726c9a53429"
                },
                {
                    "name": "Believers Never Die (Greatest Hits)",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+(Greatest+Hits)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/153636f28cb959e3510bef847c908a2a.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/153636f28cb959e3510bef847c908a2a.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "4 Strings",
                    "url": "https://www.last.fm/music/4+Strings/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/d884ea3bd55441f593a67cf2fcaaa140.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "1d3332d3-3b23-4f10-b0f1-736ee598370f"
                },
                {
                    "name": "Believers Never Die",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e0193847891e9113acd197e283f76733.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e0193847891e9113acd197e283f76733.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e0193847891e9113acd197e283f76733.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e0193847891e9113acd197e283f76733.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Reason To Believe",
                    "artist": "Pennywise",
                    "url": "https://www.last.fm/music/Pennywise/Reason+To+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ad327d96f6c945efc5275b9c9056d5c5.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "441659e9-eaef-431e-9f0c-6bec526119bf"
                },
                {
                    "name": "Believe",
                    "artist": "Mumford & Sons",
                    "url": "https://www.last.fm/music/Mumford+&+Sons/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b3df85f91aa146f6c6be5bbf40a5a9ce.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Dream to Make Believe",
                    "artist": "Armor for Sleep",
                    "url": "https://www.last.fm/music/Armor+for+Sleep/Dream+to+Make+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/64427be217f241588ce20ae34c3fe7e7.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "460b65c5-ac1b-44e1-89da-82a8ebf24d28"
                },
                {
                    "name": "You Must Believe in Spring",
                    "artist": "Bill Evans",
                    "url": "https://www.last.fm/music/Bill+Evans/You+Must+Believe+in+Spring",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/c788a7aea5fcfa02371ba831fcd4f201.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "dfc0a733-c158-4eb7-9e4b-2a98492857af"
                },
                {
                    "name": "Believers",
                    "artist": "A.A. Bondy",
                    "url": "https://www.last.fm/music/A.A.+Bondy/Believers",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/688396b473854cf2cc716c676045e9a8.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/688396b473854cf2cc716c676045e9a8.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "76d9a239-eea3-4bfe-b122-1412d55d59a2"
                },
                {
                    "name": "Believe",
                    "artist": "Crematory",
                    "url": "https://www.last.fm/music/Crematory/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/495318245ff88a4a16d191e5c552a3c0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b2a48b87-9371-4168-807a-255f69dc5207"
                },
                {
                    "name": "Do you Believe In Magic",
                    "artist": "The Lovin' Spoonful",
                    "url": "https://www.last.fm/music/The+Lovin%27+Spoonful/Do+you+Believe+In+Magic",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/80b2e1f00dca512fbb2cbb21c941db90.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "b01fb088-a9fe-4f12-853e-141981b83715"
                },
                {
                    "name": "To Believe",
                    "artist": "The Cinematic Orchestra",
                    "url": "https://www.last.fm/music/The+Cinematic+Orchestra/To+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/43d924f093ac1bc79823908aedf8dca1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believers Never Die Greatest Hits",
                    "artist": "Fall Out Boy",
                    "url": "https://www.last.fm/music/Fall+Out+Boy/Believers+Never+Die+Greatest+Hits",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/ee13d0fa0c004247bfc41bda2d8ae1ed.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe",
                    "artist": "Emile Pandolfi",
                    "url": "https://www.last.fm/music/Emile+Pandolfi/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f770e37b2cf7405aa40d9aa176d24d72.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe Me",
                    "artist": "Navos",
                    "url": "https://www.last.fm/music/Navos/Believe+Me",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/4b9183a46b6b94bcd772c9a3fc346f00.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Better Believe",
                    "artist": "Belly",
                    "url": "https://www.last.fm/music/Belly/Better+Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/54ef1d28867d83d8dd76cc29474dceb1.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Do You Believe in Gosh?",
                    "artist": "Mitch Hedberg",
                    "url": "https://www.last.fm/music/Mitch+Hedberg/Do+You+Believe+in+Gosh%3F",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/5c29015f7a524a4589c7f3f611d7a88d.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "06022c49-c941-472e-9b86-9c11aa250bf9"
                },
                {
                    "name": "Believes In Patterns",
                    "artist": "I Would Set Myself on Fire for You",
                    "url": "https://www.last.fm/music/I+Would+Set+Myself+on+Fire+for+You/Believes+In+Patterns",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/46e3022106f0da83f73e2a2b1bec7f3c.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "1863b59b-40a7-4df8-b630-48767ebc2b1d"
                },
                {
                    "name": "The Power to Believe",
                    "artist": "King Crimson",
                    "url": "https://www.last.fm/music/King+Crimson/The+Power+to+Believe",
                    "image": [
                        {
                            "#text": "",
                            "size": "small"
                        },
                        {
                            "#text": "",
                            "size": "medium"
                        },
                        {
                            "#text": "",
                            "size": "large"
                        },
                        {
                            "#text": "",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "0a68cb19-49be-4648-8aac-106a0ac1b7fb"
                },
                {
                    "name": "There Is A Hell Believe Me I've Seen It. There Is A Heaven Let's Keep It A Secret",
                    "artist": "Bring Me the Horizon",
                    "url": "https://www.last.fm/music/Bring+Me+the+Horizon/There+Is+A+Hell+Believe+Me+I%27ve+Seen+It.+There+Is+A+Heaven+Let%27s+Keep+It+A+Secret",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/df69f34791b246c5894b99b7aa5a7dd0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "I Believe You Liar",
                    "artist": "Washington",
                    "url": "https://www.last.fm/music/Washington/I+Believe+You+Liar",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/9da6c86e030e49809dc7cd5cb0b668a5.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "204d0ea8-d37a-4c8d-8fda-d9e99b22c247"
                },
                {
                    "name": "The Dreamer, The Believer",
                    "artist": "Common",
                    "url": "https://www.last.fm/music/Common/The+Dreamer,+The+Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/86cf8092d1be4cfacc2564cb305bf9b0.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "d7090f14-56f9-4670-beff-830a3ffd2f8e"
                },
                {
                    "name": "Believe",
                    "artist": "Morgan Page",
                    "url": "https://www.last.fm/music/Morgan+Page/Believe",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/efbb4dff8dee450bb7741832c71bf45a.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "7dfec6a9-e9e6-4859-aac1-aae576b93023"
                },
                {
                    "name": "I Believed It (feat. Mac Miller)",
                    "artist": "DVSN",
                    "url": "https://www.last.fm/music/DVSN/I+Believed+It+(feat.+Mac+Miller)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/959b681f6fcfa5f92e248289fcc7dcd8.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "I BELIEVE IN ME",
                    "artist": "lynch.",
                    "url": "https://www.last.fm/music/lynch./I+BELIEVE+IN+ME",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/f304b263dd634c68abaeacf9500b8885.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": "28cc127c-8fc3-44a6-a000-2853f52b685c"
                },
                {
                    "name": "Believer",
                    "artist": "SMERZ",
                    "url": "https://www.last.fm/music/SMERZ/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/87feb0711b2a3da047110e0ce111eed6.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believe (II)",
                    "artist": "Orianthi",
                    "url": "https://www.last.fm/music/Orianthi/Believe+(II)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/b82038498b2f4915917b786c03bf43ce.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "The Bones of What You Believe (Deluxe Version)",
                    "artist": "CHVRCHES",
                    "url": "https://www.last.fm/music/CHVRCHES/The+Bones+of+What+You+Believe+(Deluxe+Version)",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e746c1ee34f54d87cd50e0ade46319b2.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                },
                {
                    "name": "Believer",
                    "artist": "Major Lazer",
                    "url": "https://www.last.fm/music/Major+Lazer/Believer",
                    "image": [
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/34s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "small"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/64s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "medium"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/174s/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "large"
                        },
                        {
                            "#text": "https://lastfm.freetls.fastly.net/i/u/300x300/e4f8d5cc1f6955bc0d85c150a4eb08ae.png",
                            "size": "extralarge"
                        }
                    ],
                    "streamable": "0",
                    "mbid": ""
                }
            ]
        },
        "@attr": {
            "for": "believe"
        }
    }
}                    
                    """,
              ));

      ResponseObj responseObj = await mockApiService.search(searchedItem);
      if (responseObj.success == false) {
        SearchViewModel searchViewModel = SearchViewModel();
        await searchViewModel.startSearch(searchedItem);
        verify(mockScaffoldService.showSnackBar(responseObj.message));
      }
    });
  });
}

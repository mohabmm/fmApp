// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    this.results,
  });

  Results? results;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results!.toJson(),
      };
}

class Results {
  Results({
    this.openSearchQuery,
    this.openSearchTotalResults,
    this.openSearchStartIndex,
    this.openSearchItemsPerPage,
    this.albumMatches,
    this.attr,
  });

  OpensearchQuery? openSearchQuery;
  String? openSearchTotalResults;
  String? openSearchStartIndex;
  String? openSearchItemsPerPage;
  AlbumMatches? albumMatches;
  Attr? attr;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        openSearchQuery: OpensearchQuery.fromJson(json["opensearch:Query"]),
        openSearchTotalResults: json["opensearch:totalResults"],
        openSearchStartIndex: json["opensearch:startIndex"],
        openSearchItemsPerPage: json["opensearch:itemsPerPage"],
        albumMatches: AlbumMatches.fromJson(json["albummatches"]),
        attr: Attr.fromJson(json["@attr"]),
      );

  Map<String, dynamic> toJson() => {
        "opensearch:Query": openSearchQuery!.toJson(),
        "opensearch:totalResults": openSearchTotalResults,
        "opensearch:startIndex": openSearchStartIndex,
        "opensearch:itemsPerPage": openSearchItemsPerPage,
        "albummatches": albumMatches!.toJson(),
        "@attr": attr!.toJson(),
      };
}

class AlbumMatches {
  AlbumMatches({
    this.album,
  });

  List<AlbumElement>? album;

  factory AlbumMatches.fromJson(Map<String, dynamic> json) => AlbumMatches(
        album: List<AlbumElement>.from(
            json["album"].map((x) => AlbumElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "album": List<dynamic>.from(album!.map((x) => x.toJson())),
      };
}

class AlbumElement {
  AlbumElement({
    this.name,
    this.artist,
    this.url,
    this.image,
    this.streamable,
    this.mbid,
  });

  String? name;
  String? artist;
  String? url;
  List<Image>? image;
  String? streamable;
  String? mbid;

  factory AlbumElement.fromJson(Map<String, dynamic> json) => AlbumElement(
        name: json["name"],
        artist: json["artist"],
        url: json["url"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        streamable: json["streamable"],
        mbid: json["mbid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "artist": artist,
        "url": url,
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
        "streamable": streamable,
        "mbid": mbid,
      };
}

class Image {
  Image({
    this.text,
    this.size,
  });

  String? text;
  Size? size;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        text: json["#text"],
        size: sizeValues.map![json["size"]],
      );

  Map<String, dynamic> toJson() => {
        "#text": text,
        "size": sizeValues.reverse![size],
      };
}

enum Size { SMALL, MEDIUM, LARGE, EXTRALARGE }

final sizeValues = EnumValues({
  "extralarge": Size.EXTRALARGE,
  "large": Size.LARGE,
  "medium": Size.MEDIUM,
  "small": Size.SMALL
});

class Attr {
  Attr({
    this.attrFor,
  });

  String? attrFor;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        attrFor: json["for"],
      );

  Map<String, dynamic> toJson() => {
        "for": attrFor,
      };
}

class OpensearchQuery {
  OpensearchQuery({
    this.text,
    this.role,
    this.searchTerms,
    this.startPage,
  });

  String? text;
  String? role;
  String? searchTerms;
  String? startPage;

  factory OpensearchQuery.fromJson(Map<String, dynamic> json) =>
      OpensearchQuery(
        text: json["#text"],
        role: json["role"],
        searchTerms: json["searchTerms"],
        startPage: json["startPage"],
      );

  Map<String, dynamic> toJson() => {
        "#text": text,
        "role": role,
        "searchTerms": searchTerms,
        "startPage": startPage,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

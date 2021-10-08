// To parse this JSON data, do
//
//     final albumDetails = albumDetailsFromJson(jsonString);

import 'dart:convert';

AlbumDetails albumDetailsFromJson(String str) =>
    AlbumDetails.fromJson(json.decode(str));

String albumDetailsToJson(AlbumDetails data) => json.encode(data.toJson());

class AlbumDetails {
  AlbumDetails({
    this.album,
  });

  Album? album;

  factory AlbumDetails.fromJson(Map<String, dynamic> json) => AlbumDetails(
        album: Album.fromJson(json["album"]),
      );

  Map<String, dynamic> toJson() => {
        "album": album!.toJson(),
      };
}

class Album {
  Album({
    this.artist,
    this.mBid,
    this.tags,
    this.playCount,
    this.image,
    this.url,
    this.name,
    this.listeners,
  });

  ArtistEnum? artist;
  String? mBid;
  Tags? tags;
  String? playCount;
  List<Image>? image;
  String? url;
  String? name;
  String? listeners;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        artist: artistEnumValues.map[json["artist"]],
        mBid: json["mbid"],
        tags: Tags.fromJson(json["tags"]),
        playCount: json["playcount"],
        image: List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        url: json["url"],
        name: json["name"],
        listeners: json["listeners"],
      );

  Map<String, dynamic> toJson() => {
        "artist": artistEnumValues.reverse![artist],
        "mbid": mBid,
        "tags": tags!.toJson(),
        "playcount": playCount,
        "image": List<dynamic>.from(image!.map((x) => x.toJson())),
        "url": url,
        "name": name,
        "listeners": listeners,
      };
}

enum ArtistEnum { CHER }

final artistEnumValues = EnumValues({"Cher": ArtistEnum.CHER});

class Image {
  Image({
    this.size,
    this.text,
  });

  String? size;
  String? text;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        size: json["size"],
        text: json["#text"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "#text": text,
      };
}

class Tags {
  Tags({
    this.tag,
  });

  List<Tag>? tag;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tag": List<dynamic>.from(tag!.map((x) => x.toJson())),
      };
}

class Tag {
  Tag({
    this.url,
    this.name,
  });

  String? url;
  String? name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        url: json["url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
      };
}

class Tracks {
  Tracks({
    this.track,
  });

  List<Track>? track;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        track: List<Track>.from(json["track"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "track": List<dynamic>.from(track!.map((x) => x.toJson())),
      };
}

class Track {
  Track({
    this.streamable,
    this.duration,
    this.url,
    this.name,
    this.attr,
    this.artist,
  });

  Streamable? streamable;
  int? duration;
  String? url;
  String? name;
  Attr? attr;
  ArtistClass? artist;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        streamable: Streamable.fromJson(json["streamable"]),
        duration: json["duration"],
        url: json["url"],
        name: json["name"],
        attr: Attr.fromJson(json["@attr"]),
        artist: ArtistClass.fromJson(json["artist"]),
      );

  Map<String, dynamic> toJson() => {
        "streamable": streamable!.toJson(),
        "duration": duration,
        "url": url,
        "name": name,
        "@attr": attr!.toJson(),
        "artist": artist!.toJson(),
      };
}

class ArtistClass {
  ArtistClass({
    this.url,
    this.name,
    this.mBid,
  });

  String? url;
  ArtistEnum? name;
  String? mBid;

  factory ArtistClass.fromJson(Map<String, dynamic> json) => ArtistClass(
        url: json["url"],
        name: artistEnumValues.map[json["name"]],
        mBid: json["mbid"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": artistEnumValues.reverse![name],
        "mbid": mBid,
      };
}

class Attr {
  Attr({
    this.rank,
  });

  int? rank;

  factory Attr.fromJson(Map<String, dynamic> json) => Attr(
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
      };
}

class Streamable {
  Streamable({
    this.fullTrack,
    this.text,
  });

  String? fullTrack;
  String? text;

  factory Streamable.fromJson(Map<String, dynamic> json) => Streamable(
        fullTrack: json["fulltrack"],
        text: json["#text"],
      );

  Map<String, dynamic> toJson() => {
        "fulltrack": fullTrack,
        "#text": text,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

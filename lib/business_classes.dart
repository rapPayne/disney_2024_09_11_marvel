// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  Welcome({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  Welcome copyWith({
    int? code,
    String? status,
    String? copyright,
    String? attributionText,
    String? attributionHtml,
    String? etag,
    Data? data,
  }) =>
      Welcome(
        code: code ?? this.code,
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        attributionText: attributionText ?? this.attributionText,
        attributionHtml: attributionHtml ?? this.attributionHtml,
        etag: etag ?? this.etag,
        data: data ?? this.data,
      );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data?.toJson(),
      };
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  Data copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<Result>? results,
  }) =>
      Data(
        offset: offset ?? this.offset,
        limit: limit ?? this.limit,
        total: total ?? this.total,
        count: count ?? this.count,
        results: results ?? this.results,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  Result copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    Thumbnail? thumbnail,
    String? resourceUri,
    Comics? comics,
    Comics? series,
    Stories? stories,
    Comics? events,
    List<Url>? urls,
  }) =>
      Result(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        modified: modified ?? this.modified,
        thumbnail: thumbnail ?? this.thumbnail,
        resourceUri: resourceUri ?? this.resourceUri,
        comics: comics ?? this.comics,
        series: series ?? this.series,
        stories: stories ?? this.stories,
        events: events ?? this.events,
        urls: urls ?? this.urls,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: json["comics"] == null ? null : Comics.fromJson(json["comics"]),
        series: json["series"] == null ? null : Comics.fromJson(json["series"]),
        stories:
            json["stories"] == null ? null : Stories.fromJson(json["stories"]),
        events: json["events"] == null ? null : Comics.fromJson(json["events"]),
        urls: json["urls"] == null
            ? []
            : List<Url>.from(json["urls"]!.map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "modified": modified,
        "thumbnail": thumbnail?.toJson(),
        "resourceURI": resourceUri,
        "comics": comics?.toJson(),
        "series": series?.toJson(),
        "stories": stories?.toJson(),
        "events": events?.toJson(),
        "urls": urls == null
            ? []
            : List<dynamic>.from(urls!.map((x) => x.toJson())),
      };
}

class Comics {
  int? available;
  String? collectionUri;
  List<ComicsItem>? items;
  int? returned;

  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  Comics copyWith({
    int? available,
    String? collectionUri,
    List<ComicsItem>? items,
    int? returned,
  }) =>
      Comics(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<ComicsItem>.from(
                json["items"]!.map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class ComicsItem {
  String? resourceUri;
  String? name;

  ComicsItem({
    this.resourceUri,
    this.name,
  });

  ComicsItem copyWith({
    String? resourceUri,
    String? name,
  }) =>
      ComicsItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
      );

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  Stories copyWith({
    int? available,
    String? collectionUri,
    List<StoriesItem>? items,
    int? returned,
  }) =>
      Stories(
        available: available ?? this.available,
        collectionUri: collectionUri ?? this.collectionUri,
        items: items ?? this.items,
        returned: returned ?? this.returned,
      );

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: json["items"] == null
            ? []
            : List<StoriesItem>.from(
                json["items"]!.map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class StoriesItem {
  String? resourceUri;
  String? name;
  Type? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  StoriesItem copyWith({
    String? resourceUri,
    String? name,
    Type? type,
  }) =>
      StoriesItem(
        resourceUri: resourceUri ?? this.resourceUri,
        name: name ?? this.name,
        type: type ?? this.type,
      );

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": typeValues.reverse[type],
      };
}

enum Type { COVER, INTERIOR_STORY }

final typeValues =
    EnumValues({"cover": Type.COVER, "interiorStory": Type.INTERIOR_STORY});

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  Thumbnail copyWith({
    String? path,
    String? extension,
  }) =>
      Thumbnail(
        path: path ?? this.path,
        extension: extension ?? this.extension,
      );

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  Url copyWith({
    String? type,
    String? url,
  }) =>
      Url(
        type: type ?? this.type,
        url: url ?? this.url,
      );

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

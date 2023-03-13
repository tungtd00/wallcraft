class imageApi {
  String? id;
  Urls? urls;
  Links? links;

  imageApi({this.id, this.urls, this.links});

  imageApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urls = (json['urls'] != null ? new Urls.fromJson(json['urls']) : null)!;
    links = (json['links'] != null ? new Links.fromJson(json['links']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Urls {
  String? raw;
  String? full;

  Urls({this.raw, this.full});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    return data;
  }
}

class Links {
  String? download;

  Links({this.download});

  Links.fromJson(Map<String, dynamic> json) {
    download = json['download'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['download'] = this.download;
    return data;
  }
}

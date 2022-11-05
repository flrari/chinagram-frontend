import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.user,
    this.posizione,
    required this.testo,
    required this.url1,
    this.url2,
    this.url3,
    this.url4,
    this.url5,
  });

  int id;
  User user;
  String? posizione;
  String testo;
  String url1;
  String? url2;
  String? url3;
  dynamic? url4;
  dynamic? url5;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    user: User.fromJson(json["user"]),
    posizione: json["posizione"],
    testo: json["testo"],
    url1: json["url1"],
    url2: json["url2"] == null ? null : json["url2"],
    url3: json["url3"] == null ? null : json["url3"],
    url4: json["url4"],
    url5: json["url5"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "posizione": posizione,
    "testo": testo,
    "url1": url1,
    "url2": url2 == null ? null : url2,
    "url3": url3 == null ? null : url3,
    "url4": url4,
    "url5": url5,
  };
}

class User {
  User({
    required this.id,
    this.nome,
    required this.username,
    this.biografia,
    required this.immagineProfilo,
  });

  int id;
  String? nome;
  String username;
  String? biografia;
  String immagineProfilo;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nome: json["nome"],
    username: json["username"],
    biografia: json["biografia"],
    immagineProfilo: json["immagine_profilo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "username": username,
    "biografia": biografia,
    "immagine_profilo": immagineProfilo,
  };
}

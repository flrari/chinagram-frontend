// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score;
  UserModel({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  UserModel copyWith({
    String? name,
    String? photoUrl,
    int? score,
  }) {
    return UserModel(
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(name: $name, photoUrl: $photoUrl, score: $score)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.photoUrl == photoUrl &&
        other.score == score;
  }

  @override
  int get hashCode => name.hashCode ^ photoUrl.hashCode ^ score.hashCode;
}

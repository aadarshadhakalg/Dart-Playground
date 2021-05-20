import 'dart:convert';

class UserProfile {
  UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    required this.photo,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      photo: map['photo'],
    );
  }

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(
        json.decode(source),
      );

  String uid;
  String name;
  String email;
  String photo;

  UserProfile copyWith({
    String? uid,
    String? name,
    String? email,
    String? photo,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserProfile(uid: $uid, name: $name, email: $email, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ email.hashCode ^ photo.hashCode;
  }
}

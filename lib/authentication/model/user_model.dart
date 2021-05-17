import 'dart:convert';

class User {
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['\$id'],
      name: map['name'],
      registration: map['registration'],
      email: map['email'],
      emailVerification: map['emailVerification'],
    );
  }

  User({
    required this.id,
    required this.name,
    required this.registration,
    required this.email,
    required this.emailVerification,
  });

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  String id;
  String name;
  int registration;
  String email;
  bool emailVerification;

  Map<String, dynamic> toMap() {
    return {
      '\$id': id,
      'name': name,
      'registration': registration,
      'email': email,
      'emailVerification':emailVerification,
    };
  }

  

  String toJson() => json.encode(toMap());

  User copyWith({
    String? id,
    String? name,
    int? registration,
    String? email,
    bool? emailVerification,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      registration: registration ?? this.registration,
      email: email ?? this.email,
      emailVerification: emailVerification ?? this.emailVerification,
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'User(id: $id, name: $name, registration: $registration, email: $email,)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.registration == registration &&
        other.email == email ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        registration.hashCode ^
        email.hashCode ^
        emailVerification.hashCode;
  }
}

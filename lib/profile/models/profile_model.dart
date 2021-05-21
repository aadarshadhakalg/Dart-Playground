import 'dart:convert';
import 'package:flutter/foundation.dart';

class UserProfile {
  UserProfile({
     this.id,
     this.collection,
     this.permissions,
    required this.uid,
    required this.name,
    required this.email,
    required this.photo,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['\$id'],
      collection: map['\$collection'],
      permissions: Permissions.fromMap(map['\$permissions']),
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      photo: map['photo'],
    );
  }

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  final String? id;
  final String? collection;
  final Permissions? permissions;
  final String uid;
  final String name;
  final String email;
  final String photo;

  UserProfile copyWith({
    String? id,
    String? collection,
    Permissions? permissions,
    String? uid,
    String? name,
    String? email,
    String? photo,
  }) {
    return UserProfile(
      id: id ?? this.id,
      collection: collection ?? this.collection,
      permissions: permissions ?? this.permissions,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '\$id': id,
      '\$collection': collection,
      '\$permissions': permissions?.toMap(),
      'uid': uid,
      'name': name,
      'email': email,
      'photo': photo,
    };
  }


  String toJson() => json.encode(toMap());


  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
        other.id == id &&
        other.collection == collection &&
        other.permissions == permissions &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        collection.hashCode ^
        permissions.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        photo.hashCode;
  }
}

class Permissions {
  Permissions({
    required this.read,
    required this.write,
  });

  factory Permissions.fromMap(Map<String, dynamic> map) {
    return Permissions(
      read: List<String>.from(map['read']),
      write: List<String>.from(map['write']),
    );
  }

  factory Permissions.fromJson(String source) =>
      Permissions.fromMap(json.decode(source));

  final List<String> read;
  final List<String> write;

  Permissions copyWith({
    List<String>? read,
    List<String>? write,
  }) {
    return Permissions(
      read: read ?? this.read,
      write: write ?? this.write,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'read': read,
      'write': write,
    };
  }


  String toJson() => json.encode(toMap());

  @override
  String toString() => 'permissions(read: $read, write: $write)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Permissions &&
        listEquals(other.read, read) &&
        listEquals(other.write, write);
  }

  @override
  int get hashCode => read.hashCode ^ write.hashCode;
}

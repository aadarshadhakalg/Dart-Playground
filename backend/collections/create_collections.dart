import 'package:dart_appwrite/dart_appwrite.dart';

class CreateCollection {
  CreateCollection({required this.db}) {
    init();
  }

  List? allCollections;
  Database db;

  void init() async {
    var response = await db.listCollections();
    allCollections = response.data['collections'];
  }

  Future createProfileCollections() async {
    var exists = false;

    allCollections?.map((e) {
      e['name'] == 'Profile' ? exists = true : exists = false;
    });

    if (!exists) {
      await db.createCollection(
        name: 'Profile',
        read: ['role:member'],
        write: ['role:member'],
        rules: [
          {
            'type': 'text',
            'key': 'uid',
            'label': 'User Id',
            'default': '',
            'array': false,
            'required': true,
          },
          {
            'type': 'text',
            'key': 'name',
            'label': 'Name',
            'default': '',
            'array': false,
            'required': true,
          },
          {
            'type': 'text',
            'key': 'email',
            'label': 'Email',
            'default': '',
            'array': false,
            'required': true,
          },
          {
            'type': 'url',
            'key': 'photo',
            'label': 'Photo',
            'default': '',
            'array': false,
            'required': false,
          }
        ],
      );
    }
  }
}

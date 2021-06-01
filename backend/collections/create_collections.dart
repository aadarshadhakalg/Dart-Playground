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
      e['name'] == 'Functions' ? exists = true : exists = false;
    });

    if (!exists) {
      await db.createCollection(
        name: 'Functions',
        read: ['*'],
        write: ['*'],
        rules: [
          {
            'type': 'text',
            'key': 'uid',
            'label': 'UID',
            'default': '',
            'array': false,
            'required': true,
          },
          {
            'type': 'text',
            'key': 'fid',
            'label': 'FID',
            'default': '',
            'array': false,
            'required': true,
          }
        ],
      );
    }
  }
}

import 'package:dart_appwrite/dart_appwrite.dart' as server;
import 'package:dartcompiler/global/res/app_constants.dart';

import 'collections/create_collections.dart';

final String key =
    '''c5e6bf9e828e4780fd4841c09e54c7a866bf5bdf07670649dbb251d20bab82cb11744c6c16426433736037d18017814c6c850e74bebb8b74017237a33bf0f4d1efbeef92262beb8f5f975e8255176c4f3169527e0527741b2400b84f5dc2b3ddcf02d7bf0a7e1e06d187a6ce9f566571e57203f3a26fedc4042393f5a6295e1c''';

void main() async {
  var client = server.Client()
    ..setEndpoint(AppConstant.endpoint)
    ..setProject(AppConstant.projectId)
    ..setKey(key)
    ..setSelfSigned();

  var database = server.Database(client);

  var createCollection = CreateCollection(db: database);

  await createCollection.createProfileCollections();
}

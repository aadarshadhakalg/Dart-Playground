import 'package:appwrite/appwrite.dart';
import 'package:dartcompiler/global/res/app_constants.dart';

class AppwriteModules {
  AppwriteModules._internal() {
    client = Client()
      ..setEndpoint(AppConstant.endpoint)
      ..setProject(AppConstant.projectId)
      ..setSelfSigned();

    storage = Storage(client);
    account = Account(client);
    database = Database(client);
    avatars = Avatars(client);
  }

  static AppwriteModules? _modules;

  late final Client client;
  late final Storage storage;
  late final Account account;
  late final Database database;
  late final Avatars avatars;
  late final Functions functions;

  static AppwriteModules get getModules =>
      _modules ?? AppwriteModules._internal();

  static void dispose(){
    _modules = null;
  }
}

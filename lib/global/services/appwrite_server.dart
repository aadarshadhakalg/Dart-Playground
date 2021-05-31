import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dartcompiler/global/res/app_constants.dart';

class AppwriteServerModules {
  AppwriteServerModules._internal() {
    server = Client()
      ..setEndpoint(AppConstant.endpoint)
      ..setProject(AppConstant.projectId)
      ..setKey(
          // ignore: lines_longer_than_80_chars
          'c5e6bf9e828e4780fd4841c09e54c7a866bf5bdf07670649dbb251d20bab82cb11744c6c16426433736037d18017814c6c850e74bebb8b74017237a33bf0f4d1efbeef92262beb8f5f975e8255176c4f3169527e0527741b2400b84f5dc2b3ddcf02d7bf0a7e1e06d187a6ce9f566571e57203f3a26fedc4042393f5a6295e1c')
      ..setSelfSigned();

    functions = Functions(server);
  }

  late final Client server;
  static AppwriteServerModules? _modules;

  late final Functions functions;

  static AppwriteServerModules get getModules =>
      _modules ?? AppwriteServerModules._internal();

  static void dispose() {
    _modules = null;
  }
}

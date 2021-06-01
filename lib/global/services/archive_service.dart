import 'dart:io';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';

class ArchiveService {
  ArchiveService._internal();

  static ArchiveService? _instance;

  static ArchiveService get getInstance =>
      _instance ??= ArchiveService._internal();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    await Directory('$path/code').create();
    return File('$path/code/main.dart');
  }

  Future<String> getCurrentCode() async{
    final file = await _localFile;
    return await file.readAsString(); 
  }

  Future<File> writeCounter(String code) async {
    final file = await _localFile;
    return file.writeAsString('$code');
  }

  Future<File?> getTarFile() async {
    final path = await _localPath;
    File? zipped;

    ZipFileEncoder()
      ..create('$path/code.zip')
      ..addDirectory(Directory('$path/code'))
      // ..addFile(
      //   File('$path/code/main.dart'),
      // )
      ..close();

    final bytes = File('$path/code.zip').readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(bytes);

    final tarData = TarEncoder().encode(archive);
    final encoded = GZipEncoder().encode(tarData);

    if (encoded != null) {
      zipped = File('$path/code.tar.gz')..writeAsBytesSync(encoded);
    }
    return zipped;
  }
}

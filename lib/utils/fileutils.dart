import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class FileUtils{
  localPath() async {
    try {
      // sd卡目录 /storage/emulated/0
      var tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // 临时目录: /data/user/0/com.example.myapp/cache
      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // 文档目录: /data/user/0/com.example.myapp/app_flutter
      var sdDir = await getExternalStorageDirectory();
      String sdPath = sdDir.path;

    } catch (err) {
      print(err);
    }
  }

  createFile(path) async {
    return new File('$path/mypicture.json');
  }

  readJson() async{
    final file = await createFile(await localPath());
    String data = await file.readAsString();
    String jsonStr = json.decode(data);
  }

  write(obj) async{
    final file = await createFile(await localPath());
    return file.writeAsString(json.encode(obj));
  }
}
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FileHelper {
  FileHelper._();
  static FileHelper fileHelper = FileHelper._();
  writeToFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = directory.path + '/test.txt';
    // String path2 = join(directory.path, '/test.txt');
    File(filePath).writeAsString('hello how are you');
  }

  readFromFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = directory.path + '/test.txt';
    String x = await File(filePath).readAsString();
    print(x);
  }
}

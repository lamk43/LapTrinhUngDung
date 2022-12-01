import 'dart:convert';
import 'dart:io';
import 'package:local_file2/CounterModel.dart';
import 'package:path_provider/path_provider.dart';

class couter_file {
  Future<String> get _localPath async{
    final path= await getApplicationDocumentsDirectory();
    return path.path;
  }
  Future<File> get _locatFile async{
    var path= await _localPath;
    return File('$path/counter.txt');
  }
  Future<File> write (int counter) async{
    var file = await _locatFile;
    CounterModel model = CounterModel(counter: counter);
    return file.writeAsString(jsonEncode(model));
  }
  Future<int> read() async{
    var file= await _locatFile;
    var jsonString = await file.readAsString();
    var jsonObject = jsonDecode(jsonString);
    var data = CounterModel.fromjson(jsonObject);
    return data.counter??0;
  }
}
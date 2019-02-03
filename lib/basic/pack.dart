import 'package:objd/basic/widget.dart';
import 'package:objd/basic/file.dart';
import 'package:meta/meta.dart';
import 'package:objd/basic/for_list.dart';
import 'package:objd/build/build.dart';

class Pack extends Widget {
  String name;
  File main;
  File load;
  List<File> files;
  Pack({@required this.name, this.main, this.load, this.files}){
    if(name != name.toLowerCase()) throw('Please not that the name of a pack must be lowercase! for pack:' + name);
  }

  @override
  Widget generate(Context context) {
    return For.of([main, load]);
  }

  @override
  Map toMap() {
    return {
      'Pack': {
        'name': name,
        'main': main == null ? null : main.toMap(),
        'load': load == null ? null : load.toMap(),
        'files': files == null ? null : files.map((x) => x.toMap())
      }
    };
  }
}

import 'package:objd/basic/widget.dart';
import 'package:objd/basic/command.dart';
import 'package:objd/build/build.dart';
import 'package:objd/basic/entity.dart';
import 'package:objd/basic/text_components.dart';
import 'dart:convert';
class Tellraw extends Widget {
  String jsonText;
  String entity;
  /// The Tellraw class is very similar to the Title class, but shows its texts in the chat.
  Tellraw(Entity selector, {List<TextComponent> show}){
    entity = selector.toString();
    jsonText = json.encode(show.map((text) => text.toMap()).toList());
  }
  @override
  Widget generate(Context context) {
    return Command("tellraw " + entity + " " + jsonText);
  }
}
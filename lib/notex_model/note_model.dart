import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String content;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
  });
  updateNoteDb(NoteModel value) {
    title = value.title;
    content = value.content;
    save();
  }
}

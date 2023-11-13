import 'package:hive/hive.dart';

// for generated Hive file
part 'note_model.g.dart';

// flutter packages pub run build_runner build --> terminal code fro generation.

@HiveType(typeId: 0) // hive
class NoteModel extends HiveObject {

  @HiveType(typeId: 0)
  final String title;
  @HiveType(typeId: 1)
  final String subTitle;
  @HiveType(typeId: 2)
  final String date;
  @HiveType(typeId: 3)
  final int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}

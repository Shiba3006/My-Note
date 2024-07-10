import 'package:hive/hive.dart';

// for generated Hive file
part 'note_model.g.dart';

//  --> terminal code for generation.

@HiveType(typeId: 0) // hive
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;
  @HiveField(4)
  String? notificationDate;
  @HiveField(5)
  String? notificationTime;
  @HiveField(6)
  final int id;

  NoteModel( {
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
    this.notificationDate,
    this.notificationTime,
    required this.id,
  });
}

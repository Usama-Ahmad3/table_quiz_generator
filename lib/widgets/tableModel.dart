
import 'package:hive/hive.dart';
part 'tableModel.g.dart';
@HiveType(typeId: 0)
class TableModel extends HiveObject{
  @HiveField(0)
  // ignore: non_constant_identifier_names
  String Question;
  @HiveField(1)
  // ignore: non_constant_identifier_names
  String Answer;

  TableModel(this.Question, this.Answer);
}
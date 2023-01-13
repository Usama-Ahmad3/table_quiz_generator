import 'package:hive/hive.dart';
import 'package:table_app/widgets/tableModel.dart';

class Boxes {
  static Box<TableModel> getData() => Hive.box<TableModel>('table');
}
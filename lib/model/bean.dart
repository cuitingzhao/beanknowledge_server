import 'package:beanknowledge_server/beanknowledge_server.dart';

class Bean extends ManagedObject<_Bean> implements _Bean {}

class _Bean {
  //This maps to the primarykey column in the database
  @primaryKey
  int id;

  @Column(nullable: true)
  int catID;

  @Column(unique: true, nullable: true)
  String title;

  @Column(unique: true, nullable: true)
  String content;

  @Column(nullable: true)
  String link;

  @Column(nullable: true)
  DateTime sentOn;

  @Column(nullable: true)
  DateTime createdOn;
}

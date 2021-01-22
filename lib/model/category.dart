import '../beanknowledge_server.dart';

class Category extends ManagedObject<_Category> implements _Category {}

class _Category {
  @primaryKey
  int catID;

  @Column(unique: true, nullable: true)
  String cat1;

  @Column(nullable: true)
  DateTime createdOn;

  @Column(nullable: true)
  DateTime modifiedOn;
}

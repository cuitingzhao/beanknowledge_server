import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Bean", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("catID", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("title", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("content", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("link", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("sentOn", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("createdOn", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_Category", [
      SchemaColumn("catID", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("cat1", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: true),
      SchemaColumn("createdOn", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("modifiedOn", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final rows = [
      {
        'catID': 1,
        'title': '买到过期食品就赚了',
        'content':
            '如果你花5元买了一瓶过期的饮料，那么可以向经营者索赔10倍，也就是50元。而根据法侓规定，不足1000元的按1000元算，所以可以索赔1000元。如果商家拒绝赔偿，这时候就可以打消费者投诉举报电话啦。',
        'link': 'www.baidu.com',
        'sentOn': '2021-01-19',
        'createdOn': '2021-01-19'
      },
      {
        'catID': 2,
        'title': '过度加工食品更容易增胖',
        'content':
            '过度加工食品中的多种添加剂会扰乱大脑对于饱腹感的感知，它们在让大脑产生愉悦感的同时，无法及时检测到摄入的卡路里量，最终导致摄入过量。',
        'link': 'www.baidu.com',
        'sentOn': '2021-01-19',
        'createdOn': '2021-01-19'
      },
      {
        'catID': 3,
        'title': '憋住的屁并不会消失',
        'content':
            '无法破门而出的屁，会先被肠道吸收，进入血液，随着血液转移到全身，然后到达肝脏，继而进入肺部，最后，会随着呼吸……被你呼出去！',
        'link': 'www.baidu.com',
        'sentOn': '2021-01-19',
        'createdOn': '2021-01-19'
      },
    ];
    const sql =
        'INSERT INTO _Bean (catID, title, content, link, sentOn, createdOn) VALUES (@catID, @title, @content, @link, @sentOn, @createdOn)';
    for (final row in rows) {
      await database.store.execute(sql, substitutionValues: {
        'catID': row['catID'],
        'title': row['title'],
        'content': row['content'],
        'link': row['link'],
        'sentOn': row['sentOn'],
        'createdOn': row['createdOn']
      });
    }
  }
}

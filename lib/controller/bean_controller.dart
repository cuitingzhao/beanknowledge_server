import 'package:beanknowledge_server/beanknowledge_server.dart';

class BeanController extends ResourceController {
  BeanController(this.context);
  final ManagedContext context;

  @Operation.get() //Handel the get request received by this controller
  Future<Response> getBeanOfToday() async {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime.utc(now.year, now.month, now.day);
    // This is equal to select * from _bean where sentOn = 'today's date'
    final contentQuery = Query<Bean>(context)
      ..where((c) => (c.sentOn)).equalTo(date);
    final content = await contentQuery.fetch();
    return Response.ok(content);
  }
}

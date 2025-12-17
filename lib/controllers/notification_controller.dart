import 'package:coda_workshop/api/database/sqlite.dart';
import 'package:coda_workshop/models/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notifications = [];

  @override
  void onInit() { 
        loadNotifications();

    super.onInit();
  }

  Future<void> loadNotifications() async {
    final data = await DBHelper.instance.getAllNotifications();
    notifications = data.map((e) => NotificationModel.fromJson(e)).toList();
    update();
  }

  Future<void> addNotification(String title, String body) async {
    final notification = NotificationModel(
      title: title,
      body: body,
      dateTime: DateTime.now().toIso8601String(),
    );
    await DBHelper.instance.insertNotification(notification.toJson());
    await loadNotifications();
  }

  Future<void> deleteNotification(int id) async {
    await DBHelper.instance.deleteNotification(id);
    await loadNotifications();
  }
}

import 'package:coda_workshop/controllers/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: GetBuilder<NotificationController>(
        builder: (_) {
          if (controller.notifications.isEmpty) {
            return Center(child: Text("No notifications"));
          }
          return ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notif = controller.notifications[index];
              return ListTile(
                title: Text(notif.title),
                subtitle: Text(notif.body),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteNotification(notif.id!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

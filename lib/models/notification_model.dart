class NotificationModel {
  int? id;
  String title;
  String body;
  String dateTime;

  NotificationModel({
    this.id,
    required this.title,
    required this.body,
    required this.dateTime,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'dateTime': dateTime,
      };
}

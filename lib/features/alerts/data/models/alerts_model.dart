import 'package:meta/meta.dart';

enum AlertsTypeEnum {
  ERROR,
  WARNING,
  INFO,
  SUCCESS,
}

enum AlertsPopupEnum {
  FLUSHBAR,
  WIDGET,
}

class AlertsModel {
  final String body;
  final String title;
  final AlertsTypeEnum type;
  final AlertsPopupEnum popupType;
  final int generatedTime = DateTime.now().microsecondsSinceEpoch;
  final Duration duration;

  AlertsModel({
    @required this.body,
    @required this.title,
    @required this.popupType,
    @required this.type,
    this.duration = const Duration(seconds: 7),
  });
}

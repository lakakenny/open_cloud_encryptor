import 'package:equatable/equatable.dart';
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

class AlertsModel extends Equatable {
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

  @override
  List<Object> get props => [
        body,
        title,
        popupType,
        type,
        generatedTime,
        duration,
      ];
}

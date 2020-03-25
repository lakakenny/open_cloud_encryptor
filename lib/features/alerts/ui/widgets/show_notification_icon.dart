import 'package:flutter/material.dart';
import 'dart:async';

class ShowNotificationIcon {
  Future<void> show(BuildContext context) async {
    final overlayState = Overlay.of(context);

    final overlayEntry = OverlayEntry(builder: _build);

    overlayState.insert(overlayEntry);

    await Future.delayed(const Duration(seconds: 2));

    overlayEntry.remove();
  }

  Widget _build(BuildContext context) {
    return Positioned(
      top: 50.0,
      left: 50.0,
      child: Material(
        color: Colors.transparent,
        child: Icon(Icons.warning, color: Colors.purple),
      ),
    );
  }
}

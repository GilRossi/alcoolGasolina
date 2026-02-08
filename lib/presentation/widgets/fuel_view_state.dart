import 'package:flutter/material.dart';

@immutable
class FuelViewState {
  final String message;
  final Color color;

  const FuelViewState({
    required this.message,
    required this.color,
  });

  factory FuelViewState.initial() {
    return const FuelViewState(
      message: '',
      color: Colors.transparent,
    );
  }

  bool get hasMessage => message.isNotEmpty;
}

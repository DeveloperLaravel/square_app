import 'package:flutter/foundation.dart';

import 'transition_type.dart';

class TransitionManager {
  TransitionManager._();

  static final TransitionManager instance =
      TransitionManager._();

  final ValueNotifier<TransitionType>
      transitionNotifier =
      ValueNotifier(
    TransitionType.fadeSlide,
  );

  TransitionType get current =>
      transitionNotifier.value;

  void changeTransition(
    TransitionType type,
  ) {
    transitionNotifier.value = type;
  }
}
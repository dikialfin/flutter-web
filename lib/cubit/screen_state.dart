part of 'screen_cubit.dart';

@immutable
sealed class ScreenState {}

final class ScreenInitial extends ScreenState {}

final class ScreenExtraSmall extends ScreenState {
  final double width;
  ScreenExtraSmall({required this.width});
}

final class ScreenSmall extends ScreenState {
  final double width;
  ScreenSmall({required this.width});
}

final class ScreenMedium extends ScreenState {
  final double width;
  ScreenMedium({required this.width});
}

final class ScreenLarge extends ScreenState {
  final double width;
  ScreenLarge({required this.width});
}

final class ScreenExtraLarge extends ScreenState {
  final double width;
  ScreenExtraLarge({required this.width});
}

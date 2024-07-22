import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'screen_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenInitial());

  void setScreen(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= 640 && width < 768) {
      emit(ScreenSmall(width: width));
      return;
    }
    if (width >= 768 && width < 1024) {
      emit(ScreenMedium(width: width));
      return;
    }
    if (width >= 1024 && width < 1280) {
      emit(ScreenLarge(width: width));
      return;
    }
    if (width >= 1280) {
      emit(ScreenExtraLarge(width: width));
      return;
    }

    emit(ScreenExtraSmall(width: width));
    return;
  }
}

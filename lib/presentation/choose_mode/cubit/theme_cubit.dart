import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppThemeCubit extends HydratedCubit<ThemeMode> {
  AppThemeCubit() : super(ThemeMode.system);

  void updateAppTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme': state.index};
  }
}

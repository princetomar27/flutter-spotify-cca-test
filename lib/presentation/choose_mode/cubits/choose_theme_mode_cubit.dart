import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppThemeModeCubit extends HydratedCubit<ThemeMode> {
  AppThemeModeCubit() : super(ThemeMode.system);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'theme': state.index,
    };
  }

  // Function to update the app theme
  void updateAppTheme(ThemeMode selectedThemeMode) {
    emit(selectedThemeMode);
  }
}



import 'package:clean_archtecture/core/base/base_service.dart';
import 'package:clean_archtecture/core/theme/themes/app_light_theme.dart';
import 'package:clean_archtecture/core/theme/themes/dark_blue.dart';
import 'package:clean_archtecture/core/theme/themes/dark_theme.dart';
import 'package:clean_archtecture/core/utils/app_enum.dart';
import 'package:clean_archtecture/core/utils/app_preferences.dart';
import 'package:clean_archtecture/core/utils/app_type_def.dart';
import 'package:flutter/material.dart';

import '../theme/themes/light_theme.dart';



/// [ThemeService] class is responsible to provide and update the [Theme] in the app
@protected
class ThemeService extends BaseService<void, void>{

  /// [themeListener] is the variable which have the theme value
  /// Overriding the value of [themeListener] react to the changes of theme in the app
  ValueNotifier<AppTheme> themeListener = ValueNotifier<AppTheme>(AppTheme.lightRed);

  /// [themeService] singleton Object of theme class
  static ThemeService themeService = ThemeService();

  @override
  void init([void params]) {
    debugPrint("ThemeService Initialized");
  }


  /// [getThemeType] should call before get theme to update the theme data
  void getThemeType(BuildContext context){
    String theme = AppPreference.getThemeData();
    AppTheme appTheme = AppTheme.getTheme(theme);

    // if (appTheme == AppTheme.system) {
    //   final brightness = MediaQuery.platformBrightnessOf(context);
    //   brightness == Brightness.dark ? themeListener.value = AppTheme.dark : themeListener.value = AppTheme.light;
    // }
    // else {
    //   themeListener.value = appTheme;
    // }

    themeService.themeListener.value = appTheme;
  }

  /// [updateTheme] should call to update the theme
  FVoid updateTheme(AppTheme theme) async {
    themeService.themeListener.value = theme;
    await AppPreference.setThemeData(theme.getThemeVal());
  }

  /// [getTheme] is return in main, to provide the [ThemeData]
  ThemeData getTheme(BuildContext context){
    getThemeType(context);
    switch(themeService.themeListener.value){
      case AppTheme.lightRed:
        return AppLightTheme().getTheme();
      case AppTheme.darkBlue:
        return DarkBlueTheme().getTheme();
      case AppTheme.light:
        return AppLightTheme().getTheme();
      case AppTheme.dark:
        return AppDarkTheme().getTheme();
      default:
        final brightness = MediaQuery.platformBrightnessOf(context);
        return brightness == Brightness.dark ? AppDarkTheme().getTheme() : AppLightTheme().getTheme();
    }
  }

}
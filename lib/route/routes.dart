// вынесли наши роуты в отдельную папку и файл
import '../presentation/pages/auth_page/auth_page.dart';
import '../presentation/pages/main_screen/main_screen_page.dart';
import '../presentation/pages/start_pages/start_page.dart';
// Kurban 09-09-2023
// Kurban 16-09-2023 (add maincreen)
final routes = {
  '/': (context) => const StartScreen(),
  '/auth': (context) => const AuthScreen(),
  '/mainscreen': (context) => const MainScreen(),

};
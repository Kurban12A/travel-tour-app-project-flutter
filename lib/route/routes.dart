// вынесли наши роуты в отдельную папку и файл
import '../presentation/pages/auth_page/auth_page.dart';
import '../presentation/pages/start_pages/start_page.dart';
// Kurban 09-09-2023
final routes = {
  '/': (context) => const StartScreen(),
  '/auth': (context) => const AuthScreen(),

};
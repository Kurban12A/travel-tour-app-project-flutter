// вынесли наши роуты в отдельную папку и файл
import '../views/auth.dart';
import '../views/start_screen_widget.dart';
// Kurban 09-09-2023
final routes = {
  '/': (context) => const StartScreenWidget(),
  '/auth': (context) => const AuthScreenWidget(),

};
// вынесли наши роуты в отдельную папку и файл
import '../presentation/pages/start_pages/start_page.dart';
import '../presentation/pages/auth_page/auth_page.dart';
import '../presentation/pages/main_screen/main_screen_page.dart';
import '../presentation/pages/selection_category/selection_category.dart';
import '../presentation/pages/selection_card/selection_card.dart';

// Kurban 09-09-2023
// Kurban 16-09-2023 (add maincreen)
// Kurban 22-09-2023 (add selection_category)
// Kurban 24-09-2023 (add selection_card)

final routes = {
  '/': (context) => const StartScreen(),
  '/auth': (context) => const AuthScreen(),
  '/mainscreen': (context) => const MainScreen(),
  '/selection_category': (context) => const SelectionCategory(),
  '/selection_card': (context) => const SelectionCard(),
};


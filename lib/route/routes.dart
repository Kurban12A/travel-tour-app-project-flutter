import '../presentation/pages/start_pages/start_page.dart';
import '../presentation/pages/auth_page/sign_in_screen/sign_in_screen.dart';
import '../presentation/pages/auth_page/sign_up_screen/sign_up_screen.dart';
import '../presentation/pages/auth_page/reset_screen/reset_screen.dart';
import '../presentation/pages/auth_page/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/pages/auth_page/success_screen/success_screen.dart';
import '../presentation/pages/main_screen/main_screen_page.dart';
import '../presentation/pages/selection_category/selection_category.dart';
import '../presentation/pages/selection_card/selection_card.dart';
// вынесли наши роуты в отдельную папку и файл
// Kurban 09-09-2023 (add sign_in)
// Kurban 16-09-2023 (add maincreen)
// Kurban 22-09-2023 (add selection_category)
// Kurban 24-09-2023 (add selection_card)
// Kurban 02-10-2023 (add sign_up)
final routes = {
  '/': (context) => const StartScreen(),
  '/signIn': (context) => const SignInScreen(),
  '/signIn/signUp': (context) => const SignUpScreen(),
  '/signIn/forgotpassword': (context) => const ForgotPasswordScreen(),
  '/signIn/forgotpassword/resetpassword': (context) => const ResetPasswordScreen(),
  '/signIn/forgotpassword/resetpassword/successscreen': (context) => const SuccessScreen(),   
  '/mainscreen': (context) => const MainScreen(),
  '/selection_category': (context) => const SelectionCategory(),
  '/selection_card': (context) => const SelectionCard(),
};


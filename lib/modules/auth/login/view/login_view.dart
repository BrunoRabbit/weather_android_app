import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/auth/auth_view_model.dart';
import 'package:weather_android_app/modules/auth/login/view/widgets/form_login_widget.dart';
import 'package:weather_android_app/modules/auth/register/presenter/register_presenter.dart';
import 'package:weather_android_app/modules/auth/register/view/register_view.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late List<TextEditingController> _controllers;
  late RegisterPresenter _presenter;
  AuthViewModel viewModel = AuthViewModel();
  late Size _size;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(2, (_) => TextEditingController());
    _presenter = RegisterPresenter(
      viewModel: viewModel,
    );
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    for (TextEditingController controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // ? unfocus keyboard after 150 milli to avoid overflow
            if (FocusManager.instance.primaryFocus!.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();

              Future.delayed(const Duration(milliseconds: 150), () {
                Navigator.of(context).pop();
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        title: AppText(
          "Voltar",
          style: TextUtility.subtitle1.copyWith(
            color: Colors.white,
            fontFamily: 'Nunito-Regular',
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ? top circle
          SizedBox(
            height: _size.height * 0.3,
            child: Stack(
              children: [
                CustomPaint(
                  painter: AppBarPainter(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 28,
                      left: 18,
                    ),
                    child: AppText(
                      'Entrar',
                      style: TextUtility.headline1.medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _size.height * 0.1,
          ),
          // ? Form
          FormLoginWidget(
            size: _size,
            emailController: _controllers[0],
            passwordController: _controllers[1],
            presenter: _presenter,
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }
}

class AuthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = AppUtility.kSecondaryBackground
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(30, -30), 230, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

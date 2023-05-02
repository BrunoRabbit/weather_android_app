import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/register/presenter/register_presenter.dart';
import 'package:weather_android_app/modules/register/view/register_view_model.dart';
import 'package:weather_android_app/modules/register/view/widgets/form_component.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late List<TextEditingController> _controllers;
  late RegisterPresenter _presenter;
  RegisterViewModel viewModel = RegisterViewModel();

  late Size _size;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
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
                      'Register',
                      style: TextUtility.headline1.medium,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ? Form
          FormComponent(
            size: _size,
            emailController: _controllers[0],
            passwordController: _controllers[1],
            confirmPasswordController: _controllers[2],
            nameController: _controllers[3],
            presenter: _presenter,
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }
}

class AppBarPainter extends CustomPainter {
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/components/app_text_field.dart';
import 'package:weather_android_app/modules/auth/auth_view_model.dart';
import 'package:weather_android_app/modules/auth/register/entity/user_hive.dart';
import 'package:weather_android_app/modules/auth/register/presenter/register_presenter.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/extensions/form_extensions.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class FormWidget extends StatefulWidget {
  final Size size;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;
  final AuthViewModel viewModel;
  final RegisterPresenter presenter;

  const FormWidget({
    Key? key,
    required this.size,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nameController,
    required this.viewModel,
    required this.presenter,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomPaint(
              size: Size(double.infinity, widget.size.height / 9.96),
              painter: AuthPainter(),
            ),

            // ? TextFormField
            Expanded(
              child: Container(
                color: AppUtility.kPrimaryBackground,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ? Email
                      AppTextField(
                        labelText: "Email",
                        controller: widget.emailController,
                        validator: (text) {
                          if (text!.isValidEmail && text.isNotEmpty) {
                            return null;
                          }
                          return 'Utilize um email válido';
                        },
                      ),

                      // ? Password
                      AppTextField(
                        labelText: "Senha",
                        controller: widget.passwordController,
                        obscureText: true,
                        validator: (text) {
                          if (text!.isEmpty || text == ' ') {
                            return 'Utilize uma senha válida';
                          }
                          if (text.length < 6) {
                            return 'Senha não pode ser menor que 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      AppTextField(
                        controller: widget.confirmPasswordController,
                        labelText: "Confirme sua senha",
                        obscureText: true,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Esse campo não pode estar em branco";
                          }
                          if (widget.passwordController.text !=
                              widget.confirmPasswordController.text) {
                            return 'Senhas não coincidem';
                          } else {
                            return null;
                          }
                        },
                      ),

                      // ? Name
                      AppTextField(
                        controller: widget.nameController,
                        labelText: "Digite seu nome",
                        textInputFormatter: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-z A-Z]"),
                          ),
                          FilteringTextInputFormatter.deny(
                            RegExp("[0-9]"),
                          ),
                        ],
                        validator: (text) {
                          if (text!.isEmpty || text == ' ') {
                            return 'Nome não pode ser vazio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // ? button sign up
                      InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        splashColor: AppUtility.kSecondaryColor,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await registerUser();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: widget.size.width / 2.5,
                          height: widget.size.height / 18,
                          decoration: const ShapeDecoration(
                            color: AppUtility.kSecondaryBackground,
                            shape: StadiumBorder(),
                          ),
                          child: Center(
                            child: AppText(
                              "Registrar",
                              style: TextUtility.body1.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    final user = UserHive(
      email: widget.emailController.text,
      name: widget.nameController.text,
      password: UserHive.hashPassword(widget.passwordController.text),
    );

    await widget.presenter.registerUserHive(user).whenComplete(() {
      if (!mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(
            widget.viewModel.errorText,
            family: 'Medium',
          ),
          backgroundColor: widget.presenter.isRegister
              ? AppUtility.kSecondaryColor
              : AppUtility.kErrorColor,
        ),
      );
      if (widget.presenter.isRegister) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).push(
            AppRouter.createRoute(
              const HomeView(),
            ),
          );
        });
      }
    });
  }
}

class AuthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppUtility.kPrimaryBackground;

    Path path = Path();

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 2, -size.height / 1.1, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text_field.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/form_extentions.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class FormComponent extends StatelessWidget {
  const FormComponent({
    super.key,
    required GlobalKey<FormState> formKey,
    required Size size,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController nameController,
  })  : _formKey = formKey,
        _size = size,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController,
        _nameController = nameController;

  final GlobalKey<FormState> _formKey;
  final Size _size;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomPaint(
              size: Size(double.infinity, _size.height / 9.96),
              painter: AuthPainter(),
            ),

            // ? TextFormField
            Expanded(
              child: Container(
                color: AppUtility.primaryBackground,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextField(
                        labelText: "Email",
                        controller: _emailController,
                        validator: (text) {
                          if (!text.isValidEmail) {
                            return 'Utilize um email válido';
                          }
                          return null;
                        },
                      ),
                      AppTextField(
                        labelText: "Senha",
                        controller: _passwordController,
                        validator: (text) {
                          if (!text.isValidEmail) {
                            return 'Utilize um email válido';
                          }
                          return null;
                        },
                      ),
                      AppTextField(
                        controller: _confirmPasswordController,
                        labelText: "Confirme sua senha",
                        validator: (text) {
                          if (!text.isValidEmail) {
                            return 'Utilize um email válido';
                          }
                          return null;
                        },
                      ),
                      AppTextField(
                        controller: _nameController,
                        labelText: "Digite seu nome",
                        validator: (text) {
                          if (!text.isValidEmail) {
                            return 'Utilize um email válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        splashColor: AppUtility.secondaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          width: _size.width / 2.5,
                          height: _size.height / 18,
                          decoration: const ShapeDecoration(
                            color: AppUtility.secondaryBackground,
                            shape: StadiumBorder(),
                          ),
                          child: Center(
                            child: Text(
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
}

class AuthPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppUtility.primaryBackground;

    Path path = Path();

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 2, -size.height / 1.1, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

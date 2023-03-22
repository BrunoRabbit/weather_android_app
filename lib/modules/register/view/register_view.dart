import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/register/view/widgets/form_component.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _nameController;

  late Size _size;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
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
            // ? unfocus keyboard after 200 milli to avoid overflow
            if (FocusManager.instance.primaryFocus!.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();

              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.of(context).pop();
              });
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        title: Text(
          "Voltar",
          style: TextUtility.subtitle1.copyWith(color: Colors.white),
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
                    child: Text(
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
            formKey: _formKey,
            size: _size,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            nameController: _nameController,
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
      ..color = AppUtility.secondaryBackground
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(30, -30), 230, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

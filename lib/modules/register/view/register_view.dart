import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text_field.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late GlobalKey _formKey;
  late Size _size;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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

          // ? TextFormField
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(double.infinity, _size.height / 9.96),
                    painter: AuthPainter(),
                  ),
                  Expanded(
                    child: Container(
                      color: AppUtility.primaryBackground,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppTextField(
                              labelText: "Email",
                              validator: (text) {},
                            ),
                            AppTextField(
                              labelText: "Senha",
                              validator: (text) {},
                            ),
                            AppTextField(
                              labelText: "Confirme sua senha",
                              validator: (text) {},
                            ),
                            AppTextField(
                              labelText: "Digite seu nome",
                              validator: (text) {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(12.0),
                              splashColor: AppUtility.secondaryColor,
                              onTap: () {
                                // setState(() {
                                //   widget.pageController.animateToPage(
                                //     2,
                                //     duration: const Duration(milliseconds: 1000),
                                //     curve: Curves.fastOutSlowIn,
                                //   );
                                // });
                              },
                              child: Container(
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
          ),
        ],
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

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:student_management_system/view/core/components/button/like_button.dart';
import 'package:student_management_system/view/core/main/main_page.dart';

enum ButtonState { init, loading, done, start, successs }

// ignore: must_be_immutable
class ButtonLoad extends StatefulWidget {
  ButtonLoad(
      {Key? key,
      required this.title,
      required this.formKey,
      required this.success})
      : super(key: key);

  final String title;
  final bool success;
  var formKey;

  @override
  State<ButtonLoad> createState() => _ButtonLoadState();
}

class _ButtonLoadState extends State<ButtonLoad> {
  bool isAnimating = true;
  bool isSuccessful = false;
  ButtonState state = ButtonState.init;

  void check() {
    if (widget.success == true) {
      isSuccessful = true;
    } else {
      isSuccessful = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isClicked = state == ButtonState.start;
    bool isDone = state == ButtonState.done;
    bool isStretched = isAnimating || state == ButtonState.init;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      width: state == ButtonState.init || state == ButtonState.start
          ? size.width * 0.9
          : 70,
      onEnd: () => setState(() => isAnimating = !isAnimating),
      height: 70,
      child: isStretched
          ? buildButton(isDone, isClicked)
          : buildSmallButton(isDone, isSuccessful),
    );
  }

  Widget buildButton(bool isDone, bool isClicked) {
    // final double rounded = isDone ? 50 : 5;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isClicked
                ? const Color.fromARGB(0, 2, 148, 252)
                : const Color.fromARGB(78, 2, 148, 252),
            spreadRadius: 0,
            blurRadius: 20,
            offset:
                isClicked ? const Offset(0.0, 0.0) : const Offset(20.0, 20.0),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () async {
          await Future.delayed(const Duration(milliseconds: 375));
          setState(() => state = ButtonState.start);
          await Future.delayed(const Duration(milliseconds: 375));
          setState(() => state = ButtonState.init);
          await Future.delayed(const Duration(milliseconds: 500));
          // final isValid = formKey.currentState!.validate();
          // print("Form is valid: $isValid");
          setState(() => state = ButtonState.loading);
          await Future.delayed(const Duration(seconds: 3));
          setState(() => state = ButtonState.done);
          check();
          await Future.delayed(const Duration(seconds: 3));
          if (isSuccessful == true) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MainPage();
            }));
          } else {
            setState(() => state = ButtonState.init);
            await Future.delayed(const Duration(seconds: 3));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius:
                  state == ButtonState.init || state == ButtonState.start
                      ? BorderRadius.circular(5)
                      : BorderRadius.circular(50),
              gradient: state == ButtonState.start
                  ? const LinearGradient(
                      colors: <Color>[
                        Color(0xff0294FC),
                        Color(0xff0294FC),
                      ],
                    )
                  : const LinearGradient(
                      colors: <Color>[
                        Color(0xFF90E3F4),
                        Color(0xFF0394FC),
                        Color(0xFF0394FC),
                        Color(0xFF0394FC),
                      ],
                    )),
          child: FittedBox(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).scaffoldBackgroundColor,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSmallButton(bool isDone, bool isSuccessful) {
    final color = isDone
        ? const Color.fromARGB(255, 113, 191, 71)
        : const Color.fromARGB(255, 26, 143, 227);

    return isDone
        ? result(
            isDone: isDone,
            isSuccessful: isSuccessful,
          )
        : Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(78, 2, 148, 252),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(10.0, 10.0),
                ),
              ],
              shape: BoxShape.circle,
              color: color,
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFF90E3F4),
                  Color(0xFF0394FC),
                  Color(0xFF0394FC),
                ],
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 239, 247, 246),
              ),
            ),
          );
  }
}

class result extends StatelessWidget {
  const result({Key? key, required this.isDone, required this.isSuccessful})
      : super(key: key);

  final bool isDone;
  final bool isSuccessful;

  @override
  Widget build(BuildContext context) {
    return isSuccessful
        ? LikeButtonEdit(
            isTransition: isDone,
            size: 67,
            circleColor: const CircleColor(
                start: Color.fromARGB(255, 113, 191, 71),
                end: Color.fromARGB(255, 98, 166, 62)),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: Color.fromARGB(255, 98, 166, 62),
              dotSecondaryColor: Color.fromARGB(255, 113, 191, 71),
            ),
            likeBuilder: (bool isDone) {
              return Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(78, 98, 166, 62),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(10.0, 10.0),
                    ),
                  ],
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF71BF47),
                      // Color(0xFF62A63E),
                      // Color(0xFF62A63E),
                      // Color(0xFF62A63E),
                      // Color(0xFF62A63E),
                      Color(0xFF62A63E),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.done_all,
                  color: Color.fromARGB(255, 239, 247, 246),
                  size: 36,
                ),
              );
            },
          )
        : Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(78, 193, 47, 66),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(10.0, 10.0),
                ),
              ],
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 193, 47, 66),
              gradient: const LinearGradient(
                colors: <Color>[
                  Color(0xFFE47838),
                  Color(0xFFC12F42),
                  Color(0xFFC12F42),
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                color: Color.fromARGB(255, 239, 247, 246),
                size: 36,
              ),
            ),
          );
  }
}

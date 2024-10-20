import 'package:flutter/material.dart';
import 'package:staggered_animated_widget/animation_direction.dart';
import 'package:staggered_animated_widget/staggered_animated_widget.dart';

void main() {
  runApp(const StaggeredAnimatedWidgetExample());
}

class StaggeredAnimatedWidgetExample extends StatefulWidget {
  const StaggeredAnimatedWidgetExample({super.key});

  @override
  State<StaggeredAnimatedWidgetExample> createState() => _StaggeredAnimatedWidgetExampleState();
}

class _StaggeredAnimatedWidgetExampleState extends State<StaggeredAnimatedWidgetExample> {
  late bool _showSecond = false;
  late bool _showThird = false;
  late bool _showFourth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StaggeredAnimatedWidget(
                  delay: 200,
                  curve: Curves.fastLinearToSlowEaseIn,
                  direction: AnimationDirection.fromTop,
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _showSecond = true;
                        });
                      },
                      color: Colors.blue,
                      child: const Text(
                        'Show Second ^_^',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _showSecond
                    ? StaggeredAnimatedWidget(
                  delay: 200,
                  curve: Curves.linearToEaseOut,
                  direction: AnimationDirection.fromRight,
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _showThird = true;
                        });
                      },
                      color: Colors.red,
                      child: const Text(
                        'Show Third',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
                const SizedBox(height: 20),
                _showThird
                    ? StaggeredAnimatedWidget(
                  delay: 200,
                  curve: Curves.easeInCubic,
                  direction: AnimationDirection.fromLeft,
                  duration: const Duration(milliseconds: 1000),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          _showFourth = true;
                        });
                      },
                      color: Colors.yellow,
                      child: const Text(
                        'Show Last',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
                const SizedBox(height: 20),
                _showFourth
                    ? StaggeredAnimatedWidget(
                  delay: 200,
                  curve: Curves.bounceIn,
                  direction: AnimationDirection.fromBottom,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      child: const Text(
                        'Last ^_^',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
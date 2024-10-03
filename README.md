
<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Staggered Animated Widget

A Flutter package that provides staggered animations for widgets.

## Features

- Provides a simple way to add staggered animations to your Flutter widgets.
- Supports multiple animation directions: from top, bottom, left, or right.
- Easy to use with customizable delay.
- Added support for customizable duration and curve properties.

## Getting Started

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  staggered_animated_widget: ^1.0.0 
```

## Usage

Here’s a simple example of how to use the `StaggeredAnimatedWidget`:

```dart
import 'package:flutter/material.dart';
import 'package:staggered_animated_widget/animation_direction.dart';
import 'package:staggered_animated_widget/staggered_animated_widget.dart';

void main() {
  runApp(StaggeredAnimatedWidgetExample());
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
                  duration: Duration(milliseconds: 1000),
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
                      child: Text(
                        'Show Second ^_^',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _showSecond
                    ? StaggeredAnimatedWidget(
                        delay: 200,
                        curve: Curves.linearToEaseOut,
                        direction: AnimationDirection.fromRight,
                        duration: Duration(milliseconds: 1000),
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
                            child: Text(
                              'Show Third',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 20),
                _showThird
                    ? StaggeredAnimatedWidget(
                        delay: 200,
                        curve: Curves.easeInCubic,
                        direction: AnimationDirection.fromLeft,
                        duration: Duration(milliseconds: 1000),
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
                            child: Text(
                              'Show Last',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 20),
                _showFourth
                    ? StaggeredAnimatedWidget(
                        delay: 200,
                        curve: Curves.bounceIn,
                        direction: AnimationDirection.fromBottom,
                        duration: Duration(milliseconds: 200),
                        child: SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.green,
                            child: Text(
                              'Last ^_^',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### Parameters

- `child`: The widget to animate.
- `delay`: The delay before the animation starts (in milliseconds).
- `direction`: The direction from which the widget will enter. Can be one of the following:
  - `AnimationDirection.fromTop`
  - `AnimationDirection.fromBottom`
  - `AnimationDirection.fromLeft`
  - `AnimationDirection.fromRight`
- `duration`: The duration of the animation (default is 800 milliseconds).
- `curve`: The curve used for the animation (default is `Curves.easeInOut`).

## Additional Information

For more complex animations, you can customize the `duration` and `curve` properties inside the `StaggeredAnimatedWidget`. For detailed usage, consider adding more examples to the `/example` folder of your package.

## License

This package is licensed under the MIT License.

## Contact

YouTube Channel: [Just4Flutter](https://www.youtube.com/@just4flutter)  
Email: ahmadnahal7@gmail.com

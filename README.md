# 📦 Staggered Animated Widget

A Flutter package that provides staggered animations for widgets and column .

## 🚀 Features

- Provides a simple way to add staggered animations to your Flutter widgets.
- Supports multiple animation directions: from top, bottom, left, or right.
- Easy to use with customizable delay.
- Added support for customizable duration and curve properties.

## 📌 Getting Started

To use this package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  staggered_animated_widget: ^2.0.2 
```

## 💳 Staggered animated widgets Parameters

- **child**: The widget to animate.
- **delay**: The delay before the animation starts (in milliseconds).
- **direction**: The direction from which the widget will enter. Can be one of the following:
    - **AnimationDirection.fromTop**
    - **AnimationDirection.fromBottom**
    - **AnimationDirection.fromLeft**
    - **AnimationDirection.fromRight**
- **duration**: The duration of the animation (default is 800 milliseconds).
- **curve**: The curve used for the animation (default is `Curves.easeInOut`).

## 💳 StaggeredAnimatedColumn Parameters

In addition to individual widgets, the package also provides `StaggeredAnimatedColumn`, which animates a list of child widgets in a staggered manner. Each widget will have a delay before it animates, allowing for a more dynamic effect when displaying multiple widgets.

- **children**: A list of widgets to animate in a staggered manner.
- **delayIncrement**: The delay between each widget's animation (in milliseconds).
- **duration**: The duration of each widget's animation (default is 800 milliseconds).
- **curve**: The curve used for the animation (default is `Curves.easeInOut`).
- **direction**: The direction from which the widgets will enter. Can be one of the following:
  - **AnimationDirection.fromTop**
  - **AnimationDirection.fromBottom**
  - **AnimationDirection.fromLeft**
  - **AnimationDirection.fromRight**
- **spacing**: Optional spacing between the widgets.




## ☕ Support My Work

If you find **Easy Stripe Payment** useful and would like to support my work, consider buying me a coffee!

A small cup of coffee might not mean much to you, but for me, it means a lot—it fuels my passion and helps me continue building and improving tools for the Flutter community. 🚀

👉 [Buy me a coffee](https://buymeacoffee.com/just4prog)

<p align="center">
  <img src="https://github.com/user-attachments/assets/a4c7373d-4f03-4c7c-98de-bce616eae8ed" alt="QR Code" width="200">
</p>

Your support keeps me motivated to provide more content, updates, and helpful tools. Thank you for being awesome! ❤️


## Additional Information

For more complex animations, you can customize the `duration` and `curve` properties inside the
`StaggeredAnimatedWidget`. For detailed usage, consider adding more examples to the `/example`
folder of your package.



## License

This package is licensed under the MIT License.

## Contact

- **YouTube Channel**: [Just4Flutter](https://www.youtube.com/@just4flutter)
- **Email**: ahmadnahal7@gmail.com

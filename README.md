# flutter_startup

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Navigator
Support default Flutter SDK navigator, and extends desktop and web application navigation.
Usage here,

1. add your screen router at router_table.dart
2. use Consumer<NavigationCompat>(builder) build ui tree
3. then, you got NavigationCompat.pushNamed api access permission.


### Code styles

1. widget: xxx.w.dart
2. screen: xxx.page.dart
3. 全局配置等: xxx.g.dart
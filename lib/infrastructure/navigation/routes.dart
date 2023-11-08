part of 'navigation.dart';

class Routes {
  Routes._(this.context);

  factory Routes.of(BuildContext context) {
    return Routes._(context);
  }

  final BuildContext context;

  void toLocationMailContent(int id) => context.go('/${_Path.mailContent}?id=$id');
}

class _Path {
  static const home = '/';
  static const mailContent = 'mailContent';
}

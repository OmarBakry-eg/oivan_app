import 'routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin Constants {
  static void unFocusFunc() =>
      FocusScope.of(AppRoutes.navigatorKey.currentContext!).unfocus();

  static Future<void> showLoading(
          {String? title, String? description, Function? onPressed}) async =>
      showDialog<void>(
        context: AppRoutes.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

  static void hideLoading() => AppRoutes.navigatorKey.currentState!.pop();

  static void navigateTo(String location, {Object? extra}) =>
      GoRouter.of(AppRoutes.navigatorKey.currentContext!)
          .push(location, extra: extra);

  static Future<dynamic> showMessage(
          {String? title,
          String? description,
          Function? onPressed,
          bool removeCancelButton = true}) async =>
      AppRoutes.navigatorKey.currentContext == null
          ? const SizedBox.shrink()
          : showDialog<void>(
              context: AppRoutes.navigatorKey.currentContext!,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title ?? "Alert"),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(description ?? "Error Occured"),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        if (onPressed != null) {
                          onPressed();
                        } else {
                          GoRouter.of(context).pop();
                        }
                      },
                    ),
                    removeCancelButton
                        ? const SizedBox.shrink()
                        : TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                          ),
                  ],
                );
              },
            );
}

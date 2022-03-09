import 'package:flutter/material.dart';
import 'package:weather_app/domain/core/entities/failure.dart';
import 'package:weather_app/domain/core/utils/server_error_code.dart';

typedef OnRetry = void Function();

class ErrorView extends StatelessWidget {
  final Failure failure;
  final OnRetry onRetry;

  const ErrorView({Key? key, required this.failure, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _errorMessage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(onPressed: onRetry, child: const Text('Retry'))
      ],
    );
  }

  String get _errorMessage {
    var errorMessage = 'OOPS! Something went wrong';

    if (failure is ServerFailure) {
      final serverFailure = (failure as ServerFailure);
      if (serverFailure.errorCode == ServerErrorCode.noInternetConnection) {
        errorMessage = 'Please check your internet connection';
      } else if (serverFailure.message.isNotEmpty) {
        errorMessage = serverFailure.message;
      }
    }

    return errorMessage;
  }
}

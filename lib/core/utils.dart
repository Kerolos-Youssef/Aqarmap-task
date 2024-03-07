import 'dart:developer';

import 'package:aqarmap_task/core/errors/failures.dart';
import 'package:flutter/foundation.dart';

void printInDebug(String data) {
  if (kDebugMode) {
    log(data);
  }
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case OfflineFailure:
      return 'Check your internet connection';
    default:
      return 'Unexpected Error';
  }
}

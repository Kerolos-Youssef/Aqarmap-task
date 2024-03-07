import 'package:aqarmap_task/core/errors/failures.dart';
import 'package:aqarmap_task/core/utils.dart';
import 'package:dartz/dartz.dart';

extension OnEither<T> on Either<Failure, T> {
  dynamic right(Function(T data) callBack) {
    return fold(
      (failure) {
        printInDebug('Error! $failure');
      },
      (data) {
        callBack(data);
        return data;
      },
    );
  }

  dynamic left(Function(Failure failure) callBack) {
    return fold(
      (failure) {
        printInDebug('${failure.runtimeType}');
        callBack(failure);
        return failure;
      },
      (data) {},
    );
  }
}

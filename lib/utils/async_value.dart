import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AsyncValue<T> extends Equatable {
  final T? data;
  final String? error;
  final bool isLoading;

  const AsyncValue.loading()
      : data = null,
        error = null,
        isLoading = true;

  const AsyncValue.data(this.data)
      : error = null,
        isLoading = false;

  const AsyncValue.error(this.error)
      : data = null,
        isLoading = false;

  Widget when({
    required Widget Function() loading,
    required Widget Function(T data) data,
    required Widget Function(String error) error,
  }) {
    if (isLoading) {
      return loading();
    } else if (this.data != null) {
      return data(this.data as T);
    } else if (this.error != null) {
      return error(this.error!);
    } else {
      throw StateError('Invalid AsyncValue state');
    }
  }

  @override
  List<Object?> get props => [data, error, isLoading];
}

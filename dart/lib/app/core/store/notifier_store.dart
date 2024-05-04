import 'package:chuva/app/core/store/store_abstract.dart';
import 'package:flutter/material.dart';

abstract class StoreNotifier<T> implements StoreAbstract<T> {
  final _changeNotifier = ChangeNotifier();
  T _state;
  StoreNotifier(this._state);

  @override
  T get state => _state;

  ChangeNotifier get changeNotifier => _changeNotifier;

  @override
  void dispatch(T state) {
    _state = state;
    _changeNotifier.notifyListeners();
  }

  @override
  StoreDispose connect(void Function(T) listener) {
    void listener0() => listener(state);
    _changeNotifier.addListener(listener0);
    return () => _changeNotifier.removeListener(listener0);
  }

  @override
  void dipose() {
    _changeNotifier.dispose();
  }
}

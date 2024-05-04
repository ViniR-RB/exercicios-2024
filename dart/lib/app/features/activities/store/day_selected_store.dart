import 'package:chuva/app/core/store/notifier_store.dart';

class DaySelectedStore extends StoreNotifier<int> {
  DaySelectedStore() : super(DateTime.now().day);

  void setDay(int day) {
    dispatch(day);
  }
}

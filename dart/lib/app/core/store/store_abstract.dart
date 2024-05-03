abstract class StoreAbstract<T> {
  T get state;

  void dispatch(T state);
  StoreDispose connect(void Function(T) listener);
  void dipose();
}

typedef StoreDispose = void Function();

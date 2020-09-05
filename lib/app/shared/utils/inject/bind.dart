class Bind<T> {
  List<T> _bind = [];
  setBond(T item) => _bind.add(item);
  getBond<T>() => _bind.whereType<T>().first;
}
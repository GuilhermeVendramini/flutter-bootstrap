class Bind<T> {
  List<T> _bonds;

  Bind({List<T> bonds = const []}) {
    _bonds = bonds;
  }

  get<T>() => _bonds.whereType<T>().first;
}

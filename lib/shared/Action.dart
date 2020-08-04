class Action<T, P> {
  final T type;
  final P payload;
  Action(this.type, {this.payload});
}

abstract class Selector<T, S> {
  S get(T main);

  T set(T main, S newState);
}

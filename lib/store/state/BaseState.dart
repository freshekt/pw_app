abstract class BaseState<T> {
  bool isInProcess = false;
  T clone();
}

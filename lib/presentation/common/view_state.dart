sealed class ViewState<T> {
  const ViewState();

  const factory ViewState.loading() = LoadingState<T>;
  const factory ViewState.data(T data) = DataState<T>;
  const factory ViewState.error(String message) = ErrorState<T>;
  const factory ViewState.noInternet() = NoInternetState<T>;
}

class LoadingState<T> extends ViewState<T> {
  const LoadingState();
}

class DataState<T> extends ViewState<T> {
  final T data;
  const DataState(this.data);
}

class ErrorState<T> extends ViewState<T> {
  final String message;
  const ErrorState(this.message);
}

class NoInternetState<T> extends ViewState<T> {
  const NoInternetState();
}

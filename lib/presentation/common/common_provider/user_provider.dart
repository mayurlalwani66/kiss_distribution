import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';

import '../../../domain/model/user_model.dart';

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  final UserUseCase _userUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  UserNotifier(this._userUseCase, this._updateUserUseCase)
      : super(const AsyncValue.loading());

  Future<void> getUserData() async {
    state = const AsyncLoading();

    final result = await _userUseCase.execute("");

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (user) {
        state = AsyncData(user);
      },
    );
  }

  Future<void> updateUserProfile(UpdateUserUseCaseInput request) async {
    final result = await _updateUserUseCase.execute(request);

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (_) async {
        await getUserData();
      },
    );
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User?>>((ref) {
  return UserNotifier(
    ref.read(userUseCaseProvider),
    ref.read(updateUserUseCaseProvider),
  );
});

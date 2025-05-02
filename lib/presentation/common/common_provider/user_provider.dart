import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_distribution/app/app_prefs.dart';
import 'package:k_distribution/app/di.dart';
import 'package:k_distribution/domain/usecase/user_usecase.dart';

import '../../../domain/model/user_model.dart';

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  final UserUseCase _userUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final AppPreferences _appPreferences;

  UserNotifier(this._userUseCase, this._updateUserUseCase, this._appPreferences)
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
        _appPreferences.setUserId(user.id);
        _appPreferences.setUserFirstName(user.firstName);
        _appPreferences.setUserLastName(user.lastName);
        _appPreferences.setUserPhoneNumber(user.phoneNumber);
        _appPreferences.setUserEmail(user.email);
        _appPreferences.setUserPassword(user.password);
        _appPreferences.setUserName(user.userName);
        _appPreferences.setUserRole(user.role);
        _appPreferences.setUserDob(user.dob);
        _appPreferences
            .setUserIsTermAndConditionAccept(user.isTermAndConditionAccept);
        _appPreferences.setUserPhoto(user.photo);
        _appPreferences.setUserPhotoUrl(user.photoUrl);
        _appPreferences.setUserState(user.state);
        _appPreferences.setUserPincode(user.pincode);
        _appPreferences.setUserIsSuperAdmin(user.isSuperAdmin);
        _appPreferences.setUserIsSingleOrganisation(user.isSingleOrganisation);
        _appPreferences.setUserPhoneNumber2(user.phoneNumberTwo);
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
  return UserNotifier(ref.read(userUseCaseProvider),
      ref.read(updateUserUseCaseProvider), ref.read(appPreferencesProvider));
});

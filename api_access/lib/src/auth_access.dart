abstract class IUser {
  String get id;
  Map<String, dynamic>? get data;
}

/// abstract Authentication service
abstract class IAuthAccess {
  /// emits the currently authenticated user whenever auth state changes
  /// emits the current value on first emition and any changes afterwards
  Stream<IUser?> get authStateChanged;

  /// the currently authenticated user
  IUser? get currentUser;

  /// Signs user in with email and password and resolves the user
  /// This should trigger [authStateChanged] to emit the new user
  Future<IUser?> signIn(String email, String password);

  /// Creates a new user with email & password and also signs them in
  /// This should trigger [authStateChanged] to emit the new user
  Future<IUser?> signUp(String email, String password);

  /// Signs the user out of the application
  /// This should trigger [authStateChanged] to emit the new user
  Future<void> signOut();

  /// Dispose any resources used for the instance
  void dispose();
}

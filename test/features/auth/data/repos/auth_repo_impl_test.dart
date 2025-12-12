import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late AuthRepoImpl authRepo;

  setUpAll(() {
    provideDummy<Result<bool>>(const Success<bool>(false));
    provideDummy<Result<List<BiometricType>>>(
        const Success<List<BiometricType>>([]));
  });

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    authRepo = AuthRepoImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('AuthRepoImpl - register', () {
    const tFirstName = 'John';
    const tLastName = 'Doe';
    const tEmail = 'john.doe@example.com';
    const tPassword = 'password123';
    const tPhoneNumber = '+1234567890';
    const tUserId = 'user123';

    test('should return Success with UserModel when registration is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => tUserId);

      when(mockRemoteDataSource.saveUserData(
        userModel: UserModel(uesrId: 'uesrId', firstName: "firstName", lastName: "lastName", email: "email",
         phoneNumber: "phoneNumber"),
      )).thenAnswer((_) async => Future.value());

      // act
      final result = await authRepo.register(
        firstName: tFirstName,
        lastName: tLastName,
        email: tEmail,
        password: tPassword,
        phoneNumber: tPhoneNumber,
      );

      // assert
      expect(result, isA<Success<UserModel>>());
      expect((result as Success).data.userId, equals(tUserId));
      

      verify(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      )).called(1);

      verify(mockRemoteDataSource.saveUserData(
        userModel: anyNamed('userModel'),
      )).called(1);
    });

    test('should return FailureResult with FirebaseFailure when createUser fails',
        () async {
      // arrange
      final tFailure = FirebaseFailure(errMessage: 'Firebase error');

      when(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(tFailure);

      // act
      final result = await authRepo.register(
        firstName: tFirstName,
        lastName: tLastName,
        email: tEmail,
        password: tPassword,
        phoneNumber: tPhoneNumber,
      );

      // assert
      expect(result, isA<FailureResult<UserModel>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      )).called(1);

      verifyNever(mockRemoteDataSource.saveUserData(
        userModel: anyNamed('userModel'),
      ));
    });

    test('should return FailureResult with ServerFailure when saveUserData fails',
        () async {
      // arrange
      final tFailure = ServerFailure(errMessage: 'Server error');

      when(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => tUserId);

      when(mockRemoteDataSource.saveUserData(
        userModel: anyNamed('userModel'),
      )).thenThrow(tFailure);

      // act
      final result = await authRepo.register(
        firstName: tFirstName,
        lastName: tLastName,
        email: tEmail,
        password: tPassword,
        phoneNumber: tPhoneNumber,
      );

      // assert
      expect(result, isA<FailureResult<UserModel>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      )).called(1);

      verify(mockRemoteDataSource.saveUserData(
        userModel: anyNamed('userModel'),
      )).called(1);
    });

    test('should return FailureResult with GeneralFailure when unexpected exception occurs',
        () async {
      // arrange
      when(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(Exception('Unexpected error'));

      // act
      final result = await authRepo.register(
        firstName: tFirstName,
        lastName: tLastName,
        email: tEmail,
        password: tPassword,
        phoneNumber: tPhoneNumber,
      );

      // assert
      expect(result, isA<FailureResult<UserModel>>());
      expect((result as FailureResult).failure, isA<GeneralFailure>());

      verify(mockRemoteDataSource.createUserWithEmailAndPassword(
        email: tEmail,
        password: tPassword,
      )).called(1);
    });
  });

  group('AuthRepoImpl - signIn', () {
    const tEmail = 'john.doe@example.com';
    const tPassword = 'password123';
    const tUserCredential = 'user123';

    test('should return Success with user credential when sign in is successful',
        () async {
      // arrange
      when(mockRemoteDataSource.signIn(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => tUserCredential);

      // act
      final result = await authRepo.signIn(
        email: tEmail,
        password: tPassword,
      );

      // assert
      expect(result, isA<Success<String>>());
      expect((result as Success).data, equals(tUserCredential));

      verify(mockRemoteDataSource.signIn(
        email: tEmail,
        password: tPassword,
      )).called(1);
    });

    test('should return FailureResult with FirebaseFailure when signIn throws FirebaseFailure',
        () async {
      // arrange
      final tFailure = FirebaseFailure(errMessage: 'Invalid credentials');

      when(mockRemoteDataSource.signIn(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(tFailure);

      // act
      final result = await authRepo.signIn(
        email: tEmail,
        password: tPassword,
      );

      // assert
      expect(result, isA<FailureResult<String>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockRemoteDataSource.signIn(
        email: tEmail,
        password: tPassword,
      )).called(1);
    });

    test('should return FailureResult with ServerFailure when signIn throws ServerFailure',
        () async {
      // arrange
      final tFailure = ServerFailure(errMessage: 'Server error');

      when(mockRemoteDataSource.signIn(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(tFailure);

      // act
      final result = await authRepo.signIn(
        email: tEmail,
        password: tPassword,
      );

      // assert
      expect(result, isA<FailureResult<String>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockRemoteDataSource.signIn(
        email: tEmail,
        password: tPassword,
      )).called(1);
    });

    test('should return FailureResult with GeneralFailure when unexpected exception occurs',
        () async {
      // arrange
      when(mockRemoteDataSource.signIn(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(Exception('Network error'));

      // act
      final result = await authRepo.signIn(
        email: tEmail,
        password: tPassword,
      );

      // assert
      expect(result, isA<FailureResult<String>>());
      expect((result as FailureResult).failure, isA<GeneralFailure>());

      verify(mockRemoteDataSource.signIn(
        email: tEmail,
        password: tPassword,
      )).called(1);
    });
  });

  group('AuthRepoImpl - authenticateBiometric', () {
    const tReason = 'Authenticate to continue';

    test('should return Success<bool> true when authentication is successful',
        () async {
      // arrange
      when(mockLocalDataSource.authenticateBiometric(any))
          .thenAnswer((_) async => const Success<bool>(true));

      // act
      final result = await authRepo.authenticateBiometric(tReason);

      // assert
      expect(result, isA<Success<bool>>());
      expect((result as Success).data, equals(true));

      verify(mockLocalDataSource.authenticateBiometric(tReason)).called(1);
    });

    test('should return Success<bool> false when user cancels authentication',
        () async {
      // arrange
      when(mockLocalDataSource.authenticateBiometric(any))
          .thenAnswer((_) async => const Success<bool>(false));

      // act
      final result = await authRepo.authenticateBiometric(tReason);

      // assert
      expect(result, isA<Success<bool>>());
      expect((result as Success).data, equals(false));

      verify(mockLocalDataSource.authenticateBiometric(tReason)).called(1);
    });

    test('should return FailureResult when authentication fails', () async {
      // arrange
      final tFailure = GeneralFailure(errMessage: 'Authentication failed');

      when(mockLocalDataSource.authenticateBiometric(any))
          .thenAnswer((_) async => FailureResult(tFailure));

      // act
      final result = await authRepo.authenticateBiometric(tReason);

      // assert
      expect(result, isA<FailureResult<bool>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockLocalDataSource.authenticateBiometric(tReason)).called(1);
    });
  });

  group('AuthRepoImpl - checkBiometricSupport', () {
    test('should return Success<bool> true when biometric is supported',
        () async {
      // arrange
      when(mockLocalDataSource.checkBiometricSupport())
          .thenAnswer((_) async => const Success<bool>(true));

      // act
      final result = await authRepo.checkBiometricSupport();

      // assert
      expect(result, isA<Success<bool>>());
      expect((result as Success).data, equals(true));

      verify(mockLocalDataSource.checkBiometricSupport()).called(1);
    });

    test('should return Success<bool> false when biometric is not supported',
        () async {
      // arrange
      when(mockLocalDataSource.checkBiometricSupport())
          .thenAnswer((_) async => const Success<bool>(false));

      // act
      final result = await authRepo.checkBiometricSupport();

      // assert
      expect(result, isA<Success<bool>>());
      expect((result as Success).data, equals(false));

      verify(mockLocalDataSource.checkBiometricSupport()).called(1);
    });

    test('should return FailureResult when checking support fails', () async {
      // arrange
      final tFailure = GeneralFailure(errMessage: 'Failed to check support');

      when(mockLocalDataSource.checkBiometricSupport())
          .thenAnswer((_) async => FailureResult(tFailure));

      // act
      final result = await authRepo.checkBiometricSupport();

      // assert
      expect(result, isA<FailureResult<bool>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockLocalDataSource.checkBiometricSupport()).called(1);
    });
  });

  group('AuthRepoImpl - getAvailableBiometrics', () {
    final tBiometrics = [BiometricType.face, BiometricType.fingerprint];

    test('should return Success with list of available biometrics', () async {
      // arrange
      when(mockLocalDataSource.getAvailableBiometrics())
          .thenAnswer((_) async => Success<List<BiometricType>>(tBiometrics));

      // act
      final result = await authRepo.getAvailableBiometrics();

      // assert
      expect(result, isA<Success<List<BiometricType>>>());
      expect((result as Success).data, equals(tBiometrics));

      verify(mockLocalDataSource.getAvailableBiometrics()).called(1);
    });

    test('should return Success with empty list when no biometrics available',
        () async {
      // arrange
      when(mockLocalDataSource.getAvailableBiometrics())
          .thenAnswer((_) async => const Success<List<BiometricType>>([]));

      // act
      final result = await authRepo.getAvailableBiometrics();

      // assert
      expect(result, isA<Success<List<BiometricType>>>());
      expect((result as Success).data, isEmpty);

      verify(mockLocalDataSource.getAvailableBiometrics()).called(1);
    });

    test('should return FailureResult when getting biometrics fails', () async {
      // arrange
      final tFailure = GeneralFailure(errMessage: 'Failed to get biometrics');

      when(mockLocalDataSource.getAvailableBiometrics())
          .thenAnswer((_) async => FailureResult(tFailure));

      // act
      final result = await authRepo.getAvailableBiometrics();

      // assert
      expect(result, isA<FailureResult<List<BiometricType>>>());
      expect((result as FailureResult).failure, equals(tFailure));

      verify(mockLocalDataSource.getAvailableBiometrics()).called(1);
    });
  });

}
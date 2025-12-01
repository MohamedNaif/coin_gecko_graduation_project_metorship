abstract class EndPoints {
  static const String baseUrl = 'https://api.coingecko.com/api/v3/simple/';
  // static const String baseUrl =
  //     'http://199.247.5.250:1111/'; //! live server balsan

  // static const String baseUrl = 'http://192.168.1.27:1114/'; //! local server
  // static const String baseUrl = 'http://192.168.56.1:1114/'; //! local server
  static const String loginSuperAdmin = 'api/v1/auth/login';
  static const String signupUser = 'api/v1/auth/signup';
  static const String refreshToken = '/api/auth/refresh-token';

  //! =======Start Auth Endpoints (Accessories Eshop)========
  static const String login = '/api/auth/login';
  static const String me = '/api/auth/me';
  static const String register = '/api/auth/register';
  static const String logout = '/api/auth/logout';
  static const String verifyEmail = '/api/auth/verify-email';
  static const String changePassword = '/api/auth/change-password';
  static const String forgotPassword = '/api/auth/forgot-password';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String resetPassword = '/api/auth/reset-password';
  static const String validateOtp = '/api/auth/validate-otp';
  //! =======End Auth Endpoints========

  //! =======Products Endpoints========
  static const String products = '/api/products';
  static const String categoriesV1 = '/v1/categories';
  static const String breedsV1 = '/v1/breeds';
  //! =======Portfolio Endpoints========
  static const String portfolio = '/simple/price';
}

// add all changes without pagination

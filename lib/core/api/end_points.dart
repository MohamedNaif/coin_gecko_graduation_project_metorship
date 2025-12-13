abstract class EndPoints {
  static const String baseUrl = 'https://api.coingecko.com/api/v3/';

  static const String global = '/global';
  static const String trending = '/search/trending';
  static const String markets = '/coins/markets';

  //! =======Portfolio Endpoints========
  static const String portfolio = 'price';
  static const String coins = '/coins';
  static const String search = '/search';
  //! =======Portfolio Endpoints========
  //=======Payment Endpoints========
  static const String paymentEndPoint = 'payment_intents';
  static const String paymentBaseUrl = 'https://api.stripe.com/v1/';

  static const String marketChart = '/market_chart';
  static const String coinDetails = '/coins/{id}';

}

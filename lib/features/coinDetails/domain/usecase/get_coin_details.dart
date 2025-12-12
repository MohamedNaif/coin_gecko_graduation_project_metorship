import '../entities/coin_details.dart';
import '../repo/coin_repo.dart';

class GetCoinDetails {
  final CoinRepository repository;

  GetCoinDetails(this.repository);

  Future<CoinDetails> call(String coinId) {
    return repository.getCoinDetails(coinId);
  }
}
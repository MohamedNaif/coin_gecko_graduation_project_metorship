import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_response_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/repository/payment_remote_repository.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/presentation/cubit/payment_state.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentRemoteRepository})
      : super(const PaymentState.initial());

  final PaymentRemoteRepository paymentRemoteRepository;

  Future<void> pay({required PaymentBody paymentBody}) async {
    emit(const PaymentState.loading());

    final result = await paymentRemoteRepository.payWithCard(body: paymentBody);

    result.fold(
      (failure) => emit(PaymentState.error(failure)),
      (response) async {
        emit(PaymentState.loaded(response));
        await presentPaymentSheet(response);
      },
    );
  }

  Future<void> presentPaymentSheet(PaymentResponseModel response) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: response.clientSecret,
          merchantDisplayName: "YourMerchantName",
        ),
      );
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e.toString());
      emit(PaymentState.error(GeneralFailure(errMessage: e.toString())));
    }
  }
}

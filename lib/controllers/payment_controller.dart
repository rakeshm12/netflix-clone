
import 'package:get/get.dart';
import 'package:netflix_ui/views/widgets/payment_success.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {

  final Razorpay _razorPay = Razorpay();

  @override
  void onInit() {
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }



  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Get.to(const PaymentSuccess());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.snackbar("Error !", "Something went wrong... Try again after some time");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }


  void addCheckout() {
    var options = {
      'key': 'rzp_test_yRwq76qnJF4mhY',
      'amount': 14900, //in the smallest currency sub-unit.
      'name': 'Netflix',
      'description': 'Mobile',
      'timeout': 300, // in seconds
      'prefill': {
        'contact': '9135456454',
        'email': 'sample@email.com'
      }
    };

    try {
      _razorPay.open(options);
    } catch (e) {
       throw Exception('Something wrong');
    }
  }
  @override
  void dispose() {
    _razorPay.clear();
    super.dispose();
  }

}

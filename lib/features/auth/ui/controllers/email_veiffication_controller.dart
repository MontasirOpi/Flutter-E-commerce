import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/services/newwork_calller/network_caller.dart';
import 'package:get/get.dart';

class EmailVeifficationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> verifyEmail(String email) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(Urls.verifyEmailUrl(email));
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}

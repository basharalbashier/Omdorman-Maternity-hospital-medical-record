import 'package:aldayat_screens/models/get_request.dart';
import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }

  RxList users = [{"id":70,"name":"omer",},{}].obs;

  getUsers(user, context) async {
    await getIt('', user, context, '').then((value) => users = value.obs);
  }
}

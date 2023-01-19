import 'package:aldayat_screens/models/get_request.dart';
import 'package:get/get.dart';

class SimpleUIController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }

  RxList users = [
    {
      "id": 70,
      "name": "omer",
    },
  ].obs;

  getUsers(user, context) async {
    await getIt('user', user, context, '0')
        .then((value) => {users.clear(), users = value.obs});
  }
}

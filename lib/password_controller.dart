import 'package:flutter_test_practice/album_model.dart';
import 'package:flutter_test_practice/api_provider.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  ApiProvider apiProvider = Get.put(ApiProvider());
  RxBool passwordVisble = false.obs;
  RxList albumList = [].obs;
  RxBool isLoading = false.obs;

  showPassword() {
    if (passwordVisble.value == false) {
      passwordVisble(true);
    } else {
      passwordVisble(false);
    }
  }

 Future<void> getAlbumData() async {
    isLoading.value = true;
    var list = await apiProvider.fetchAlbum();
    albumList(list);
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   // getAlbumData();
  }
}

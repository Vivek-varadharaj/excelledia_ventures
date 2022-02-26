
// external library- for making api calls
import 'package:get/get.dart';

class GetImagesServices extends GetConnect {

  // function for getting data from the back end
  Future<dynamic> getImages(String url) async {
    try {
      dynamic response = await get(url);
      return response.body["hits"];
    } catch (e) {
      return false;
    }
  }
}

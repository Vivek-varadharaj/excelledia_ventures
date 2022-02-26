import 'package:get/get.dart';

class GetImagesServices extends GetConnect {
  Future<dynamic> getImages(String url) async {
    try {
      dynamic response = await get(url);
      return response.body["hits"];
    } catch (e) {
      return [];
    }
  }
}

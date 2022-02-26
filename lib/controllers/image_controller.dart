import 'package:excelledia_ventures/configs/configs.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/network_services/get_images_service.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  List<ImageModel>? image = [];

  final GetImagesServices? _getImagesServices = GetImagesServices();

  fetchImages(String searchTerm, int index) async {
    String url =
        Configs.baseUrl + "&key=" + Configs.appApiKey + "&q=" + searchTerm;

    List result = await _getImagesServices!.getImages(url);

    List<ImageModel> firstrResult =
        (result.map((url) => ImageModel.fromJson(url))).toList();
    image = [...image!, ...firstrResult];

    print(image);
    update();
  }
}

import 'package:excelledia_ventures/configs/configs.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/network_services/get_images_service.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  List<ImageModel>? image = [];

  final GetImagesServices? _getImagesServices = GetImagesServices();

  fetchImages(String searchTerm) async {
    String url = Configs.fetchImageUrl + searchTerm;

    List result = await _getImagesServices!.getImages(url);

    image = (result.map((url) => ImageModel.fromJson(url))).toList();
    print(image);
    update();
  }
}

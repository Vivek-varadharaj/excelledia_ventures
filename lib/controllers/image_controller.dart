import 'package:excelledia_ventures/configs/configs.dart';
import 'package:excelledia_ventures/models/image_model.dart';
import 'package:excelledia_ventures/network_services/get_images_service.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  List<ImageModel> image = [];
  String previousSearchTerm = "";
  int previousIndex = 0;
  bool isLoading = false;

  final GetImagesServices? _getImagesServices = GetImagesServices();

  fetchImages(String searchTerm, int index) async {
    String url = Configs.baseUrl +
        "&page=$index" +
        "&key=" +
        Configs.appApiKey +
        "&q=" +
        searchTerm;
// checks search term is empty or not. if it is not empty we make a call
    if (searchTerm.isNotEmpty &&
        (previousSearchTerm != searchTerm || previousIndex != index)) {
      isLoadingChangerToTrue();
      previousSearchTerm = searchTerm;

      List result = await _getImagesServices!.getImages(url);

      List<ImageModel> firstrResult =
          (result.map((url) => ImageModel.fromJson(url))).toList();
      image = [...image, ...firstrResult];
      isLoadingChangerToFalse();

      update();
      print(isLoading);
      print(image);
    } else if (previousIndex == index || previousSearchTerm != searchTerm) {}
  }

  isLoadingChangerToTrue() {
    print("called");
    isLoading = true;
    update();
  }

  isLoadingChangerToFalse() {
    print("called");
    isLoading = false;
    update();
  }
}

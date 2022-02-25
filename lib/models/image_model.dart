class ImageModel {
  String url;

  ImageModel({required this.url});
  factory ImageModel.fromJson(Map<String, dynamic> data) {
    return ImageModel(url: data["userImageURL"]);
  }
}

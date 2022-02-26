class ImageModel {
  String previewUrl;
  String largeImageUrl;

  ImageModel({
    required this.previewUrl, required this.largeImageUrl
  });
  factory ImageModel.fromJson(Map<String, dynamic> data) {
    return ImageModel(previewUrl: data["previewURL"], largeImageUrl: data["largeImageURL"]);
  }
}

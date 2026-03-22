class FeaturedBannerModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  final bool isSvg;

  const FeaturedBannerModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.isSvg = false,
  });
}

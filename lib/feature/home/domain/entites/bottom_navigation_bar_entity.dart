import 'package:fruit_hub/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeItem;
  final String inActiveItem;
  final String name;

  BottomNavigationBarEntity({
    required this.activeItem,
    required this.inActiveItem,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
  BottomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldHome,
    inActiveItem: Assets.imagesVuesaxOtlineHome,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldProducts,
    inActiveItem: Assets.imagesVuesaxOtlineProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldShoppingCart,
    inActiveItem: Assets.imagesVuesaxOtlineShoppingCart,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeItem: Assets.imagesVuesaxBoldUser,
    inActiveItem: Assets.imagesVuesaxOtlineUser,
    name: 'حسابي',
  ),
];

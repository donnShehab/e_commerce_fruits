import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/helper_functions/showSuccessSnackBar.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/reviews_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _buildHeroSection(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
                      child: Column(
                        children: [
                          _buildInfoAndQuantitySection(context),
                          const SizedBox(height: 20),
                          _buildDescriptionSection(),
                          const SizedBox(height: 22),
                          _buildFeaturesGrid(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: CustomButton(
                text: 'أضف إلى السلة',
                onPressed: () {
                  context.read<CartCubit>().addProduct(widget.product);
                  showSuccessSnackBar(context, 'تم إضافة المنتج إلى السلة');
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('تم إضافة المنتج إلى السلة')),
                  // );
                },
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 54, 24, 20),
              child: CachedNetworkImage(
                imageUrl:
                    widget.product.imageUrl ??
                    'https://via.placeholder.com/400x400?text=Product',
                fit: BoxFit.contain,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: _buildTopIconButton(
              icon: Icons.share_outlined,
              onTap: () {},
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: _buildTopIconButton(
              icon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.94),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black87, size: 20),
      ),
    );
  }

  Widget _buildInfoAndQuantitySection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildQuantitySelector(),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.product.name,
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bold28.copyWith(
                  color: const Color(0xFF111111),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.product.price} دينار / الكيلو',
                textAlign: TextAlign.right,
                style: TextStyles.bold16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 4,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReviewsView(productId: widget.product.id),
                        ),
                      );
                    },
                    child: Text(
                      'المراجعات',
                      style: TextStyles.regular16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const Icon(Icons.star_rounded, color: Colors.amber, size: 19),
                  Text(
                    '4.5',
                    style: TextStyles.bold16.copyWith(
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  Text(
                    '(+30)',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF9A9A9A),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8F1),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF1E5D8), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQuantityButton(
            icon: Icons.add,
            backgroundColor: AppColors.primaryColor,
            iconColor: Colors.white,
            onTap: incrementQuantity,
          ),
          const SizedBox(width: 12),
          Text(
            quantity.toString(),
            style: TextStyles.bold19.copyWith(color: const Color(0xFF1A1A1A)),
          ),
          const SizedBox(width: 12),
          _buildQuantityButton(
            icon: Icons.remove,
            backgroundColor: const Color(0xFFF0F0F0),
            iconColor: AppColors.primaryColor,
            onTap: decrementQuantity,
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              if (widget.product.description.trim().isNotEmpty) ...[
                Text(
                  'وصف المنتج',
                  style: TextStyles.bold16.copyWith(
                    color: const Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
          SizedBox(height: 6),
          Text(
            widget.product.description,
            textAlign: TextAlign.right,
            style: TextStyles.regular16.copyWith(
              color: const Color(0xFF707070),
              height: 1.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.18,
      children: [
        _buildFeatureCard(Assets.imagesCalendar, 'عام', 'الصلاحية'),
        _buildFeatureCard(Assets.imagesLotus, '100%', 'أورجانيك'),
        _buildFeatureCard(Assets.imagesGroup36850, '80 كالوري', '100 جرام'),
        _buildFeatureCard(Assets.imagesGroup36850, '4.8', '256 مراجعة'),
      ],
    );
  }

  Widget _buildFeatureCard(String assetName, String header, String subText) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6EE),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF1E7DB), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetName,
              width: 30,
              height: 30,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error_outline,
                  size: 24,
                  color: Colors.grey,
                );
              },
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyles.bold13.copyWith(
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subText,
                  style: TextStyles.regular11.copyWith(
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

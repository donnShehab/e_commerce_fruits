import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
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
  int quantity = 1; // Default as per example

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    // add logic here mmm cubit, add quantity update if needed
    // context.read<CartCubit>().updateQuantity(widget.product, quantity);
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
    // add logic here mmm cubit, add quantity update if needed
    // context.read<CartCubit>().updateQuantity(widget.product, quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          // Forward arrow on right (RTL navigation)
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
            // add logic here mmm cubit, add image carousel navigation
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // add logic here mmm cubit, add share functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Subtle Overlay
              // Stack(
              //   children: [
              //     Container(
              //       height: 100,
              //       width: 70,
              //       decoration: BoxDecoration(
              //         color: Color(0xffF3F5F7),
              //         borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(32),
              //           bottomRight: Radius.circular(32),
              //         ),
              //         // gradient: LinearGradient(
              //         //   begin: Alignment.topCenter,
              //         //   end: Alignment.bottomCenter,
              //         //   colors: [
              //         //     Colors.transparent,
              //         //     Colors.white.withOpacity(0.3),
              //         //   ],
              //         // ),
              //       ),
              //       child: Container(
              //         height: 500,
              //         width: 500,
              //         decoration: BoxDecoration(
              //           // color: Color(0xFFF3F5F7),
              //           image: DecorationImage(
              //             image: widget.product.imageUrl != null
              //                 ? NetworkImage(widget.product.imageUrl!)
              //                 : AssetImage('assets/images/watermelon.png')
              //                       as ImageProvider, // Placeholder for Watermelon
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Container(
                height: 400, // Background height

                width: 400, // Background width
                decoration: BoxDecoration(
                  color: Color(0xFFF3F5F7), // Background color #F3F5F7
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      80,
                    ), // Border radius bottom left
                    bottomRight: Radius.circular(
                      80,
                    ), // Border radius bottom right
                  ),
                ),
                child: Center(
                  // Center the inner image container
                  child: Container(
                    height: 167, // Image height
                    width: 221, // Image width
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.product.imageUrl != null
                            ? NetworkImage(widget.product.imageUrl!)
                            : AssetImage('assets/images/watermelon.png')
                                  as ImageProvider, // Placeholder for Watermelon
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 500,
              //   child: Stack(
              //     children: [
              //       // Image with CachedNetworkImage for professional loading
              //       Positioned.fill(
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(30),

              //             bottomRight: Radius.circular(30),
              //           ),

              //           child: CachedNetworkImage(
              //             imageUrl:

              //                 widget.product.imageUrl ??
              //                 'https://via.placeholder.com/400x400?text=Watermelon', // Fallback URL

              //             placeholder: (context, url) => Center(
              //               child: CircularProgressIndicator(
              //                 color: AppColors.primaryColor,
              //               ),
              //             ),

              //             errorWidget: (context, url, error) => Center(
              //               child: Icon(
              //                 Icons.image_not_supported,
              //                 size: 50,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),

              //       // Subtle Gradient Overlay for Depth
              //       Positioned.fill(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             gradient: LinearGradient(
              //               begin: Alignment.topCenter,

              //               end: Alignment.bottomCenter,

              //               colors: [
              //                 Colors.transparent,
              //                 Colors.black.withOpacity(0.1),
              //               ],
              //             ),

              //             borderRadius: BorderRadius.only(
              //               bottomLeft: Radius.circular(30),

              //               bottomRight: Radius.circular(30),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name and Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name, // e.g., "بطيخ"
                            style: TextStyles.bold28.copyWith(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          quantity.toString(), // e.g., "4"
                          style: TextStyles.bold19,
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: incrementQuantity,
                          ),
                        ),
                        // Text(
                        //   '${widget.product.price} دينار / الكيلو', // e.g., "20 جنيه / الكيلو"
                        //   style: TextStyles.bold16.copyWith(
                        //     color: AppColors.primaryColor,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 12),
                    // Rating Summary
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${widget.product.price} دينار / الكيلو', // e.g., "20 جنيه / الكيلو"
                            style: TextStyles.bold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '(30+)', // e.g., "(30+)"
                              style: TextStyles.regular13.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '4.5', // e.g., "4.5"
                              style: TextStyles.bold16,
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            SizedBox(width: 8),

                            GestureDetector(
                              onTap: () {
                                // add logic here mmm cubit, add navigate to reviews page
                              },
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewsView(productId:widget.product.id,),
                                    ),
                                  );
                                },
                                child: Text.rich(
                                  
                                  TextSpan(
                                
                                    text: 'المراجعة',
                                    style: TextStyles.regular22.copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Product Description
                    Text(
                      widget
                          .product
                          .description, // e.g., Watermelon description
                      style: TextStyles.regular16.copyWith(
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 24),
                    // Quantity Selector
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //       Text(
                    //       '${widget.product.price} دينار / الكيلو', // e.g., "20 جنيه / الكيلو"
                    //       style: TextStyles.bold16.copyWith(
                    //         color: AppColors.primaryColor,
                    //       ),
                    //     ),
                    //     // Container(
                    //     //   width: 50,
                    //     //   height: 50,
                    //     //   decoration: BoxDecoration(
                    //     //     color: Colors.grey[200],
                    //     //     borderRadius: BorderRadius.circular(25),
                    //     //   ),
                    //     //   child: IconButton(
                    //     //     icon: Icon(
                    //     //       Icons.remove,
                    //     //       color: AppColors.primaryColor,
                    //     //     ),
                    //     //     onPressed: decrementQuantity,
                    //     //   ),
                    //     // ),
                    //     // SizedBox(width: 20),
                    //     // Text(
                    //     //   quantity.toString(), // e.g., "4"
                    //     //   style: TextStyles.bold19,
                    //     // ),
                    //     // SizedBox(width: 20),
                    //     // Container(
                    //     //   width: 50,
                    //     //   height: 50,
                    //     //   decoration: BoxDecoration(
                    //     //     color: AppColors.primaryColor,
                    //     //     borderRadius: BorderRadius.circular(25),
                    //     //   ),
                    //     //   child: IconButton(
                    //     //     icon: Icon(Icons.add, color: Colors.white),
                    //     //     onPressed: incrementQuantity,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    SizedBox(height: 32),
                    // Product Features Grid (3 columns, 2 rows)
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildFeatureCard(
                          Assets.imagesLotus,
                          '100%',
                          'أورجانيك',
                        ), // Organic
                        _buildFeatureCard(
                          Assets.imagesCalendar,
                          'عام',
                          'الصلاحية',
                        ), // Expiry
                        _buildFeatureCard(
                          Assets.imagesGroup368500,
                          '80 كالوري',
                          '100 جرام',
                        ), // Calories
                        _buildFeatureCard(
                          Assets.imagesGroup36850,
                          '4.8',
                          '(256) Reviews',
                        ), // Rating (duplicate for grid)
                        // Add more if needed, or leave empty
                        Container(), // Placeholder for 3x2 grid
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          text: 'أضف الى السلة',
          onPressed: () {
            context.read<CartCubit>().addProduct(widget.product);
            // add logic here mmm cubit, add to cart via CartCubit
            // context.read<CartCubit>().addToCart(widget.product, quantity);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('تم إضافة المنتج إلى السلة')),
            );
          },
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String assetName, String header, String subText) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  header,
                  style: TextStyles.bold13.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  subText,
                  style: TextStyles.regular11.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(width: 8),

            Image.asset(
              assetName,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error,
                  size: 40,
                  color: Colors.grey,
                ); // Fallback if asset missing
              },
            ),
          ],
        ),
      ),
    );
  }
}

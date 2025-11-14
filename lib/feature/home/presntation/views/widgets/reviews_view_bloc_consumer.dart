import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/review_cubit/review_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/review_cubit/review_state.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/reviews_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsViewBlocConsumer extends StatefulWidget {
  const ReviewsViewBlocConsumer({super.key, required this.productId});
  final String productId;

  @override
  State<ReviewsViewBlocConsumer> createState() =>
      _ReviewsViewBlocConsumerState();
}

class _ReviewsViewBlocConsumerState extends State<ReviewsViewBlocConsumer> {
  @override
  void initState() {
    super.initState();
    // Fetch reviews using getIt
    getIt<ReviewsCubit>().fetchReviews(widget.productId);
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewsCubit, ReviewsState>(
      bloc: getIt<ReviewsCubit>(), // Using getIt for cubit
      listener: (context, state) {
        // Handle side effects, e.g., show snackbar on add review
        if (state is ReviewsLoaded) {
          // Optional: Show success message if needed
        }
      },
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ReviewsError) {
          return Center(child: Text(state.message));
        } else if (state is ReviewsLoaded) {
          return ReviewsViewBody(
            productId: widget.productId,
            reviews: state.reviews,
            averageRating: state.averageRating,
            totalReviews: state.totalReviews,
            recommendedPercentage: state.recommendedPercentage,
          );
        }
        return Container(); // Fallback
      },
    );
  }
}

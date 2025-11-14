import 'package:e_coomerce_fruit/feature/home/presntation/cubits/review_cubit/review_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());

  // Dummy data for reviews (replace with Firestore fetch later)
  final List<Map<String, dynamic>> _dummyReviews = [
    {
      'name': 'Ahmed Amr',
      'date': '25/06/2020',
      'rating': 5.0,
      'text': 'منتج رائع جداً، أنصح به بشدة!',
    },
    {
      'name': 'Sara Ali',
      'date': '20/06/2020',
      'rating': 4.0,
      'text': 'جيد، لكن يمكن تحسين الجودة.',
    },
  ];

  void fetchReviews(String productId) {
    emit(ReviewsLoading());
    // Simulate API call delay
    Future.delayed(Duration(seconds: 1), () {
      // Calculate summary data
      double totalRating = _dummyReviews.fold(
        0.0,
        (sum, review) => sum + review['rating'],
      );
      double averageRating = totalRating / _dummyReviews.length;
      int totalReviews = _dummyReviews.length;
      double recommendedPercentage = 88.0; // Dummy value

      emit(
        ReviewsLoaded(
          reviews: _dummyReviews,
          averageRating: averageRating,
          totalReviews: totalReviews,
          recommendedPercentage: recommendedPercentage,
        ),
      );
    });
  }

  void addReview(String productId, String text, double rating) {
    // Add to dummy data (replace with Firestore add later)
    _dummyReviews.add({
      'name': 'المستخدم الحالي', // Replace with actual user name
      'date': DateTime.now().toString().substring(0, 10), // e.g., '2023-10-01'
      'rating': rating,
      'text': text,
    });
    // Re-fetch to update state
    fetchReviews(productId);
  }

  void deleteReview(String productId, int reviewIndex) {
    // Remove from dummy data (replace with Firestore delete later)

    if (reviewIndex >= 0 && reviewIndex < _dummyReviews.length) {
      _dummyReviews.removeAt(reviewIndex);

      // Re-fetch to update state

      fetchReviews(productId);
    }
  }
}

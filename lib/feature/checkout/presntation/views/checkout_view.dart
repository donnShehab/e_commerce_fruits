// import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
// import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo.dart';
// import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
// import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
// import 'package:e_coomerce_fruit/feature/checkout/domain/entites/shipping_Address_entity.dart';
// import 'package:e_coomerce_fruit/feature/checkout/presntation/add_order_cubit/add_order_cubit.dart';
// import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/add_order_cubit_bloc_builder.dart';
// import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_view_body.dart';
// import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_entity.dart';
// import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class CheckoutView extends StatefulWidget {
//   const CheckoutView({super.key, required this.cartEntity});
//   final CartEntity cartEntity;

//   @override
//   State<CheckoutView> createState() => _CheckoutViewState();
// }

// class _CheckoutViewState extends State<CheckoutView> {
//   late OrderInputEntity orderEntity;
//   @override
//   void initState() {
//     orderEntity = OrderInputEntity(
//       widget.cartEntity,
//       uId: getUser().uId,
//       shippingAddressEntity: ShippingAddressEntity(),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
//       child: Scaffold(
//         appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
//         body: Provider.value(
//           value: orderEntity,
//           child: AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
//         ),
//       ),
//     );
//   }
// }
import 'package:e_coomerce_fruit/core/helper_functions/get_user.dart';
import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/shipping_Address_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/add_order_cubit/add_order_cubit.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_view_body.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(
      widget.cartEntity,
      uId: getUser().uId,
      shippingAddressEntity: ShippingAddressEntity(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}

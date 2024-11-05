// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:nectar/src/data/models/order.dart' as order_model;
// import 'package:nectar/src/data/models/order.dart';
// import 'package:nectar/src/data/models/product.dart' as product_model;
// import 'package:nectar/src/data/models/user.dart' as user_model;
// import 'package:nectar/src/data/services/firebase_firestore_service.dart';

// // class OrdersInfoRepository {
// //   // fetch user's orders
// //   Future<List<Order>> fetchFavorites() async {
// //     final firestore = FirebaseFirestoreService();
// //     final user_model.User user = Hive.box('myBox').get('user');
// //     final order_model.Order order = Hive.box('myBox').get('product');
// //     final List<dynamic>? orderProducts = order.products; //reference


  

// //     // get products from references
// //     final List<Order> products = [];
// //     for (var orderProduct in orderProducts!) {
// //       final product = await firestore.getDocument(
// //         collection: 'orders',
// //         documentId: orderProduct.id,
// //       );
// //       products.add(Order.fromMap(product.data() as Map<String, dynamic>)
// //           .copyWith(id: product.id));
// //     }

// //     return products;

    
// //   }

//   Future<void> CreateOrder() async {
//     // UserCredential userCredential = await _authService.signInWithGoogle();
//     //     final firestore = FirebaseFirestoreService();
//     //     final user_model.User user = Hive.box('myBox').get('user');
//     //     final order_model.Order order = Hive.box('myBox').get('product');
//     //     final List<dynamic>? orderProducts = order.products; //reference
//     //     final List<Order> products = [];
//     // for (var orderProduct in orderProducts!) {
//     //   final product = await firestore.getDocument(
//     //     collection: 'orders',
//     //     documentId: orderProduct.id,
//     //   );
//     //   products.add(Order.fromMap(product.data() as Map<String, dynamic>)
//     //       .copyWith(id: product.id));
//     // }


//     try {
//       // get user data from firestore
//        final firestore = FirebaseFirestoreService();
//         final user_model.User user = Hive.box('myBox').get('user');
//         final order_model.Order order = Hive.box('myBox').get('product');
//         final List<dynamic>? orderProducts = order.products; //reference
//         final List<Order> products = [];
//     for (var orderProduct in orderProducts!) {
//       final product = await firestore.getDocument(
//         collection: 'orders',
//         documentId: orderProduct.id,
//       );
//       products.add(Order.fromMap(product.data() as Map<String, dynamic>)
//           .copyWith(id: product.id));
//     };
      

        
        
      
//       // convert to model
//       // final user = user_model.User.fromMap(
//       //     snapshot.docs.first.data() as Map<String, dynamic>);

//       // save to hive
//       await Hive.box('myBox').put('user', user);
//     } catch (e) {
//       // user not found, create new user

//       order_model.Order order = order_model.Order(
//         id: Hive.box('myBox').get('user').displayName ?? '',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(), 
//         phoneTelegram: Hive.box('myBox').get('orders').phoneTelegram ?? '',
//         phoneWhatsApp: Hive.box('myBox').get('orders').phoneWhatsApp ?? '',
//         store: Hive.box('myBox').get('orders').store ?? '',
//         user: Hive.box('myBox').get('orders').user ?? '',
//         products: Hive.box('myBox').get('orders').products ?? const [],
//       );

//       // save to firestore
//       await FirebaseFirestoreService().addDocument(
//         'orders',
//         order.toMap(),
//       );
//       // save to hive
//       await Hive.box('myBox').put('orders', order);
//     }
//   }


// // class FavoritesRepository {
// //   // fetch user's favorite products
// //   Future<List<Product>> fetchFavorites() async {
// //     final firestore = FirebaseFirestoreService();
// //     final user_model.User user = Hive.box('myBox').get('user');
// //     final List? favoriteProducts = user.favoriteProducts; //reference

// //     // get products from references
// //     final List<Product> products = [];
// //     for (var favoriteProduct in favoriteProducts!) {
// //       final product = await firestore.getDocument(
// //         collection: 'products',
// //         documentId: favoriteProduct.id,
// //       );
// //       products.add(Order.fromMap(product.data() as Map<String, dynamic>)
// //           .copyWith(id: product.id));
// //     }

// //     return products;
// //   }
// // }

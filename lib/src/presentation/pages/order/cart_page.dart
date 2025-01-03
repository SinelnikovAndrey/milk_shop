import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nectar/src/bloc/product/product_bloc.dart';

import 'package:nectar/src/data/models/order_product.dart';
import 'package:nectar/src/data/repositories/product_repository.dart';
import 'package:nectar/src/presentation/utils/app_colors.dart';
import 'package:nectar/src/presentation/utils/helpers.dart';
import 'package:nectar/src/presentation/widgets/buttons/default_button.dart';
import 'package:nectar/src/presentation/widgets/buttons/round_button.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(
    text: Hive.box('myBox').get('user').displayName,
  );
  final _emailController = TextEditingController(
    text: Hive.box('myBox').get('user').email,
  );
  // final _phoneController = TextEditingController(
  //   text: Hive.box('myBox').get('user').phoneNumber,
  // );



  bool ignoring = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'My Cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: DefaultButton(
              text: 'Checkout',
              onTap: () {},
              trailing: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                color: AppColors.primaryDark,
                child: Text(
                  '\$${ProductRepository.getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(
                  color: AppColors.lightBorderGray,
                ),
                if (ProductRepository.cart.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 30,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: AppColors.lightGray,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Your cart is empty',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Looks like you haven\'t added\nanything to your cart yet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.lightGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ProductRepository.cart.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      orderProduct: ProductRepository.cart[index],
                    );
                  },
                ),
                Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  const Text(
                    'Имя',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Адрес',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      } else if (!isValidEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Номер телефона(Telegram)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // TextFormField(
                  //   controller: _phoneTelegramController,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Enter your phone number',
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.trim().isEmpty) {
                  //       return 'Please enter your phone number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 16),
                  const Text(
                    'Номер телефона(WhatsApp)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // TextFormField(
                  //   controller: _phoneWhatsAppController,
                  //   decoration: const InputDecoration(
                  //     hintText: 'Enter your phone number',
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.trim().isEmpty) {
                  //       return 'Please enter your phone number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                ],
              ),
            ),
                // const OrderDetails(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CartItem extends StatelessWidget {
  final OrderProduct orderProduct;

  const CartItem({super.key, required this.orderProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          if (orderProduct.product.images == null ||
              orderProduct.product.images!.isEmpty)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.inventory,
                size: 40,
                color: AppColors.primary,
              ),
            )
          else
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    orderProduct.product.images!.first,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  orderProduct.product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // unit
                Text(
                  '1 ${orderProduct.product.unit.name}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGray,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    RoundButton(
                      icon: Icons.remove,
                      onTap: () {
                        // remove 1 item from cart
                        context.read<ProductBloc>().add(
                              UpdateCart(
                                orderProduct: orderProduct,
                                quantity: orderProduct.quantity - 1,
                              ),
                            );
                      },
                      backgroundColor: Colors.transparent,
                      iconColor: AppColors.gray,
                      borderColor: AppColors.darkBorderGray,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${orderProduct.quantity} ${orderProduct.product.unit.name}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    RoundButton(
                      icon: Icons.add,
                      onTap: () {
                        // add 1 item to cart
                        context.read<ProductBloc>().add(
                              UpdateCart(
                                orderProduct: orderProduct,
                                quantity: orderProduct.quantity + 1,
                              ),
                            );
                      },
                      backgroundColor: Colors.transparent,
                      iconColor: AppColors.primary,
                      borderColor: AppColors.darkBorderGray,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // close icon button
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  tooltip: 'Close',
                  onPressed: () {
                    // remove item from cart
                    context.read<ProductBloc>().add(
                          UpdateCart(
                            orderProduct: orderProduct,
                            quantity: 0,
                          ),
                        );
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.lightGray,
                  ),
                ),
                // price
                Text(
                  '\$${(orderProduct.product.price * orderProduct.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

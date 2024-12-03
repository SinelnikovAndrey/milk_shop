import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/src/presentation/utils/app_colors.dart';
import 'package:nectar/src/presentation/utils/app_router.dart';
import 'package:nectar/src/presentation/utils/assets.dart';
import 'package:nectar/src/presentation/utils/helpers.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // after 1 seconds, navigate to onboarding page
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(
        context,
        isUserRegistered() ? AppRouter.homeRoute : AppRouter.onboardingRoute,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(width: 200, height: 200,
              child: Image.asset(
                PngAssets.logo,
              ),),
            const SizedBox(width: 18),
            const Text(
              'Ферма',
              style: TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Машининых',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

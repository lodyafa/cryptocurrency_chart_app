import 'package:flutter/material.dart';

class RouteErrorScreen extends StatelessWidget {
  const RouteErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              size: 160,
            ),
            const SizedBox(height: 20),
            const Text("Ooops, something went worng"),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {},
              child: const Text("Go home"),
            )
          ],
        ),
      ),
    );
  }
}
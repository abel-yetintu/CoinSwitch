import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ConversionRateLoadingTile extends StatelessWidget {
  const ConversionRateLoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image(
                  image: const NetworkImage('https://flagsapi.com/ET/flat/64.png'),
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Code'),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  const Text('Currency name'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:coin_switch/controllers/home_screen_controller.dart';
import 'package:coin_switch/shared/enums.dart';
import 'package:coin_switch/widgets/conversion_rate_loading_tile.dart';
import 'package:coin_switch/widgets/conversion_rate_tile.dart';
import 'package:coin_switch/widgets/custom_drop_down.dart';
import 'package:coin_switch/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late TextEditingController _amountTextEditingController;

  @override
  void initState() {
    super.initState();
    _amountTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _amountTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var homeScreenState = ref.watch(homeScreenControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.height * 0.05,
            MediaQuery.of(context).size.width * 0.05,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('From'),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        homeScreenState.currencies.when(
                          loading: () => const CircularProgressIndicator(),
                          error: (error, stackTrace) {
                            return GestureDetector(
                              onTap: () {
                                ref.read(homeScreenControllerProvider.notifier).fetchCurrencies();
                              },
                              child: const Text('Retry.'),
                            );
                          },
                          data: (data) {
                            return CustomDropdown(
                              items: data,
                              onChanged: (value) {
                                ref.read(homeScreenControllerProvider.notifier).changeBaseCurrency(value);
                              },
                              selectedItem: homeScreenState.baseCurrency,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: const FaIcon(FontAwesomeIcons.arrowRightArrowLeft),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('To'),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        homeScreenState.currencies.when(
                          loading: () => const CircularProgressIndicator(),
                          error: (error, stackTrace) {
                            return GestureDetector(
                              onTap: () {
                                ref.read(homeScreenControllerProvider.notifier).fetchCurrencies();
                              },
                              child: const Text('Retry.'),
                            );
                          },
                          data: (data) {
                            return CustomDropdown(
                              items: data,
                              onChanged: (value) {
                                ref.read(homeScreenControllerProvider.notifier).changeTargetCurrency(value);
                              },
                              selectedItem: homeScreenState.targetCurrency,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Card(
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Amount'),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      CustomTextField(
                        baseCode: homeScreenState.baseCurrency,
                        textEditingController: _amountTextEditingController,
                        onChanged: (value) {
                          ref.read(homeScreenControllerProvider.notifier).changeAmount(value);
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: homeScreenState.currencyConversion.when(
                            loading: () => null,
                            error: (error, stackTrace) => () {
                              ref.read(homeScreenControllerProvider.notifier).convertCurrency();
                            },
                            data: (data) => () {
                              ref.read(homeScreenControllerProvider.notifier).convertCurrency();
                            },
                          ),
                          child: const Text('Convert'),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          const Text(
                            'Converted Amount:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                              child: homeScreenState.currencyConversion.when(
                                  loading: () => const Skeletonizer(
                                        enabled: true,
                                        child: Text('Converted Currency'),
                                      ),
                                  error: (error, stackTrace) => Text(
                                        error.toString(),
                                        maxLines: 1,
                                      ),
                                  data: (data) {
                                    if (data?.conversionResult != null && data?.targetCode != null) {
                                      return Text(
                                        '${data?.conversionResult} ${data?.targetCode}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                                      );
                                    } else {
                                      return const Text('');
                                    }
                                  })),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          const Text(
                            'Conversion Rate:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                              child: homeScreenState.currencyConversion.when(
                            loading: () => const Skeletonizer(
                              enabled: true,
                              child: Text('Conversion Rate'),
                            ),
                            error: (error, stackTrace) => Text(
                              error.toString(),
                              maxLines: 1,
                            ),
                            data: (data) => Text(
                              data?.conversionRate.toString() ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Conversion Rates',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    homeScreenState.conversionRates.when(
                      loading: () {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => const ConversionRateLoadingTile(),
                          ),
                        );
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      data: (data) {
                        if (data != null) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: Currency.values.length,
                              itemBuilder: (context, index) {
                                final rate = data.conversionRates[Currency.values[index].name] ?? 0;
                                return ConversionRateTile(
                                  currency: Currency.values[index],
                                  rate: rate,
                                  baseCurrency: data.baseCode,
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

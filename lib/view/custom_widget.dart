import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:statemanazment/main.dart';
import 'package:statemanazment/state.dart/actions.dart';
import 'package:statemanazment/state.dart/state.dart';

class ResponsiveAppBarTitle extends StatelessWidget {
  const ResponsiveAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Text(
        'Responsive AppBar',
        style: TextStyle(
          fontSize: screenWidth < 600
              ? 16
              : screenWidth < 1000
                  ? MediaQuery.sizeOf(context).width * 0.03
                  : MediaQuery.sizeOf(context).width * 0.02,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ResponsiveContainer extends StatefulWidget {
  const ResponsiveContainer({super.key});

  @override
  ResponsiveContainerState createState() => ResponsiveContainerState();
}

class ResponsiveContainerState extends State<ResponsiveContainer> {
  bool switchs = true;
  late ExchangeBlock firstValue;
  late ExchangeBlock secondValue;

  FormGroup firstFormGroup = FormGroup({
    'amount': FormControl<double>(),
    'currency': FormControl<String>(validators: [Validators.required], value: 'USD'),
  });

  FormGroup secondFormGroup = FormGroup({
    'amount': FormControl<double>(),
    'currency': FormControl<String>(validators: [Validators.required], value: 'EUR'),
  });

  @override
  void initState() {
    super.initState();
    firstValue = ExchangeBlock(
      currentSwitch: true,
      formulare: firstFormGroup,
    );
    secondValue = ExchangeBlock(
      currentSwitch: false,
      formulare: secondFormGroup,
    );

    firstFormGroup.control('amount').valueChanges.listen((value) => firstListener(value, true));

    secondFormGroup.control('amount').valueChanges.listen((value) => firstListener(value, false));
  }

  firstListener(value, isFirst) async {
    if (isFirst) {
      if (value == store.state.secAmount) return;
    } else {
      if (value == store.state.amount) return;
    }

    if (value != null) {
      await StoreProvider.dispatch<AppState>(
        context,
        SetAmountAction(value, isFirst),
      );
    }

    print(store.state.amount);

    if (isFirst) {
      secondFormGroup.control('amount').patchValue(store.state.secAmount);
    } else {
      firstFormGroup.control('amount').patchValue(store.state.amount);
    }
  }

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, FetchExchangeRatesAction());
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          /*firstValue = ExchangeBlock(
            key: ValueKey('first'),
            currentSwitch: true,
            formulare: FormGroup({
              'firExchangeValue': FormControl<double>(value: state.amount),
              'secExchangeValue': FormControl<double>(value: state.secAmount),
              'dropdownFrom': FormControl<String>(validators: [Validators.required], value: state.fromCurrency),
              'dropdownTo': FormControl<String>(validators: [Validators.required], value: state.toCurrency),
            }),
          );

          secondValue = ExchangeBlock(
            key: ValueKey('second'),
            currentSwitch: false,
            formulare: FormGroup({
              'firExchangeValue': FormControl<double>(value: state.amount),
              'secExchangeValue': FormControl<double>(value: state.secAmount),
              'dropdownFrom': FormControl<String>(validators: [Validators.required], value: state.fromCurrency),
              'dropdownTo': FormControl<String>(validators: [Validators.required], value: state.toCurrency),
            }),
          );*/

          final mediaQuery = MediaQuery.of(context);
          double breakpoint = 700;

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: mediaQuery.size.width < breakpoint
                        ? mediaQuery.size.width * 0.90
                        : mediaQuery.size.width * 0.80,
                    height: mediaQuery.size.width < breakpoint
                        ? mediaQuery.size.height * 0.90
                        : mediaQuery.size.height * 0.35,
                    padding: EdgeInsets.all(mediaQuery.size.width * 0.01),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color.fromARGB(184, 0, 0, 0),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(255, 255, 255, 0.725),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Flex(
                      direction: mediaQuery.size.width < breakpoint ? Axis.vertical : Axis.horizontal,
                      children: [
                        Expanded(flex: 1, child: switchs ? firstValue : secondValue),
                        SizedBox(width: mediaQuery.size.width * 0.01),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              switchs = !switchs;
                            });
                          },
                          icon: Icon(
                            switchs ? Icons.arrow_circle_right : Icons.arrow_circle_left,
                            color: Colors.black,
                            size: mediaQuery.size.width * 0.05,
                            semanticLabel: 'Switch Blocks',
                          ),
                        ),
                        SizedBox(width: mediaQuery.size.width * 0.01),
                        Expanded(flex: 1, child: switchs ? secondValue : firstValue),
                      ],
                    )),
                if (kDebugMode) ...[
                  Text(firstFormGroup.rawValue.toString()),
                  Text(secondFormGroup.rawValue.toString()),
                  Text(store.state.toString()),
                ],
              ],
            ),
          );
        });
  }
}

class ExchangeBlock extends StatefulWidget {
  final FormGroup formulare;
  final bool currentSwitch;

  const ExchangeBlock({
    super.key,
    required this.formulare,
    required this.currentSwitch,
  });

  @override
  ExchangeBlockState createState() => ExchangeBlockState();
}

class ExchangeBlockState extends State<ExchangeBlock> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, viewModel) {
          return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color.fromARGB(184, 0, 0, 0),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReactiveForm(
                  formGroup: widget.formulare,
                  child: Column(
                    children: [
                      textFileForm(),
                      const SizedBox(
                        height: 16,
                      ),
                      dropdownForm(),
                      controlText(),
                      secControlText()
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget textFileForm() {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return ReactiveTextField<double>(
            formControlName: "amount",
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Enter Number',
              border: OutlineInputBorder(),
            ),
          );
        });
  }

  Widget dropdownForm() {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          final dropdownItems = state.exchangeRates.rate.entries
              .map((entry) => DropdownMenuItem<String>(
                    value: entry.key.toString(),
                    child: Text(entry.key),
                  ))
              .toList();
          return ReactiveDropdownField<String>(
            formControlName: 'currency',
            hint: const Text('Select payment...'),
            items: dropdownItems,
            onChanged: (control) {
              widget.currentSwitch
                  ? StoreProvider.dispatch<AppState>(
                      context,
                      SetCurrencyAction(
                        fromCurrency: control.value.toString(),
                      ),
                    )
                  : StoreProvider.dispatch<AppState>(
                      context,
                      SetCurrencyAction(
                        toCurrency: control.value.toString(),
                      ),
                    );
            },
            decoration: const InputDecoration(
              labelText: 'Currency',
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
          );
        });
  }

  Widget controlText() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Text(
          'form: ${widget.formulare.control('amount').value} ',
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }

  Widget secControlText() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return Text(
          'state: ${state.amount} / ${state.secAmount} ',
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}

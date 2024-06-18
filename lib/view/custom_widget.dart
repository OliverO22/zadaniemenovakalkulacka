import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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

  @override
  void initState() {
    super.initState();
    firstValue = ExchangeBlock(
      currentSwitch: true,
      formulare: FormGroup({
        'firExchangeValue': FormControl<double>(),
        'secExchangeValue': FormControl<double>(),
        'dropdownFrom': FormControl<String>(validators: [Validators.required]),
        "dropdownTo": FormControl<String>(validators: [Validators.required]),
      }),
    );
    secondValue = ExchangeBlock(
      currentSwitch: false,
      formulare: FormGroup({
        'firExchangeValue': FormControl<double>(),
        'secExchangeValue': FormControl<double>(),
        'dropdownFrom': FormControl<String>(validators: [Validators.required]),
        'dropdownTo': FormControl<String>(validators: [Validators.required]),
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, FetchExchangeRatesAction());
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          firstValue = ExchangeBlock(
            currentSwitch: true,
            formulare: FormGroup({
              'firExchangeValue': FormControl<double>(value: state.amount),
              'secExchangeValue': FormControl<double>(value: state.secAmount),
              'dropdownFrom': FormControl<String>(
                  validators: [Validators.required], value: state.fromCurrency),
              'dropdownTo': FormControl<String>(
                  validators: [Validators.required], value: state.toCurrency),
            }),
          );

          secondValue = ExchangeBlock(
            currentSwitch: false,
            formulare: FormGroup({
              'firExchangeValue': FormControl<double>(value: state.amount),
              'secExchangeValue': FormControl<double>(value: state.secAmount),
              'dropdownFrom': FormControl<String>(
                  validators: [Validators.required], value: state.fromCurrency),
              'dropdownTo': FormControl<String>(
                  validators: [Validators.required], value: state.toCurrency),
            }),
          );

          return Container(
              width: MediaQuery.of(context).size.width < 700
                  ? MediaQuery.of(context).size.width * 0.90
                  : MediaQuery.of(context).size.width * 0.80,
              height: MediaQuery.of(context).size.width < 700
                  ? MediaQuery.of(context).size.height * 0.90
                  : MediaQuery.of(context).size.height * 0.35,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
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
              child: MediaQuery.of(context).size.width < 700
                  ? Column(
                      children: [
                        switchs
                            ? Expanded(flex: 1, child: firstValue)
                            : Expanded(flex: 1, child: secondValue),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        IconButton(
                          onPressed: () {
                            switchs = !switchs;
                          },
                          icon: Icon(
                            switchs
                                ? Icons.arrow_circle_right
                                : Icons.arrow_circle_left,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.width * 0.05,
                            semanticLabel: 'Switch Blocks',
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        switchs
                            ? Expanded(flex: 1, child: secondValue)
                            : Expanded(flex: 1, child: firstValue),
                      ],
                    )
                  : Row(
                      children: [
                        switchs
                            ? Expanded(flex: 1, child: firstValue)
                            : Expanded(flex: 1, child: secondValue),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        IconButton(
                          onPressed: () {
                            switchs = !switchs;
                          },
                          icon: Icon(
                            switchs
                                ? Icons.arrow_circle_right
                                : Icons.arrow_circle_left,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.width * 0.05,
                            semanticLabel: 'Switch Blocks',
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        switchs
                            ? Expanded(flex: 1, child: secondValue)
                            : Expanded(flex: 1, child: firstValue),
                      ],
                    ));
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
            formControlName:
                widget.currentSwitch ? "firExchangeValue" : "secExchangeValue",
            keyboardType: TextInputType.number,
            onChanged: (control) {
              double? value = control.value;

              if (value != null) {
                StoreProvider.dispatch<AppState>(
                  context,
                  SetAmountAction(value, widget.currentSwitch),
                );
              }
            },
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
            formControlName:
                widget.currentSwitch ? "dropdownFrom" : "dropdownTo",
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
        return widget.currentSwitch
            ? Text(
                '"Hodnota ktorá by mala byť v druhom okne: ${widget.formulare.control('secExchangeValue').value} ',
                style: const TextStyle(fontSize: 20),
              )
            : Text(
                '"Hodnota ktoá by mala byť v prvom okne: ${widget.formulare.control('firExchangeValue').value} ',
                style: const TextStyle(fontSize: 20),
              );
      },
    );
  }

  Widget secControlText() {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return widget.currentSwitch
            ? Text(
                '"Hodnota ktorá by mala byť v prvom okne: ${widget.formulare.control('firExchangeValue').value} ',
                style: const TextStyle(fontSize: 20),
              )
            : Text(
                '"Hodnota ktorá by mala byť v druhom okne: ${widget.formulare.control('secExchangeValue').value} ',
                style: const TextStyle(fontSize: 20),
              );
      },
    );
  }
}

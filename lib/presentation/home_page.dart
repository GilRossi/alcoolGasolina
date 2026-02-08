import 'package:alcoolGasolina/presentation/widgets/form_card.dart';
import 'package:alcoolGasolina/presentation/widgets/fuel_view_state.dart';
import 'package:flutter/material.dart';
import '../../domain/services/fuel_calculator_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _alcoolController = TextEditingController();
  final _gasolinaController = TextEditingController();

  final _calculator = FuelCalculatorService();

  FuelViewState _state = FuelViewState.initial();

  @override
  void dispose() {
    _alcoolController.dispose();
    _gasolinaController.dispose();
    super.dispose();
  }

  void _calculate() {
    FocusScope.of(context).unfocus();

    try {
      final result = _calculator.calculate(
        alcoolText: _alcoolController.text,
        gasolinaText: _gasolinaController.text,
      );

      setState(() {
        _state = FuelViewState(
          message: _buildMessage(result),
          color: result.bestFuel == FuelType.alcool
              ? Colors.greenAccent
              : Colors.amberAccent,
        );
      });
    } on FuelException catch (e) {
      setState(() {
        _state = FuelViewState(
          message: e.message,
          color: Colors.redAccent,
        );
      });
    }
  }

  String _buildMessage(FuelCalculationResult result) {
    final fuel =
    result.bestFuel == FuelType.alcool ? 'ÁLCOOL' : 'GASOLINA';

    return 'Abasteça com $fuel\n'
        '(proporção: ${result.ratio.toStringAsFixed(2)})';
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        centerTitle: true,
        title: const Text('Cálculo de Combustível'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Flex(
            direction:
            isLandscape ? Axis.horizontal : Axis.vertical,
            children: [
              if (!isKeyboardOpen || isLandscape)
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    'images/comb.png',
                    fit: BoxFit.contain,
                  ),
                ),

              const SizedBox(height: 24, width: 24),

              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  child: FormCard(
                    alcoolController: _alcoolController,
                    gasolinaController: _gasolinaController,
                    onCalculate: _calculate,
                    state: _state,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

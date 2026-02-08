import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'fuel_view_state.dart';
import 'price_field.dart';

class FormCard extends StatelessWidget {
  final TextEditingController alcoolController;
  final TextEditingController gasolinaController;
  final VoidCallback onCalculate;
  final FuelViewState state;

  const FormCard({
    super.key,
    required this.alcoolController,
    required this.gasolinaController,
    required this.onCalculate,
    required this.state,
  });

  bool get _canCalculate =>
      alcoolController.text.isNotEmpty &&
          gasolinaController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            PriceField(
              controller: alcoolController,
              label: 'Preço do Álcool (R\$)',
              icon: Icons.local_gas_station,
              color: AppColors.alcool,
            ),
            const SizedBox(height: 16),
            PriceField(
              controller: gasolinaController,
              label: 'Preço da Gasolina (R\$)',
              icon: Icons.local_gas_station_outlined,
              color: AppColors.gasolina,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canCalculate ? onCalculate : null,
                child: const Text('CALCULAR'),
              ),
            ),
            if (state.hasMessage) ...[
              const SizedBox(height: 24),
              Text(
                state.message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: state.color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

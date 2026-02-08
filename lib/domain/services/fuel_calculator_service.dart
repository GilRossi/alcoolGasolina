enum FuelType { alcool, gasolina }

class FuelCalculationResult {
  final FuelType bestFuel;
  final double ratio;

  FuelCalculationResult({
    required this.bestFuel,
    required this.ratio,
  });
}

class FuelCalculatorService {
  FuelCalculationResult calculate({
    required String alcoolText,
    required String gasolinaText,
  }) {
    if (alcoolText.isEmpty || gasolinaText.isEmpty) {
      throw const FuelException('Preencha todos os campos.');
    }

    final alcool = _parse(alcoolText);
    final gasolina = _parse(gasolinaText);

    if (alcool <= 0 || gasolina <= 0) {
      throw const FuelException('Os valores devem ser maiores que zero.');
    }

    final ratio = alcool / gasolina;

    final bestFuel =
    ratio <= 0.73 ? FuelType.alcool : FuelType.gasolina;

    return FuelCalculationResult(
      bestFuel: bestFuel,
      ratio: ratio,
    );
  }

  double _parse(String value) {
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed == null) {
      throw const FuelException('Formato inválido. Use números decimais.');
    }
    return parsed;
  }
}

class FuelException implements Exception {
  final String message;
  const FuelException(this.message);
}

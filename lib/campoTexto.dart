import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  String _resultado = '';
  Color _resultadoColor = Colors.white;

  @override
  void dispose() {
    _alcoolController.dispose();
    _gasolinaController.dispose();
    super.dispose();
  }

  void _calcular() {
    FocusScope.of(context).unfocus();

    final alcoolText = _alcoolController.text.trim().replaceAll(',', '.');
    final gasolinaText = _gasolinaController.text.trim().replaceAll(',', '.');

    if (alcoolText.isEmpty || gasolinaText.isEmpty) {
      setState(() {
        _resultado = 'Preencha os dois valores!';
        _resultadoColor = Colors.orangeAccent;
      });
      return;
    }

    final alcool = double.tryParse(alcoolText);
    final gasolina = double.tryParse(gasolinaText);

    if (alcool == null || gasolina == null || gasolina <= 0) {
      setState(() {
        _resultado = 'Digite valores válidos!';
        _resultadoColor = Colors.redAccent;
      });
      return;
    }

    final proporcao = alcool / gasolina;

    setState(() {
      if (proporcao <= 0.73) {
        _resultado = 'Abasteça com ÁLCOOL\n(proporção: ${proporcao.toStringAsFixed(2)})';
        _resultadoColor = Colors.greenAccent;
      } else {
        _resultado = 'Abasteça com GASOLINA\n(proporção: ${proporcao.toStringAsFixed(2)})';
        _resultadoColor = Colors.amberAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Cálculo de Combustível",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Flex(
                direction: isLandscape ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Imagem
                  Expanded(
                    flex: isLandscape ? 5 : 4,
                    child: Center(
                      child: Image.asset(
                        "images/comb.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: isLandscape ? 24 : 0,
                    height: isLandscape ? 0 : 24,
                  ),

                  // Card com formulário + resultado
                  Expanded(
                    flex: isLandscape ? 6 : 5,
                    child: SingleChildScrollView(
                      child: Card(
                        color: const Color(0xFF1E1E1E),
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                "Informe os valores",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Campo Álcool
                              TextField(
                                controller: _alcoolController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Preço do Álcool (R\$)",
                                  labelStyle: const TextStyle(color: Colors.greenAccent),
                                  prefixIcon: const Icon(Icons.local_gas_station, color: Colors.greenAccent),
                                  filled: true,
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              // Campo Gasolina
                              TextField(
                                controller: _gasolinaController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Preço da Gasolina (R\$)",
                                  labelStyle: const TextStyle(color: Colors.redAccent),
                                  prefixIcon: const Icon(Icons.local_gas_station, color: Colors.redAccent),
                                  filled: true,
                                  fillColor: const Color(0xFF2A2A2A),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 28),

                              // Botão Calcular
                              ElevatedButton(
                                onPressed: _calcular,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFC107),
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  elevation: 8,
                                ),
                                child: const Text(
                                  "CALCULAR",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 32),

                              // Resultado
                              if (_resultado.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2A2A2A),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: _resultadoColor.withOpacity(0.6), width: 1.5),
                                  ),
                                  child: Text(
                                    _resultado,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: _resultadoColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
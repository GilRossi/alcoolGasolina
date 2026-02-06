# ⛽ Calculadora de Combustível - Flutter
Aplicativo simples em **Flutter** que calcula qual combustível é mais vantajoso: **álcool** ou **gasolina**. O usuário informa os preços atuais e o app indica a melhor opção com base na regra clássica de 70% (ou 73% em veículos modernos). Projeto ideal para praticar formulários, validação de entrada, gerenciamento de estado e design responsivo em Flutter.

---
## 🚀 Tecnologias Utilizadas
* **Flutter** (SDK)
* **Dart**
* **Material Design**
* Stateful widgets (`setState`) para gerenciamento de estado simples
* `TextEditingController` + validação básica de campos numéricos
* Responsividade com `OrientationBuilder` e `Flex`

---
## 📂 Estrutura do Projeto
calculadora_combustivel/
│
├── android/                # código Android gerado pelo Flutter
├── ios/                    # código iOS gerado pelo Flutter
├── lib/
│   └── main.dart           # Aplicação: Home widget com lógica de cálculo
├── images/
│   └── comb.png            # Imagem principal (assets) - bomba de combustível
├── pubspec.yaml            # Declaração de dependências e assets
└── README.md

Exemplo relevante de arquivo principal: `lib/main.dart` (classe `Home`) — lê preços via `TextField`, calcula a proporção `preço_álcool / preço_gasolina`, aplica a regra de 0.7 e atualiza a UI com `setState()`.

---
## 🛠 Princípios Aplicados
### Clean Code
* Funções com responsabilidade única (`_calcular()` separa lógica de negócio da UI).
* Nomes claros e autoexplicativos (`_alcoolController`, `_gasolinaController`, `_resultado`).
* Estrutura de projeto limpa e direta.
### SOLID (aplicado de forma prática)
* **Single Responsibility**: widgets e métodos com responsabilidades limitadas.
* **Open/Closed** e extensibilidade: fácil alterar o fator de proporção ou adicionar histórico.
* Lógica de negócio concentrada no `State` para facilitar manutenção e testes.
### Padrões de Projeto / Arquitetura
* Composição de widgets Flutter para separar layout e interação.
* Uso de `StatefulWidget` + `setState` para gerenciamento local de estado (padrão simples para apps pequenos).
* Layout responsivo com `OrientationBuilder` (funciona bem em portrait e landscape).

---
## 🎯 Funcionalidades Principais
* Campos para inserir preço do álcool e da gasolina (com máscara decimal).
* Validação básica (campos obrigatórios, valores numéricos válidos).
* Cálculo automático da proporção e recomendação (álcool ou gasolina).
* Exibição do resultado com cor indicativa (verde para álcool, amarelo/laranja para gasolina).
* Design dark theme moderno com Card elevado e botões destacados.
* Imagem ilustrativa de bomba de combustível (assets/images/comb.png).

---
## 💻 Como Executar
Pré-requisitos:
* Flutter SDK instalado e configurado (PATH)
* Emulador Android ou dispositivo físico conectado
* Android Studio / VS Code (opcional, recomendado para desenvolvimento)

1. Clonar o repositório:
```bash
git clone https://github.com/GilRossi/calculadora-combustivel-flutter.git
cd calculadora-combustivel-flutter

Instalar dependências:

Bashflutter pub get

Rodar no emulador ou dispositivo:

Bashflutter run

Gerar APK de release:

Bashflutter build apk --release
Via IDE:

Abra o projeto no Android Studio ou VS Code.
Execute o main (lib/main.dart) com o botão Run/Play.


🔧 Configurar assets (pubspec.yaml)
Garanta que o pubspec.yaml inclua a referência aos assets. Exemplo:
flutter:
  assets:
    - images/comb.png
Depois rode flutter pub get para registrar os assets no projeto.
🎮 Como Usar

Abra o aplicativo.
Digite o preço do álcool e da gasolina nos campos (ex: 4.50 e 6.19).
Toque em CALCULAR.
Veja a recomendação:
Abasteça com ÁLCOOL (verde) se proporção < 0.7
Abasteça com GASOLINA (amarelo) caso contrário

Repita com novos valores.

Feedback visual:

Resultado destacado em container com borda colorida.
Cores intuitivas (verde = álcool vantajoso, amarelo = gasolina).


📊 Fluxo da Aplicação
Inicialização → Carrega imagem e campos vazios
      ↓
Usuário preenche preços → toca em "CALCULAR"
      ↓
_valida campos → calcula proporcao = alcool / gasolina
      ↓
Aplica regra 0.7 → define mensagem e cor
      ↓
setState() atualiza UI → resultado exibido
      ↓
Repetir
🧪 Recursos de Aprendizado

Prática de formulários e TextEditingController em Flutter.
Validação simples de entrada numérica (double.parse + tryParse).
Gerenciamento de estado local com setState.
Uso de assets (imagens) e design responsivo.
Boas práticas de UI (espaçamento, tipografia, feedback visual e acessibilidade básica).

📚 Próximos Passos / Melhorias Sugeridas

Adicionar opção para escolher o fator de proporção (0.70, 0.73, 0.75).
Salvar últimos preços usados (SharedPreferences).
Adicionar histórico de cálculos.
Implementar animações suaves ao mostrar o resultado.
Suporte a tema claro/escuro.
Internacionalização (português, inglês, espanhol).
Testes unitários para a lógica de cálculo.
Compartilhamento do resultado (via share_plus).
Gráfico comparativo de custo por km (com consumo informado pelo usuário).

👨‍💻 Autor
Gil Rossi Aguiar
📧 gil.rossi.aguiar@hotmail.com
🐙 GitHub — GilRossi
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:idosotech/constantes/app_colors.dart';
import 'package:idosotech/pages/tesouraria/details_tesouraria.dart';

import '../../constantes/app_text_style.dart';

class HomePageTesouraria extends StatefulWidget {
  const HomePageTesouraria({super.key});

  @override
  State<HomePageTesouraria> createState() => _HomePageTesourariaState();
}

class _HomePageTesourariaState extends State<HomePageTesouraria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Title(
                color: AppColors.appPrimaryColor,
                child: Text(
                  "Tesouraria",
                  style: AppTextStyles.tesourariaTitle,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Acompanhe aqui os gastos da gestão",
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 12 * 0.05,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            WhiteContainer(),
            DespesasCategoriaWidget(),
            SizedBox(
              height: 10,
            ),
            FaturasFechadasWidget(),
            SizedBox(
              height: 10,
            ),
            FaturaEventosWidget(),
          ],
        ),
      ),
    );
  }
}

class FaturaEventosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Fundo branco externo
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(16), // Margem para o botão vermelho
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red.shade700, // Fundo vermelho do botão
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16), // Padding interno do botão
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Texto "Fatura de eventos"
                  Text(
                    "Fatura de eventos",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // "Ver mais" e ícone de seta
                  Row(
                    children: [
                      Text(
                        "Ver mais",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 4), // Espaço entre o texto e o ícone
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DespesasCategoriaWidget extends StatelessWidget {
  const DespesasCategoriaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368,
      height: 195,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.appWhiteColor,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            "Despesas por categoria",
            style: AppTextStyles.tesourariaSubTitle,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.appLightGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    // color: AppColors.appDarkGrey,
                    child: PieChart(PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: _getSections(),
                    )),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  _buildLegend(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FaturasFechadasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF7F9FC), // Fundo levemente cinza
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título destacado
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.red.shade700, // Cor do fundo do botão vermelho
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Faturas fechadas",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 12), // Espaçamento entre o título e a lista

          // Lista de faturas horizontal
          SizedBox(
            height: 90, // Definir a altura do ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildFaturaItem(context, "Dezembro"),
                _buildFaturaItem(context, "Janeiro"),
                _buildFaturaItem(context, "Fevereiro"),
                _buildFaturaItem(context,
                    "Março"), // Adicionando um extra para demonstrar o scroll
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget de cada item da lista
  Widget _buildFaturaItem(BuildContext context, String mes) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsTesourariaPage()));
      },
      child: Container(
        width: 90,
        margin: EdgeInsets.only(right: 8), // Espaçamento entre os itens
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.attach_money, size: 28, color: Colors.black),
            SizedBox(height: 6),
            Text(
              mes,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        height: 180,
        width: 373,
        decoration: BoxDecoration(
            color: AppColors.appWhiteColor,
            borderRadius: BorderRadius.circular(16)),
        // color: AppColors.appWhiteColor,

        // # Saldo em Conta
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Title(
                    color: AppColors.appPrimaryColor,
                    child: Text(
                      "Saldo em Conta",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    )),
                SizedBox(
                  height: 8,
                ),
                Title(
                    color: AppColors.appPrimaryColor,
                    child: Text("10.000,00",
                        style: AppTextStyles.tesourariaSubTitle)),
              ],
            ),
            Spacer(),
            // # Linha com receitas e despesas
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        ),
                        Padding(padding: EdgeInsets.only(right: 2)),
                        Column(
                          children: [
                            Text(
                              "Receitas",
                              style: AppTextStyles
                                  .tesourariaLabelFinanceSimpleText,
                            ),
                            Text(
                              "R\$10.000,00",
                              style: AppTextStyles.tesourariaLabelFinanceGreen,
                            ),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                        Padding(padding: EdgeInsets.only(right: 2)),
                        Column(
                          children: [
                            Text("Despesas",
                                style: AppTextStyles
                                    .tesourariaLabelFinanceSimpleText),
                            Text(
                              "R\$1.250,00",
                              style: AppTextStyles.tesourariaLabelFinanceRed,
                            ),
                          ],
                        ),
                      ],
                    ),

                    // SizedBox(width: 8,)
                  ],
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinanceItem({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String value,
    required Color textColor,
  }) {
    return Column(
      children: [
        // Ícone dentro do círculo
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor
                .withOpacity(0.3), // Fundo levemente transparente
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        SizedBox(height: 6),

        // Título (Receitas / Despesas)
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),

        // Valor da receita ou despesa
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

List<PieChartSectionData> _getSections() {
  return [
    PieChartSectionData(
      color: Colors.blue,
      value: 30,
      title: '',
      radius: 15,
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 25,
      title: '',
      radius: 15,
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 20,
      title: '',
      radius: 15,
    ),
    PieChartSectionData(
      color: Colors.yellow,
      value: 25,
      title: '',
      radius: 15,
    ),
  ];
}

Widget _buildLegend() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildLegendItem("Alimentação", Colors.blue),
      SizedBox(
        height: 8,
      ),
      _buildLegendItem("Eventos", Colors.green),
      SizedBox(
        height: 8,
      ),
      _buildLegendItem("Estrutura", Colors.red),
      SizedBox(
        height: 8,
      ),
      _buildLegendItem("Manutenção", Colors.yellow),
    ],
  );
}

Widget _buildLegendItem(String title, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(width: 8),
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

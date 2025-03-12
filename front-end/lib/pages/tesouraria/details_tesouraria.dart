import 'package:flutter/material.dart';

class DetailsTesourariaPage extends StatelessWidget {
  const DetailsTesourariaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TesourariaMesPage(),
    );
  }
}

class TesourariaMesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC), // Cor de fundo semelhante ao Figma
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Tesouraria",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView( // Permite rolar a tela
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título Principal
              Center(
                child: Column(
                  children: [
                    Text(
                      "JANEIRO",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Acompanhe aqui os gastos da gestão",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Seção de despesas por dia
              _buildTransactionSection("Hoje"),
              _buildTransactionSection("09/02"),
              _buildTransactionSection("08/02"),
            ],
          ),
        ),
      ),
    );
  }

  // Função para criar cada seção do dia com as transações
  Widget _buildTransactionSection(String dateLabel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Data do grupo de transações
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            dateLabel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),

        // Lista de transações
        _buildTransactionItem(true),
        _buildTransactionItem(true),
        _buildTransactionItem(false),
        _buildTransactionItem(false),
        SizedBox(height: 16),
      ],
    );
  }

  // Função para construir cada transação
  Widget _buildTransactionItem(bool isIncome) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Ícone de receita ou despesa
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isIncome ? Colors.green.shade100 : Colors.red.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isIncome ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isIncome ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(width: 8),

              // Detalhes da transação
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10/02 - 15:42",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "Conteúdo digital - Playstation Store",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),

          // Valor e ícone de seta
          Row(
            children: [
              Text(
                isIncome ? "R\$ 20,00" : "R\$ 20,00",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isIncome ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.chevron_right, color: Colors.black54),
            ],
          ),
        ],
      ),
    );
  }
}


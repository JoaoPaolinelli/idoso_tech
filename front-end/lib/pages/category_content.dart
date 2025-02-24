import 'package:flutter/material.dart';
import 'package:idosotech/pages/home-page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/categoria.dart';
import '../model/video.dart';
import '../widgets/category_details_header_widget.dart';

class CategoryContent extends StatefulWidget {
  final Categoria categoriaClasse;
  final Video videos;

  const CategoryContent({
    Key? key,
    required this.categoriaClasse,
    required this.videos,
  }) : super(key: key);

  @override
  _CategoryContentState createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.videos.link) ?? ''; // 🔹 Extrai o ID do vídeo

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: true,
        controlsVisibleAtStart: true,
        isLive: false,
        forceHD: true,
        showLiveFullscreenButton: false,
        disableDragSeek: false,

      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 🔹 Libera o controlador ao sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CategoryDetailsHeaderWidget(
            categoriaClasse: widget.categoriaClasse,
            videos: widget.videos,
          ),
          const SizedBox(height: 30),
          Text(
            widget.videos.nome,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          // 🔹 Substituímos o ícone de play pelo player do YouTube
          Container(

            width: 400,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 4,
              )
            ),
            child:
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child:
            ClipRRect(

              borderRadius: BorderRadius.circular(16),
              child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),),),
          ),

          const SizedBox(height: 30),

          // 🔹 Caixa de Classificação e Dúvidas
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Classifique essa aula',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(5, (index) => const Icon(Icons.star_border, size: 30)),
                    )
                  ],
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 10),
                const Text(
                  'Ficou alguma dúvida? Clique aqui',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 🔹 Botões "Sair" e "Próximo"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavigationButton(
                context,
                "Voltar",
                Icons.arrow_back,
                    () => Navigator.pop(context),
              ),
              _buildNavigationButton(
                context,
                "Início",
                Icons.house,
                    () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false,)
                // Aqui você pode definir outra lógica
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // 🔹 Função auxiliar para criar os botões de navegação
  Widget _buildNavigationButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(132, 193, 243, 100),
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: Icon(icon, color: Colors.black),
          label: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

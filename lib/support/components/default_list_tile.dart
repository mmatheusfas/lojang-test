import 'package:flutter/material.dart';
import 'package:lojang_test/features/articles/article.dart';
import 'package:lojang_test/features/videos/video.dart';

class DefaultListTile extends StatelessWidget {
  final Video? video;
  final Article? article;

  const DefaultListTile({
    super.key,
    this.video,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Text(
            video?.name ?? article!.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromRGBO(128, 132, 143, 1),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 200,
            decoration: BoxDecoration(
              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3, blurStyle: BlurStyle.outer)],
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(video?.imageUrl ?? article!.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            video?.description ?? article!.description,
            style: const TextStyle(
              color: Color.fromRGBO(128, 132, 143, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(236, 236, 236, 1),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Color.fromRGBO(128, 132, 143, 1),
            ),
            label: const Text(
              'Compartilhar',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(128, 132, 143, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

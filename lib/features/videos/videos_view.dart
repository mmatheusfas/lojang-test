import 'package:flutter/material.dart';
import 'package:lojang_test/features/videos/video.dart';
import 'package:lojang_test/features/videos/videos_view_model.dart';
import 'package:lojang_test/support/components/default_list_tile.dart';

class VideosView extends StatelessWidget {
  VideosView({super.key});

  final viewModel = VideosViewModel();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      color: Colors.grey[50],
      child: FutureBuilder<List<Video>>(
        future: viewModel.getVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              child: Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final video = snapshot.data![index];

                    return DefaultListTile(
                      video: video,
                    );
                  },
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lojang_test/features/videos/videos_view_model.dart';
import 'package:lojang_test/support/components/default_list_tile.dart';
import 'package:lojang_test/support/components/default_loading.dart';
import 'package:lojang_test/support/style/app_colors.dart';

import '../../support/placeholders/error_placeholder.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  final viewModel = VideosViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      color: AppColors.lightGrey,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, snapshot) {
          if (viewModel.isLoading && viewModel.videosList.isEmpty) {
            return const DefaultLoading();
          }

          if (viewModel.errorMessage.isNotEmpty) {
            return Expanded(
              child: ErrorPlaceHolder(
                errorMessage: viewModel.errorMessage,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            child: ListView.separated(
              separatorBuilder: (_, __) => const Divider(),
              itemCount: viewModel.videosList.length,
              itemBuilder: (_, index) {
                final video = viewModel.videosList[index];

                return DefaultListTile(video: video, index: index + 1);
              },
            ),
          );
        },
      ),
    );
  }
}

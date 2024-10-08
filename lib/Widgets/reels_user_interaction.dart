import 'package:flutter/material.dart';

class ReelsUserInteraction extends StatelessWidget {
  final String likesCount;

  const ReelsUserInteraction({super.key, required this.likesCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Icon(
                Icons.person,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Icon(
            Icons.favorite,
            size: 50,
          ),
          Text(
            likesCount,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 40),
          const Icon(
            Icons.share,
            size: 35,
          ),
          const Text(
            'Share',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

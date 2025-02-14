import 'package:day_3/page/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Provider API"),
      ),
      body: Center(
        child: provider.loading
            ? const CircularProgressIndicator()
            //menampilkan keterangan bahwa provider tidak kosong
            //tapi eror
            : provider.error.isNotEmpty
                ? Text(
                    'Error: ${provider.error}',
                  )
                : ListView.builder(
                    itemCount: provider.posts.length,
                    itemBuilder: (context, index) {
                      final post = provider.posts[index];
                      return ListTile(
                        title: Text(post['title']),
                        subtitle: Text(post['body']),
                      );
                    },
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.fetchPosts,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

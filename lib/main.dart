import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingnewapp/Bloc/cubit.dart';
import 'package:testingnewapp/Bloc/state.dart';
import 'package:testingnewapp/GetIt/getit.dart';
import 'package:testingnewapp/Model/model.dart';

void main() {
  setup(); // تهيئة get_it
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(),
        child: PostsPage(),
      ),
    );
  }
}

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('PostsNew'),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return Center(
              child: Text('Press the button to fetch posts'),
            );
          } else if (state is PostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                Post post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (state is PostError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => postCubit.fetchPosts(),
        child: Icon(Icons.download),
      ),
    );
  }
}

// main.dart
int multiply(int x, int y) {
  return x * y;
}

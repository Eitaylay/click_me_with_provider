import 'package:click_me/reaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Use (_) modifier before variables to indicate that they are private
  // private means they can only be accessed within the scope

  @override
  Widget build(BuildContext context) {
    final reactionProvider = context.read<ReactionProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Click Me'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/leaderboard',
                arguments: {
                  'result': (reactionProvider.likeCounter +
                          reactionProvider.loveCounter) -
                      reactionProvider.unlikeCounter,
                },
              );
            },
            icon: const Icon(Icons.leaderboard),
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              'This is your Click Me post!',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 100,
            ),
            Consumer<ReactionProvider>(
              builder: (_, reactionProvider, __) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${reactionProvider.likeCounter}\n 👍',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${reactionProvider.loveCounter}\n 💖',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.green,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${reactionProvider.unlikeCounter}\n 👎',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Colors.red,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton.icon(
            onPressed: () {
              reactionProvider.increaseLike();
            },
            icon: const Icon(
              Icons.thumb_up,
              size: 18,
            ),
            label: const Text('Like'),
          ),
          FilledButton.icon(
            onPressed: () {
              reactionProvider.increaseLove();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            icon: const Icon(
              Icons.favorite,
              size: 18,
            ),
            label: const Text('Love'),
          ),
          FilledButton.icon(
            onPressed: () {
              reactionProvider.increaseUnlike();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            icon: const Icon(
              Icons.thumb_down,
              size: 18,
            ),
            label: const Text('Unlike'),
          ),
        ],
      ),
    );
  }
}

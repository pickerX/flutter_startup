import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Start up'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
            'titleLarge',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'titleMedium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'titleSmall',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            'headlineLarge',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'headlineMedium',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'headlineSmall',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'displayLarge',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'displayMedium',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'displaySmall',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'bodyLarge',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'bodyMedium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'bodySmall',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            'labelLarge',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            'labelMedium',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'labelSmall',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add',
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

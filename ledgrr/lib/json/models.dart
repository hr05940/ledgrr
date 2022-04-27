import 'package:meta/meta.dart';

/// {@template todo}
/// Model for a todo. Can contain an optional list of [items] for
/// additional sub-todos.
/// {@endtemplate}
class Category {
  /// {@macro todo}
  const Category({
    required this.name,
    required this.spent,
    required this.label_percentage,
    required this.percentage,
    // this.items,
  });

  /// The id of this todo.
  final String name;

  /// The description of this todo.
  final int spent;
  final String label_percentage;
  final double percentage;

  /// A list of [Item]s for sub-todos.
  // final List<Item> items;
}

class Expenses {
  const Expenses({
    required this.category,
    required this.amount,
    required this.time,
    required this.date,
  });

  final String category;
  final double amount;
  final String time;
  final String date;
}

/// {@template item}
/// An individual item model, used within a [Todo].
/// {@endtemplate}
class Item {
  /// {@macro item}
  Item({
    required this.id,
    this.description = '',
    this.completed = false,
  });

  /// The id of this item.
  final String id;

  /// Description of this item.
  final String description;

  /// Indicates if this item has been completed or not.
  bool completed;
}
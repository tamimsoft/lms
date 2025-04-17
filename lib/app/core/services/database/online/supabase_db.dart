import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../common/data/base_model.dart';

enum Table {
  books('books'),
  genres('genres'), // e.g: 'action', 'adventure', 'comedy', 'drama', 'fantasy', 'horror', 'mystery', 'romance', 'sci-fi', 'thriller', 'western'
  tags('tags'), // e.g: 'New Arrival',  'Popular', 'Top Rated', 'Free', 'Premium',  'Best Seller', 'Recommended', 'Trending', 'New Release', 'Best Seller', 'Recommended', 'Trending', 'New Release', 'Best Seller', 'Recommended', 'Trending', 'New Release', 'Best Seller', 'Recommended', 'Trending', 'New Release','Best Seller', 'Recommended', 'Trending', '
  carts('carts'),
  reviews('reviews');

  final String name;

  const Table(this.name);
}

abstract mixin class SupabaseDb {
  SupabaseClient supabase = Supabase.instance.client;

  Future<List<T>> getAll<T extends BaseModel<T>>({
    required Table table,
    required T model,
    int limit = 10, // default value
    int offset = 0, // default value
  }) async {
    try {
      final response = await supabase
          .from(table.name)
          .select()
          .range(offset, offset + limit - 1);
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((item) => model.fromJson(json: item)).cast<T>().toList();
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<T?> getById<T extends BaseModel<T>>({
    required Table table,
    required String id,
    required T model,
  }) async {
    try {
      final response =
          await supabase.from(table.name).select().eq('id', id).single();
      return model.fromJson(json: response);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> insert({
    required Table table,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabase.from(table.name).insert(data);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> update({
    required Table table,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabase.from(table.name).update(data).eq('id', id);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> delete({required Table table, required String id}) async {
    try {
      await supabase.from(table.name).delete().eq('id', id);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<String?> uploadImage({required File imageFile}) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';
    try {
      await supabase.storage.from('images').remove(['uploads/$fileName']);
      await supabase.storage.from('images').upload(path, imageFile);
      return path;
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }
}

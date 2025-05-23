import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/common/data/repository/author_repository.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class MockSupabaseDb extends Mock implements AppDb {}

class FakeAuthor extends Fake implements Author {}

void main() {
  late MockSupabaseDb mockDb;
  late AuthorRepository repository;

  final mockAuthors = [
    Author(id: '1', name: 'Author 1'),
    Author(id: '2', name: 'Author 2'),
    Author(id: '3', name: 'Author 3'),
  ];

  setUpAll(() {
    registerFallbackValue(FakeAuthor());
  });

  setUp(() {
    mockDb = MockSupabaseDb();
    repository = AuthorRepository(mockDb);
  });

  group('AuthorRepository Tests', () {
    test('getAll() returns list of authors', () async {
      when(() => mockDb.findAll<Author>(
        table: DbTable.authors,
        entity: any(named: 'entity'),
        filters: any(named: 'filters'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      )).thenAnswer((_) async => mockAuthors);

      final result = await repository.getAll();
      expect(result, mockAuthors);
      verify(() => mockDb.findAll<Author>(
        table: DbTable.authors,
        entity: any(named: 'entity'),
        filters: any(named: 'filters'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      )).called(1);
    });

    test('getById() returns a single author', () async {
      final author = mockAuthors.first;
      when(() => mockDb.findById<Author>(
        table: DbTable.authors,
        id: any(named: 'id'),
        entity: any(named: 'entity'),
      )).thenAnswer((_) async => author);

      final result = await repository.getById(id: '1');
      expect(result, author);
      verify(() => mockDb.findById<Author>(
        table: DbTable.authors,
        id: any(named: 'id'),
        entity: any(named: 'entity'),
      )).called(1);
    });

    test('getAllByIds() returns authors with matching ids', () async {
      final ids = ['1', '2'];
      when(() => mockDb.findAll<Author>(
        table: DbTable.authors,
        filters: any(named: 'filters'),
        entity: any(named: 'entity'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      )).thenAnswer((_) async => mockAuthors);

      final result = await repository.getAllByIds(ids: ids);
      expect(result, mockAuthors);
      verify(() => mockDb.findAll<Author>(
        table: DbTable.authors,
        filters: any(named: 'filters'),
        entity: any(named: 'entity'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      )).called(1);
    });
  });
}


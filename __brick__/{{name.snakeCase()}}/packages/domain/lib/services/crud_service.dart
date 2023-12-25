/// {@template crud_service}
/// Abstract class to serve as base for a CRUD Service.
///
/// {@endtemplate}
abstract class CrudService<T> {
  /// Finds all models that match [T]
  Future<List<T>> findAll();

  /// Finds a model [T] with ID [id]
  Future<T> findById(String id);

  /// Saves a model [T]
  Future<T> save(T model);

  /// Deletes a model [T] with ID [id]
  Future<void> deleteById(String id);
}

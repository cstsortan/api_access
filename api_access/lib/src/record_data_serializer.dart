/// A class to describe how a value from the model can be converted
/// to record data. T is for the record data, and V for the type coming from
/// the model, e.g. Map
///
/// It describes a way to convert data between the record data type and the
/// model data type using the deserializeValue and serializeValue methods.
/// The generic type T is the type of the record data,
/// while V is the type of the model data.
///
/// The deserializeValue method converts model data to record data,
/// and the serializeValue method converts record data to model data.
/// Both methods are abstract, meaning that they must be implemented
/// by any class that extends RecordDataSerializer.
abstract class RecordDataSerializer<V> {
  /// helper to easily go from map to object
  T deserializeValue<T>(V map);

  /// helper to easily go from object to map
  V serializeValue<T>(T value);
}

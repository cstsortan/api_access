/// A class to describe how a value from the model can be converted
/// to record data. T is for the record data, and V for the type coming from
/// the model, e.g. Map
abstract class RecordDataSerializer<V> {
  /// helper to easily go from map to object
  T deserializeValue<T>(V map);

  /// helper to easily go from object to map
  V serializeValue<T>(T value);
}

@propertyWrapper
struct Field<T: Equatable> {
  var map: String
  var type = T.self
  var isPrimaryKey = false
  private(set) var defaultValue: T?
  var wrappedValue: String {
    return map
  }
  init(map: String, isPrimaryKey: Bool = false, defaultValue: T? = nil) {
    self.map = map
    self.isPrimaryKey = isPrimaryKey
    self.defaultValue = defaultValue
  }
}

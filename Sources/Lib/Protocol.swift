protocol ModelProtocol: AnyObject {
  var tableName: String { get }
  associatedtype T: Equatable
  var id: T { get }
}

class Model {
  func findMany() {

  }
}

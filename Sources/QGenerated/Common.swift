enum _Operator<T: Equatable> {
  case equals(T, T)
  case notEquals(T, T)

  func getWhereClause(
    table: String,
    column: String
  ) -> String {
    var q = ""
    switch self {
    case .equals(let value):
      q += "\(column) == \(value)"
    case .notEquals(let value):
      q += "\(column) != \(value)"
    }
    return q
  }
}

enum Connector {
  case AND, OR
}

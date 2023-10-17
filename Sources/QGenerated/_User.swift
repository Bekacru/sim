struct UserType {
  let id: String
  let phoneNumber: String
  let verified: Bool
}

enum UserFindManyWhere {
  case id(_Operator<String>)
  case phoneNumber(_Operator<String>)
  case verified(_Operator<Bool>)
}

typealias UserFindManyWhereInput = [Connector: [UserFindManyWhere]]

class User {
  func findMany(where_: UserFindManyWhereInput) -> [UserType] {
    let whereClauses = transformWhere(where_: where_)
    print(whereClauses)
    return []
  }

  func transformWhere(where_: UserFindManyWhereInput) -> [String] {
    var whereClause: [String] = []
    if let andClauses = where_[.AND] {
      for clause in andClauses {
        switch clause {
        case .id(let fieldClause):
          let res = fieldClause.getWhereClause(table: "user", column: "id")
          whereClause.append(res)
        case .phoneNumber(let fieldClause):
          let res = fieldClause.getWhereClause(table: "user", column: "phone_number")
          whereClause.append(res)
        case .verified(let fieldClause):
          let res = fieldClause.getWhereClause(table: "user", column: "verified")
          whereClause.append(res)
        }
      }
    }
    return whereClause
  }
}

class UserModel: ModelProtocol {
  var tableName: String = "user"
  @Field<String>(map: "id", isPrimaryKey: true) var id: String
  @Field<String>(map: "phone_number") var phoneNumber: String
}

class Generate<T: ModelProtocol> {
  private let model: T
  init(model: T) {
    self.model = model
  }

  func findMany(_ queryBuilder: (QueryBuilder<T>) -> Void) -> [T] {
    let builder = QueryBuilder(model: model)
    queryBuilder(builder)
    let sqlQuery = builder.build()
    // print(sqlQuery)
    return []
  }
}

class QueryBuilder<T: ModelProtocol> {
  private var model: T
  private var filters: [String] = []

  init(model: T) {
    self.model = model
  }

  func _where<K: Equatable>(_ by: (T) -> [Connector: _Operator<K>]) {

  }

  fileprivate func build() -> String {
    // Combine the filters into an SQL query.
    let whereClause = filters.isEmpty ? "" : "WHERE " + filters.joined(separator: " AND ")
    return "SELECT * FROM table WHERE \(whereClause);"
  }
}

// enum DataType {
//   case String, Int
// }

// @propertyWrapper
// struct Field<T: Equatable> {
//   var map: String
//   var type = T.self
//   var isPrimaryKey = false
//   private(set) var defaultValue: T?
//   private(set) var projectedValue: [String: String]
//   var wrappedValue: String {
//     return map
//   }
//   init(map: String, isPrimaryKey: Bool = false, defaultValue: T? = nil) {
//     self.map = map
//     self.isPrimaryKey = isPrimaryKey
//     self.defaultValue = defaultValue
//     self.projectedValue = ["name": map]
//   }
// }

// protocol Table: AnyObject {
//   var name: String { get }
// }

// class User: Table {
//   @Field<String>(map: "id", isPrimaryKey: true) var id: String
//   @Field<String>(map: "phoneNumber") var phoneNumber
//   var name = "user"
// }
// var userT = User()

// struct ORM {
//   func findMany<T: Table>(model: T) -> [T] {
//     return [model]
//   }
// }

// let db = ORM()
// let res = db.findMany(model: userT)

// for user in res {
//   print(user.id, user.id)
// }

// struct Field {
//   let name: String
//   let isPrimaryKey: Bool
// }

// class Model {
//   subscript(index: String) -> [String: String] {
//     return ["name": "name"]
//   }
// }

// class UserSchema {
//   let tableName = "user"
//   let id = Field(name: "id", isPrimaryKey: true)
// }

// class Schema {
//   let UserModel = UserSchema()
// }

// class generator {
//   let schema = Schema()
//   func gen(){
//     schema.UserModel
//   }
// }

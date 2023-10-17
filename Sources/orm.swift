let rawData = [
  "user": [
    ["id": "1", "phoneNumber": "+251942589049", "verified": true],
    ["id": "2", "phoneNumber": "+251911477207", "verified": false],
    ["id": "3", "phoneNumber": "+251911639416", "verified": true],
  ]
]

// enum UserFindManyWhere {
//   case id(_Operator<String>)
//   case phoneNumber(_Operator<String>)
//   case verified(_Operator<Bool>)
// }

// struct User {
//   func findFirst(where_: [Connector: [UserFindManyWhere]], limit: Int?) -> [UserType]? {
//     let users = rawData["user"] ?? []  //assume this could be a db call
//     if users.count <= 0 {
//       return nil
//     } else {
//       let andClauses = where_[.AND] ?? []
//       let data = filter(where_: andClauses)
//       return getUsers(data)
//     }
//   }

//   private func getUsers(_ data: [[String: Any]]) -> [UserType] {
//     if data.count <= 0 {
//       return []
//     }
//     var Users: [UserType] = []
//     for d in data {
//       let id = d["id"] as! String
//       let phoneNumber = d["phoneNumber"] as! String
//       let verified = d["verified"] as! Bool
//       Users.append((id: id, phoneNumber: phoneNumber, verified: verified))
//     }
//     return Users
//   }

//   private func filter(where_: [UserFindManyWhere]) -> [[String: Any]] {
//     var res: [[String: Any]] = []
//     let users = rawData["user"] ?? []
//     for clause in where_ {
//       switch clause {
//       case .id(let fieldClause):
//         fieldClause.filter(rawData: users, column: "id")
//       default:
//         return []
//       }
//     }
//     return res
//   }
// }

// struct DB {
//   let User: User = User()
// }

// let db = DB()

// let Users = db.User.findFirst(where_: [.AND: [.verified(.equals(false))]], limit: 1) ?? []

// for User in Users {
//   print(User)
// }

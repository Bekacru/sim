// The Swift Programming Language
// https://docs.swift.org/swift-book

print("Hello, world!")

// let db = DB()

// let res = db.user.findMany(where_: [
//   .AND: [.id(.equals("1")), .phoneNumber(.notEquals("0942589049"))]
// ])

let user = Generate<UserModel>(model: UserModel())

let result = user.findMany {
  $0._where { [.AND: .equals($0.id, "123")] }
}

print(result)

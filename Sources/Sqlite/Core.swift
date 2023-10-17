import Dispatch
import Foundation
import SQLite3

class Connection {
  enum Location {
    case inMemory
    case temporary
    case uri(String, parameters: [String] = [])

    public var description: String {
      switch self {
      case .inMemory:
        return ":memory:"
      case .temporary:
        return ""
      case let .uri(URI, parameters):
        guard parameters.count > 0,
          var components = URLComponents(string: URI)
        else {
          return URI
        }
        components.queryItems =
          components.queryItems ?? []
        if components.scheme == nil {
          components.scheme = "file"
        }
        return components.description
      }
    }
  }

  private var _handle: OpaquePointer?
  public var db: OpaquePointer { _handle! }

  init(fileName: String) {
    let filename = Location.uri(fileName, parameters: [])
    let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
    sqlite3_open_v2(filename.description, &_handle, flags, nil)
  }

  public func execute(_ SQL: String) throws {
    let aThing = sqlite3_exec(db, SQL, nil, nil, nil)
    let message = String(cString: sqlite3_errmsg(db))
    print(SQLITE_OK, "ok", message)
    print(aThing)
  }

  deinit {
    sqlite3_close(db)
  }
}

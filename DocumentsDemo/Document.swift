import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {

    }

}

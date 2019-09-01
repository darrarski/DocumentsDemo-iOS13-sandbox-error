import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        return FileWrapper(directoryWithFileWrappers: [:])
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {

    }

}

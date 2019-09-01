import UIKit

class DocumentBrowserViewController: UIDocumentBrowserViewController, UIDocumentBrowserViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        allowsDocumentCreation = true
        allowsPickingMultipleItems = false
    }

    // MARK: - UIDocumentBrowserViewControllerDelegate
    
    func documentBrowser(
        _ controller: UIDocumentBrowserViewController,
        didRequestDocumentCreationWithHandler
        importHandler: @escaping (URL?, UIDocumentBrowserViewController.ImportMode) -> Void
    ) {
        let newDocumentURL = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("NewDocument")
            .appendingPathExtension("demodoc")
        let newDocument = Document(fileURL: newDocumentURL)
        newDocument.save(to: newDocumentURL, for: .forCreating) { success in
            guard success else {
                print("Unable to save new document to: \(newDocumentURL)")
                importHandler(nil, .none)
                return
            }
            newDocument.close { success in
                guard success else {
                    print("Unable to close newly created document")
                    importHandler(nil, .none)
                    return
                }
                importHandler(newDocumentURL, .move)
            }
        }
    }
    
    func documentBrowser(
        _ controller: UIDocumentBrowserViewController,
        didPickDocumentsAt documentURLs: [URL]
    ) {
        guard let sourceURL = documentURLs.first else { return }
        presentDocument(at: sourceURL)
    }
    
    func documentBrowser(
        _ controller: UIDocumentBrowserViewController,
        didImportDocumentAt sourceURL: URL,
        toDestinationURL destinationURL: URL
    ) {
        presentDocument(at: destinationURL)
    }
    
    func documentBrowser(
        _ controller: UIDocumentBrowserViewController,
        failedToImportDocumentAt documentURL: URL, error: Error?
    ) {
        // TODO: present error message to the user
    }
    
    // MARK: - Document Presentation
    
    func presentDocument(at documentURL: URL) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let documentViewController = storyBoard.instantiateViewController(withIdentifier: "DocumentViewController") as! DocumentViewController
        documentViewController.document = Document(fileURL: documentURL)
        present(documentViewController, animated: true, completion: nil)
    }
}

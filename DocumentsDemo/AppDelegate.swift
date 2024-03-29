import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    func application(
        _ app: UIApplication,
        open inputURL: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        guard inputURL.isFileURL else {
            return false
        }
        guard let documentBrowserViewController = window?.rootViewController as? DocumentBrowserViewController else {
            return false
        }
        documentBrowserViewController.revealDocument(at: inputURL, importIfNeeded: true) { (revealedDocumentURL, error) in
            if let error = error {
                print("Failed to reveal the document at URL \(inputURL) with error: '\(error)'")
                return
            }
            documentBrowserViewController.presentDocument(at: revealedDocumentURL!)
        }
        return true
    }


}


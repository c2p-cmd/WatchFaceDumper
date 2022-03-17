import NorthLayout
import Ikemen

class NewDocumentViewController: NSViewController {
    private lazy var photosRadioButton: NSButton = NSButton(radioButtonWithTitle: "Photos", target: self, action: #selector(faceTypeChanged(_:))) ※ {
        $0.state = .on
    }
    private lazy var portraitRadioButton: NSButton = NSButton(radioButtonWithTitle: "Portrait", target: self, action: #selector(faceTypeChanged(_:)))

    override func loadView() {
        view = NSView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let autolayout = view.northLayoutFormat(["p": 20], [
            "photos": photosRadioButton,
            "portrait": portraitRadioButton,
            "cancel": NSButton(title: "Cancel", target: self, action: #selector(cancel(_:))) ※ {
                $0.keyEquivalent = "\u{1b}" // esc
            },
            "open": NSButton(title: "Open", target: self, action: #selector(open(_:))) ※ {
                $0.keyEquivalent = "\r"
            },])
        autolayout("H:|-p-[photos]-p-|")
        autolayout("H:|-p-[portrait]-p-|")
        autolayout("H:|-(>=p)-[cancel(open)]-p-[open]-p-|")
        autolayout("V:|-p-[photos]-[portrait]-(>=p)-[cancel]-p-|")
        autolayout("V:[open]-p-|")
    }

    @IBAction func faceTypeChanged(_ sender: Any?) {
    }

    @IBAction func cancel(_ sender: Any?) {
        view.window?.close()
    }

    @IBAction func open(_ sender: Any?) {
        if photosRadioButton.state == .on {
            openNewDocument(.init(photos: ()))
        } else if portraitRadioButton.state == .on {
            openNewDocument(.init(portrait: ()))
        }
        view.window?.close()
    }

    func openNewDocument(_ document: Document) {
        document.makeWindowControllers()
        document.showWindows()
    }
}

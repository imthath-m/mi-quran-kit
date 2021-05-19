import MILocalStore
import CoreData

var QuranKitBundle: Bundle { Bundle.module }

public class QuranStore: CoreDataStorable {
	private init() {
		self.persistantContainer = QuranStore.makeContainer()
	}

	open var modelName: String { "Verses "}

	open var persistantContainer: NSPersistentContainer

	open lazy var mainContext: NSManagedObjectContext = persistantContainer.viewContext

	open lazy var privateContextWithParent: NSManagedObjectContext = mainContext.privateChildContext

	public static let shared = QuranStore()

	public static var context: NSManagedObjectContext { shared.currentContext }

	public static func save() { shared.saveChanges() }

	static func makeContainer() -> NSPersistentContainer {
		let url = Bundle.module.url(forResource: "Verses", withExtension: "momd")
		let model = NSManagedObjectModel(contentsOf: url!)
		let container: NSPersistentCloudKitContainer = .init(name: "Verses", managedObjectModel: model!)
		container.loadPersistentStores { storeDesc, error in
			if let error = error {
				assertionFailure(error.localizedDescription)
			}

			if storeDesc.url == nil {
				assertionFailure("No Store URL")
			}

			print("URL - " + storeDesc.url!.absoluteString)
		}
		return container
	}

	public static var verses: [CDVerse] {
		let fetchRequest: NSFetchRequest<CDVerse> = CDVerse.fetchRequest()

		return try! context.fetch(fetchRequest)
	}

	public func loadVerses() {
		guard Self.verses.isEmpty else {
			return
		}

		ALL_VERSES.forEach {
			let verse = CDVerse(context: QuranStore.context)
			verse.ayah = Int16($0.ayah)
			verse.surah = Int16($0.sura)
			verse.text = $0.text
		}

		QuranStore.save()
	}
}

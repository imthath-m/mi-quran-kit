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

			if let url = storeDesc.url {
        print("URL - " + url.absoluteString)
      } else {
        assertionFailure("No Store URL")
      }
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
			verse.ayah = $0.ayah
			verse.surah = $0.sura
			verse.text = $0.text
		}

		QuranStore.save()
	}

  public static func surahName(for number: Int16, in language: Language) -> String {
    switch language {
    case .english: return english[Int(number-1)]
    case .arabic: return arabic[Int(number-1)]
    }
  }

  static let english = SurahsEnglish().allNames
  static let arabic = SurahsArabic().allNames

  public enum Language {
    case english, arabic
  }
}

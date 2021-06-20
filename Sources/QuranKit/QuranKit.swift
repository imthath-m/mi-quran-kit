import MILocalStore
import CoreData

var QuranKitBundle: Bundle { Bundle.module }

public class QuranStore: CoreDataStorable {

  public static var preview: QuranStore = {
    let store = QuranStore(loadstoreByDefault: false)
    store.persistantContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    store.persistantContainer.loadPersistentStores { storeDesc, error in
      if let error = error {
        assertionFailure(error.localizedDescription)
      }

      if let url = storeDesc.url {
        print("URL - " + url.absoluteString)
      } else {
        assertionFailure("No Store URL")
      }
    }

    return store
  }()

  private init(loadstoreByDefault: Bool = true) {
    self.persistantContainer = QuranStore.makeContainer(loadstoreByDefault: loadstoreByDefault)
    AudioService.shared.fetchVerseByVerseReciters()
	}

	open var modelName: String { "Verses "}

	open var persistantContainer: NSPersistentContainer

	open lazy var mainContext: NSManagedObjectContext = persistantContainer.viewContext

	open lazy var privateContextWithParent: NSManagedObjectContext = mainContext.privateChildContext

	public static let shared = QuranStore()

	public static var context: NSManagedObjectContext { shared.currentContext }

	public static func save() { shared.saveChanges() }

	static func makeContainer(loadstoreByDefault: Bool = true) -> NSPersistentContainer {
		let url = Bundle.module.url(forResource: "Verses", withExtension: "momd")
		let model = NSManagedObjectModel(contentsOf: url!)
		let container: NSPersistentCloudKitContainer = .init(name: "Verses", managedObjectModel: model!)
    guard loadstoreByDefault else {
      return container
    }
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

	public func loadVerses() {
		guard Self.isEmpty else {
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

  public static func verses(from source: VerseSource) -> [CDVerse] {
    switch source {
    case .fullSurah(let surah): return verses(in: surah)
    case .range(let range): return verses(in: range)
    }
  }

  public static func versesCount(from source: VerseSource) -> Int {
    verses(from: source).count
  }

  public static func surahName(for number: Int16, in language: Language) -> String {
    guard number > 0, number <= 114 else { return "" }
    switch language {
    case .english: return english[Int(number-1)]
    case .arabic: return arabic[Int(number-1)]
    }
  }

  // MARK: - Internal API
  internal static var isEmpty: Bool {
    let fetchRequest: NSFetchRequest<CDVerse> = CDVerse.fetchRequest()
    fetchRequest.fetchLimit = 1
    do {
      return try context.fetch(fetchRequest).isEmpty
    } catch {
      assertionFailure(error.localizedDescription)
      return true
    }
  }

  internal static func verses(in surah: Int16) -> [CDVerse] {
    let fetchRequest: NSFetchRequest<CDVerse> = CDVerse.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "surah = %d", surah)
    fetchRequest.sortDescriptors = [
      NSSortDescriptor(key: "ayah", ascending: true)
    ]
    do {
      return try context.fetch(fetchRequest)
    } catch {
      assertionFailure(error.localizedDescription)
      return []
    }
  }

  internal static func verses(in range: VersesRange) -> [CDVerse] {
    let fetchRequest: NSFetchRequest<CDVerse> = CDVerse.fetchRequest()
    fetchRequest.predicate = NSPredicate(
      format: "surah >= %d AND surah <= %d",
      range.startSurah, range.endSurah
    )
    fetchRequest.sortDescriptors = [
      NSSortDescriptor(key: "surah", ascending: true),
      NSSortDescriptor(key: "ayah", ascending: true)
    ]
    do {
      return try context.fetch(fetchRequest).filter { verse in
        if verse.surah == range.startSurah,
           verse.ayah < range.startAyah {
          return false
        }

        if verse.surah == range.endSurah,
           verse.ayah > range.endAyah {
          return false
        }

        return true
      }
    } catch {
      assertionFailure(error.localizedDescription)
      return []
    }
  }

  internal static let english = SurahsEnglish().allNames
  internal static let arabic = SurahsArabic().allNames
}

extension QuranStore {
  public enum Language: String {
    case english = "en", arabic = "ar"
  }
}

public enum VerseSource {
  case fullSurah(Int16)
  case range(VersesRange)
}

public struct VersesRange {
  public var startSurah: Int16
  public var startAyah: Int16
  public var endSurah: Int16
  public var endAyah: Int16

  public init(startSurah: Int16, startAyah: Int16, endSurah: Int16, endAyah: Int16) {
    self.startSurah = startSurah
    self.startAyah = startAyah
    self.endSurah = endSurah
    self.endAyah = endAyah
  }
}

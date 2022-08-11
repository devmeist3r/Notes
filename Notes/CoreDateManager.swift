import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Notes")
        container.loadPersistentStores(completionHandler: { (storeDescrption, err) in
            if let err = err {
                fatalError("Loading of stores failed: \(err)")
            }
        })
        return container
    }()
    
    // 1 create noteFolder
    func createNoteFolder(title: String) -> NoteFolder {
        let context = persistentContainer.viewContext
        
        let newNoteFolder = NSEntityDescription.insertNewObject(forEntityName: "NoteFolder", into: context) as! NoteFolder
        
        newNoteFolder.title = title
        
        do {
            try context.save()
            return newNoteFolder
        } catch let err {
            print("Failed to save new note folder", err)
            return newNoteFolder
        }
    }
    
    func fetchNoteFolders() -> [NoteFolder] {
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NoteFolder>(entityName: "NoteFolder")
        
        do {
            let noteFolder = try context.fetch(fetchRequest)
            return noteFolder
        } catch let err {
            print("failed to fetch nore folders: ", err)
            return []
        }
    }
    
    func deleteNoteFolder(noteFolder: NoteFolder) -> Bool {
        let context = persistentContainer.viewContext
        
        context.delete(noteFolder)
        
        do {
            try context.save()
            return true
        } catch let err {
            print("Error deleting note folder entity instance", err)
            return false
        }
    }
    
    func createNewNote(title: String, date: Date, text: String, noteFolder: NoteFolder) -> Note {
        let context = persistentContainer.viewContext
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        
        newNote.title = title
        newNote.text = text
        newNote.date = date
        newNote.noteFolder = noteFolder
        
        do {
            try context.save()
            return newNote
        } catch let err {
            print("Failed to save new note folder", err)
            return newNote
        }
    }
    
    func fetchNotes(from noteFolder: NoteFolder) -> [Note] {
        guard let folderNotes = noteFolder.notes?.allObjects as? [Note] else { return []}
        
        return folderNotes
    }
    
    func deleteNote(note: Note) -> Bool {
        let context = persistentContainer.viewContext
        
        context.delete(note)
        
        do {
            try context.save()
            return true
        } catch let err {
            print("Error deleting note entity instance", err)
            return false
        }
    }
    
    
    func saveUpdatedNote(note: Note, newText: String) {
        let context = persistentContainer.viewContext
        
        note.title = newText
        note.text = newText
        note.date = Date()
        
        do {
            try context.save()
        } catch let err {
            print("error saving/updating note",err)
        }
    }
}

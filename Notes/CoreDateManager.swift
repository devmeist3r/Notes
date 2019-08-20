//
//  CoreDateManager.swift
//  Notes
//
//  Created by P21 Sistemas on 20/08/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

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
    
    
    // 2 fetch noteFolder
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
}

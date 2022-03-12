//
//  CoreDataManager.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 7.03.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "RortyDatabase")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            } else {
                print("Successfully Loaded Core Data :)")
            }
        }
    }
    
    func getFavoriteList() -> [FavoriteEntity] {
        let fetchRequest: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func getFavorite(id: Int) -> FavoriteEntity? {
        let fetchRequest: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        fetchRequest.fetchLimit = 1
        
        let context = persistentContainer.viewContext
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            return nil
        }
    }
    
    func saveFavorite(id: Int, status: String?, gender: String?, name: String?, imageUrl: String?, species: String?) {
        let favorite = FavoriteEntity(context: persistentContainer.viewContext)
        favorite.id = Int32(id)
        favorite.status = status
        favorite.gender = gender
        favorite.name = name
        favorite.imageUrl = imageUrl
        favorite.species = species
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save favorite \(error)")
        }
    }
    
    func deleteFavorite(id: Int) {
        let fetchRequest: NSFetchRequest<FavoriteEntity> = FavoriteEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        fetchRequest.includesPropertyValues = false
        // Get a reference to a managed object context
        let context = persistentContainer.viewContext
        
        do {
            let objects = try context.fetch(fetchRequest)
            // Delete the objects
            for object in objects {
                context.delete(object)
            }
            try context.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save favorite \(error)")
        }
    }
}

//
//  CartManager.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 24/08/2021.
//

import Foundation

class CartManager {
    
    
    var items = [CartItem]()
    
    private init() {}
    static let instance             = CartManager()
    static private let defaults     = UserDefaults.standard
    
    
    enum Keys {
        static let CartItems  = "CartItems"
    }
    
    enum ErrorMessage: String , Error {
        case unableCartItems     = "Unable to Load cart items please try again..."
        case alreadyInFavorites  = "Already in Cart..."
    }
    
    enum PersistenceActionType {
        case add, remove
    }
    
    func updateWith(cartItems: CartItem , actionType: PersistenceActionType , complationHandler: @escaping (ErrorMessage?) -> Void) {
        reteriveCartItems { result in
            switch result {
            case.success(let items):
                var reterivedItems = items
                switch actionType {
                case .add :
                    guard !reterivedItems.contains(cartItems) else {
                        complationHandler(.alreadyInFavorites)
                        return
                    }
                    reterivedItems.append(cartItems)
                case .remove:
                    reterivedItems.removeAll { $0.id == cartItems.id }
                }
                
                complationHandler(self.saveItems(cartItems: reterivedItems))
                
            case .failure(let error) :
                complationHandler(error)
            }
        }
    }
    
    
    func reteriveCartItems(complationHandler: @escaping (Result<[CartItem] , ErrorMessage>) -> Void) {
        guard let cartData = CartManager.defaults.object(forKey: Keys.CartItems) as? Data else {
            complationHandler(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let items   = try decoder.decode([CartItem].self, from: cartData)
            complationHandler(.success(items))
        } catch {
            complationHandler(.failure(.unableCartItems))
        }
    }
    
    func saveItems(cartItems: [CartItem]) -> ErrorMessage? {
        do {
            let encoder = JSONEncoder()
            let encodedCartItems = try encoder.encode(cartItems)
            CartManager.defaults.set(encodedCartItems, forKey: Keys.CartItems)
            return nil
        } catch {
            return .unableCartItems
        }
    }
}

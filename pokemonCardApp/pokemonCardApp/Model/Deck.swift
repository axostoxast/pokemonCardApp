//
//  Deck.swift
//  pokemonCardApp
//
//  Created by 鈴木綜太 on 2022/03/27.
//

import Foundation
import RealmSwift

class Deck: Object, Identifiable {
    @Persisted var deckName = ""
    @Persisted var deckCode = ""
    @Persisted var deckMemo = ""
}

extension Deck {
    // 追加
    static func addDeck(deckName: String, deckCode: String, deckMemo: String) {
        let deck = Deck()
        deck.deckName = deckName
        deck.deckCode = deckCode
        deck.deckMemo = deckMemo
        
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(deck)
        }
    }
    
    // 更新
    static func updateDeck(deck: Deck, newDeckName: String, newDeckCode: String, newDeckMemo: String) {
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            deck.deckName = newDeckName
            deck.deckCode = newDeckCode
            deck.deckMemo = newDeckMemo
        }
    }
    
    // 取得
    static func fetchAllDeck() -> [Deck]? {
        guard let localRealm = try? Realm() else { return nil }
        let decks = localRealm.objects(Deck.self)
        return Array(decks)
    }
    
    // 削除
    static func deleteDeck(deck: Deck) {
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.delete(deck)
        }
    }
}
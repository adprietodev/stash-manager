//
//  SupabaseConfig.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation
import Supabase

class SupabaseConfig {
    static let shared = SupabaseConfig()

    private init() {}

    // MARK: - Properties
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://anhiketugwialdmmherd.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFuaGlrZXR1Z3dpYWxkbW1oZXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMzNzc5NjUsImV4cCI6MjAyODk1Mzk2NX0.38ATvI26tc6ua8_Wg3isSkreoaRzS6BzQB9d_WZTdBM")
}

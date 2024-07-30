import SwiftUI

// ViewModel for managing country selection in the country selection view
class CountrySelectionViewModel: ObservableObject {
    @Published var searchQuery = "" // Binding for search query text
    @Published var selectedCountries = [String]() // List of selected countries
    
    // Predefined list of top countries
    let topCountries = ["Australia", "Canada", "India", "United Arab Emirates", "United Kingdom", "United States"]
    
    // List of all countries fetched from Locale
    let allCountries = Locale.isoRegionCodes.map { Locale.current.localizedString(forRegionCode: $0) ?? $0 }.sorted()

    // Filtered list of top countries based on search query
    var filteredTopCountries: [String] {
        if searchQuery.isEmpty {
            return topCountries
        } else {
            return topCountries.filter { $0.contains(searchQuery) }
        }
    }
    
    // Filtered list of all countries based on search query
    var filteredCountries: [String] {
        if searchQuery.isEmpty {
            return allCountries
        } else {
            return allCountries.filter { $0.contains(searchQuery) }
        }
    }
    
    // Toggles the selection of a country
    func toggleCountrySelection(_ country: String) {
        if selectedCountries.contains(country) {
            selectedCountries.removeAll { $0 == country }
        } else {
            selectedCountries.append(country)
        }
    }
    
    // Deselects a specific country
    func deselectCountry(_ country: String) {
        selectedCountries.removeAll { $0 == country }
    }
}

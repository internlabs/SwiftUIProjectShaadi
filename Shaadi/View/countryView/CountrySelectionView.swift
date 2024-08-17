import SwiftUI

struct CountrySelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = CountrySelectionViewModel()
    @Binding var selectedCountry: String // Binding to the selected country

    var body: some View {
        NavigationView {
            VStack {
                // Header with title and close button
                HStack {
                    Text("Country 🌍")
                        .font(.custom("KumbhSans-Bold", size: 24))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 30, height: 30)
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.trailing)
                }
                .padding(.top)
                
                // Search bar for country search
                SearchBarView(text: $viewModel.searchQuery)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        // Display selected countries if any
                        if !viewModel.selectedCountries.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(viewModel.selectedCountries, id: \.self) { country in
                                        // Updated button style for removing selected countries
                                        Button(action: {
                                            viewModel.deselectCountry(country)
                                        }) {
                                            HStack {
                                                Text(country)
                                                Image(systemName: "xmark")
                                            }
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(Color.red)
                                            .foregroundColor(.white)
                                            .cornerRadius(20)
                                        }
                                        .padding(.leading, 4)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .padding(.vertical)
                        }
                        
                        // Display country lists based on search query
                        if viewModel.searchQuery.isEmpty {
                            // Top Countries section
                            Section(header: Text("Top Countries")
                                .font(.custom("KumbhSans-SemiBold", size: 18))) {
                                ForEach(viewModel.filteredTopCountries, id: \.self) { country in
                                    CountryRowView(country: country, isSelected: viewModel.selectedCountries.contains(country)) {
                                        selectedCountry = country // Update the selected country
                                        viewModel.toggleCountrySelection(country)
                                        self.presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                                    }
                                }
                            }
                            
                            // All Countries section
                            Section(header: Text("All Countries")
                                .font(.custom("KumbhSans-SemiBold", size: 18))) {
                                ForEach(viewModel.filteredCountries, id: \.self) { country in
                                    CountryRowView(country: country, isSelected: viewModel.selectedCountries.contains(country)) {
                                        selectedCountry = country // Update the selected country
                                        viewModel.toggleCountrySelection(country)
                                        self.presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                                    }
                                }
                            }
                        } else {
                            // Filtered countries based on search query
                            ForEach(viewModel.filteredCountries, id: \.self) { country in
                                CountryRowView(country: country, isSelected: viewModel.selectedCountries.contains(country)) {
                                    selectedCountry = country // Update the selected country
                                    viewModel.toggleCountrySelection(country)
                                    self.presentationMode.wrappedValue.dismiss() // Dismiss the sheet
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    CountrySelectionView(selectedCountry: .constant(""))
}

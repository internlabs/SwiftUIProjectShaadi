import SwiftUI

struct CountryRowView: View {
    let country: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            // Display the country name with color based on selection
            Text(country)
                .foregroundColor(isSelected ? .red : .black)
            
            Spacer()
            
            // Display a checkmark if the country is selected
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(.red)
            }
        }
        .padding()
        // Change background color and corner radius based on selection
        .background(isSelected ? Color(.systemGray6) : Color.white)
        .cornerRadius(8)
        // Trigger the action on tap
        .onTapGesture {
            action()
        }
    }
}

// Preview for CountryRowView
struct CountryRowView_Previews: PreviewProvider {
    @State static var isSelected = false
    
    static var previews: some View {
        CountryRowView(country: "India", isSelected: isSelected) {
            isSelected.toggle()
        }
    }
}

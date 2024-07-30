import SwiftUI

struct SearchBarView: View {
    @Binding var text: String // Binding variable to hold the search text

    var body: some View {
        HStack {
            // TextField for user to input search text
            TextField("Search your Country", text: $text)
                .foregroundColor(.primary) // Set text color to primary color
                .padding(8) // Padding inside the TextField
                .background(Color(.systemGray6)) // Background color for the TextField
                .cornerRadius(8) // Rounded corners for the TextField
                .padding(.horizontal) // Horizontal padding around the TextField
        }
        .padding(.vertical, 8) // Vertical padding for the HStack
    }
}

// Preview for SearchBarView
struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = "" // State variable for preview

    static var previews: some View {
        SearchBarView(text: $searchText) // Pass state variable to SearchBarView
    }
}

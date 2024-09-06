import SwiftUI

// A custom checkbox view
struct CheckBox: View {
    @Binding var isChecked: Bool // Binding to the checked state
    var label: () -> Text // Closure to provide the label text
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                // Custom checkbox representation
                RoundedRectangle(cornerRadius: 5.0)
                    .stroke(lineWidth: 1)
                    .frame(width: 20, height: 20)
                    .cornerRadius(5.0)
                    .overlay {
                        // Checkmark image based on isChecked state
                        Image(systemName: isChecked ? "checkmark" : "")
                            .foregroundColor(isChecked ? .blue : .clear)
                    }
                    .onTapGesture {
                        // Toggle isChecked state with animation
                        withAnimation(.spring()) {
                            isChecked.toggle()
                        }
                    }
                
                // Display the label next to the checkbox
                label()
            }
            
            // Spacer to align text below checkbox (commented out)
//            if !isChecked {
//               // Spacer()
//            }
        }
    }
}

// Custom toggle style for square checkboxes
struct SquareCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // Custom checkbox representation
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 1)
                .frame(width: 20, height: 20)
                .cornerRadius(5.0)
                .overlay {
                    // Checkmark image based on configuration.isOn state
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundStyle(.blue)
                        .foregroundColor(.blue)
                        
                }
                .onTapGesture {
                    // Toggle isOn state with animation
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }

            // Display the label next to the checkbox
            configuration.label
        }
    }
}

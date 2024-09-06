import SwiftUI

struct HeightSelectionView: View {
    @State private var isHeightPickerPresented = false
    @State private var selectedFeet = 5
    @State private var selectedInches = 8
    
    let feetOptions = Array(5...7) // Options for feet (e.g., 5, 6, 7)
    let inchOptions = Array(0...11) // Options for inches (0 to 11)

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                // Header with title and close button
                HStack {
                    Text("Set your height? 📏 ")
                        .font(.custom(FontsManager.KumbhSans.Bold, size: 20))
                        .foregroundColor(Color.black)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle dismiss action
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 24))
                            .padding(.trailing)
                    }
                }
                .padding(.top)
                
                // Pickers for feet and inches
                HStack(spacing: 16) {
                    // Feet Picker
                    Picker("Feet", selection: $selectedFeet) {
                        ForEach(feetOptions, id: \.self) { option in
                            Text("\(option) feet")
                                .tag(option)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 120)
                    .clipped()

                    // Inches Picker
                    Picker("Inches", selection: $selectedInches) {
                        ForEach(inchOptions, id: \.self) { option in
                            Text("\(option) inches")
                                .tag(option)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 120)
                    .clipped()
                }
                
                // Done Button
                Button(action: {
                    // Action when "Done" is pressed
                }) {
                    Text("Done")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 20)
            }
            .background(Color.white)
            .cornerRadius(20)
        }
//        .padding(.horizontal, 16)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.black.opacity(0.4)) // To simulate a background dimming effect
//        .edgesIgnoringSafeArea(.all)
    }
}

struct HeightSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HeightSelectionView()
    }
}

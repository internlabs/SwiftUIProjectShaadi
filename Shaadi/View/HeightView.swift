import SwiftUI

struct HeightView: View {
    @State private var selectedFeet = 5
    @State private var selectedInches = 8
    
    let feetOptions = Array(5...7) // Options for feet (e.g., 5, 6, 7)
    let inchOptions = Array(0...11) // Options for inches (0 to 11)
    
    var body: some View {
        NavigationView {
            VStack {
                // Title text
                Text("Let's start with the basics")
                    .font(.title)
                    .padding()
                
                // Subtitle text
                Text("Set your height?")
                    .font(.headline)
                    .padding(.top, 20)
                
                // Picker for height selection
                HStack {
                    Picker(selection: $selectedFeet, label: Text("")) {
                        ForEach(feetOptions, id: \.self) { feet in
                            Text("\(feet) feet")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                    
                    Picker(selection: $selectedInches, label: Text("")) {
                        ForEach(inchOptions, id: \.self) { inch in
                            Text("\(inch) inch")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                }
                .padding()
                
                // Done button
                Button(action: {
                    print("Height selected: \(selectedFeet) feet \(selectedInches) inches")
                }) {
                    Text("Done")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

#Preview {
    HeightView()
}

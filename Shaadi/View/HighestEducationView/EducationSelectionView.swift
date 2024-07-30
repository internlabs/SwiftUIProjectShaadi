import SwiftUI

struct EducationSelectionView: View {
    @State private var searchText = ""
    @State private var selectedDegrees: Set<String> = ["A.M.E", "B.Arch"]
    
    let allDegrees = [
        "A.M.E", "B.Arch", "B.Des", "B.E/B.Tech", "B.FAD",
        "B.FTech", "B.Pharma", "B.Tech L.L.B", "BID"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Highest Education 🎓")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Type to Search", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(selectedDegrees), id: \.self) { degree in
                        Button(action: {
                            selectedDegrees.remove(degree)
                        }) {
                            HStack {
                                Text(degree)
                                Image(systemName: "xmark")
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                        }
                    }
                }
            }
            
            Text("Choose your Degree")
                .font(.headline)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(allDegrees, id: \.self) { degree in
                        HStack {
                            Image(systemName: selectedDegrees.contains(degree) ? "checkmark.square.fill" : "square")
                                .foregroundColor(selectedDegrees.contains(degree) ? .blue : .gray)
                            Text(degree)
                        }
                        .onTapGesture {
                            if selectedDegrees.contains(degree) {
                                selectedDegrees.remove(degree)
                            } else {
                                selectedDegrees.insert(degree)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .padding()
    }
}
#Preview {
    EducationSelectionView()
}

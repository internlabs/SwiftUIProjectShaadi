import SwiftUI

struct EducationAndCareerView: View {
    @State private var highestEducation: String = ""
    @State private var professionDescription: String = ""
    @State private var salary: String = ""
    @ObservedObject var viewModel = EmploymentViewModel()
    @State private var textEditorHeight: CGFloat = 40 // Initial height
    // Environment variable to manage presentation
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                // Back button
                HStack {
                    Button(action: {
                        // Action to go back
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                .padding()
                
                // Title text
                Text("Enter your education and career details 👜")
                    .font(.custom("KumbhSans-Bold", size: 24))
                    .padding(.horizontal)
                
                // Highest education text field
                TextField("Highest Education", text: $highestEducation)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                // "Employed In" text
                Text("Employed In")
                    .font(.custom("KumbhSans-Regular", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                    .padding(.horizontal)
                
                // Employment options buttons
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 10) {
                        ForEach([EmploymentOption.privateSector, EmploymentOption.governmentPublicSector], id: \.self) { option in
                            employmentButton(for: option)
                        }
                    }
                    HStack(spacing: 10) {
                        ForEach([EmploymentOption.civilService, EmploymentOption.defense], id: \.self) { option in
                            employmentButton(for: option)
                        }
                    }
                    HStack(spacing: 10) {
                        ForEach([EmploymentOption.businessSelfEmployed, EmploymentOption.notWorking], id: \.self) { option in
                            employmentButton(for: option)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Profession description text field (TextEditor)
                VStack(alignment: .leading) {
                    Text("Enter description about your profession")
                        .font(.custom("KumbhSans-Regular", size: 16))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .topLeading) {
                        // TextEditor for multiline input
                        TextEditor(text: $professionDescription)
                            .frame(height: max(textEditorHeight, 40)) // Dynamic height
                            .padding(8)
                            .background(Color(.systemGray6)) // Match TextField color
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .onAppear {
                                // Fix TextEditor background color on appearance
                                UITextView.appearance().backgroundColor = .clear
                            }
                            .onChange(of: professionDescription) { _ in
                                adjustTextEditorHeight() // Adjust height based on content
                            }
                    }
                }
                .padding(.top, 20)
                
                // Salary text field
                TextField("Enter your Salary", text: $salary)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 20)
                
                Spacer()
                
                // Next button
                Button(action: {
                    // Action for next button
                }) {
                    Text("Tell us about your social status")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 10)
            }
            .padding(.vertical, 12)
        }
        .navigationBarHidden(true)
    }
    
    // Employment button view
    @ViewBuilder
    private func employmentButton(for option: EmploymentOption) -> some View {
        Button(action: {
            viewModel.selectedOption = option
        }) {
            Text(option.rawValue)
                .foregroundColor(Color.black.opacity(0.50))
                .frame(width: buttonWidth(for: option), height: 35)
                .background(Color.white)
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .inset(by: 1)
                        .stroke(
                            viewModel.selectedOption == option ? Color.red : Color.gray,
                            lineWidth: 1
                        )
                )
        }
    }
    
    // Determine button width based on employment option
    private func buttonWidth(for option: EmploymentOption) -> CGFloat {
        switch option {
        case .privateSector:
            return 131
        case .governmentPublicSector:
            return 220
        case .civilService:
            return 120
        case .businessSelfEmployed:
            return 210
        case .notWorking:
            return 120
        case .defense:
            return 100
        }
    }
    
    // Adjust the TextEditor height based on content
    private func adjustTextEditorHeight() {
        // Calculate the height needed based on content size
        let textSize = CGSize(width: UIScreen.main.bounds.width - 64, height: .infinity)
        let estimatedHeight = professionDescription.boundingRect(
            with: textSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: 16)],
            context: nil
        ).height
        
        // Ensure a minimum height of 40, and update the height dynamically
        textEditorHeight = max(estimatedHeight, 40)
    }
}

struct EducationAndCareerView_Previews: PreviewProvider {
    static var previews: some View {
        EducationAndCareerView()
    }
}

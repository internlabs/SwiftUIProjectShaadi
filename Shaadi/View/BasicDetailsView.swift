import SwiftUI

struct BasicDetailsView: View {
    @State private var selectedGender: String? = nil
    @State private var dateOfBirth = Date()
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var location: String = ""
    @State private var isImagePickerPresented = false
    @State private var profileImage: Image? = nil
    @State private var inputImage: UIImage? = nil
    // State to control bottom sheet presentation
    @State private var isCountrySelectionPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Back button
                HStack {
                    Button(action: {
                        // Action to go back
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                
                // Title text
                Text("Enter your basic details ✍️")
                    .font(.custom("KumbhSans-SemiBold", size: 24))
                
                // Profile image button
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    } else {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 20)
                .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $inputImage)
                }
                
                // Add profile picture text
                Text("Add Profile Picture")
                    .font(.custom("KumbhSans-Regular", size: 16))
                    .foregroundColor(.gray)
                
                // Form fields
                VStack(spacing: 20) {
                    // Gender selection buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            selectedGender = "Male"
                        }) {
                            Text("Male")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedGender == "Male" ? Color.red : Color(.systemGray6))
                                .cornerRadius(8)
                                .foregroundColor(selectedGender == "Male" ? .white : .black)
                        }
                        
                        Button(action: {
                            selectedGender = "Female"
                        }) {
                            Text("Female")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(selectedGender == "Female" ? Color.red : Color(.systemGray6))
                                .cornerRadius(8)
                                .foregroundColor(selectedGender == "Female" ? .white : .black)
                        }
                    }
                    
                    // Date of Birth picker
                    DatePicker("Date of Birth", selection: $dateOfBirth, displayedComponents: .date)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Height and Weight text fields
                    HStack {
                        TextField("Height (cms)", text: $height)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        TextField("Weight (kg)", text: $weight)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    
                    // Location text field
                    TextField("Location", text: $location)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    // Button to use current location
                    Button(action: {
                        isCountrySelectionPresented = true // Show the bottom sheet
                    }) {
                        HStack {
                            Image(systemName: "location")
                            Text("Use your current location")
                        }
                        .foregroundColor(Color.red)
                    }
                    .sheet(isPresented: $isCountrySelectionPresented) {
                        CountrySelectionView(selectedCountry: $location)
                            .presentationDetents([.medium, .height(460)])
                            .presentationCornerRadius(30)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Navigation link to Education and Career view
                NavigationLink(destination: EducationAndCareerView()) {
                    Text("Education and Career")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
            }
        }
    }
    
    // Function to load image from image picker
    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }
}

struct BasicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BasicDetailsView()
    }
}

import SwiftUI

struct RegistrationView: View {
    //MARK: State variables for storing user input and controlling UI elements
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var showPassword: Bool = false
    @AppStorage("showNameToAll") private var showNameToAll: Bool = true
    @State private var navigateToAuthView: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                // MARK: HEADER
                Text("Let's get to know each other 👋")
                    .font(.custom(FontsManager.KumbhSans.SemiBold, size: 24))
                    .padding(.bottom, 30)
                
                //MARK: TextField for entering full name
                TextField("Enter Full Name", text: $fullName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                // MARK: Checkbox for showNameToAll
                VStack {
                    CheckBox(isChecked: $showNameToAll) {
                        Text("Show my name to all")
                            .font(.custom(FontsManager.KumbhSans.Medium, size: 12))
                    }
                    .padding(.trailing, 210)
                    
                    HStack {
                        if !showNameToAll {
                            Text("If you turn off, you won't be able to see name of other members")
                                .font(.custom(FontsManager.KumbhSans.Ligth, size: 11))
                                .foregroundColor(.gray)
                                .padding(.leading, 5)
                        }
                    }
                }
                
                // MARK: ENTER EMAIL
                TextField("Enter Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .textContentType(.emailAddress)
                
                // MARK: PASSWORD
                HStack {
                    if showPassword {
                        //MARK: TextField for visible password
                        TextField("Enter Password", text: $password)
                    } else {
                        //MARK: SecureField for hidden password
                        SecureField("Enter Password", text: $password)
                    }
                    //MARK: Button to toggle password visibility
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Text(showPassword ? "Hide" : "Show")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                // MARK: ENTER PHONE NUMBER
                TextField("Enter Phone Number", text: $phoneNumber)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.phonePad)
                    .textContentType(.telephoneNumber)
                
                // MARK: CONTACT PRIVACY
                Text("Contact Privacy Settings")
                    .font(.custom(FontsManager.KumbhSans.Medium, size: 14))
                    .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .padding(.trailing, 190)
                
                // Custom view for contact privacy settings
                ContactPrivacyView()
                    .padding(.bottom, 50)
                
                // MARK: Next Button
                NavigationLink(destination: AuthenticationView(phoneNumber: phoneNumber), isActive: $navigateToAuthView) {
                    Button(action: {
                        // MARK: Handle next action
                        navigateToAuthView = true
                    }) {
                        Text("Next")
                            .font(.custom(FontsManager.KumbhSans.SemiBold, size: 16))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.94, green: 0.29, blue: 0.29))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

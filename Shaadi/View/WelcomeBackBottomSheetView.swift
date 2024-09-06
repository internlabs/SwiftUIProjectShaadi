import SwiftUI

struct WelcomeBackBottomSheetView: View {
    @Binding var isPasswordEntered: Bool
    @State private var password = ""
    @State private var showPassword = false
    @State private var navigateToBasicDetails = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 25) {
                    // Header with Welcome text and close button
                    HStack {
                        Text("Welcome Back 👻")
                            .font(.custom("KumbhSans-Bold", size: 24))
                            .foregroundColor(.black)
                        
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
                    }
                    
                    // Subheader text
                    Text("Login to your Account with password")
                        .font(.custom("KumbhSans-Regular", size: 16))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                    
                    // Password field with show/hide toggle
                    HStack {
                        if showPassword {
                            TextField("Enter Password", text: $password)
                        } else {
                            SecureField("Enter Password", text: $password)
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Text(showPassword ? "Hide" : "Show")
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    
                    // Login button
                    Button(action: {
                        isPasswordEntered = !password.isEmpty
                        if isPasswordEntered {
                            navigateToBasicDetails = true
                        }
                    }) {
                        Text("Login to your account")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    .fullScreenCover(isPresented: $navigateToBasicDetails) {
                        BasicDetailsView()
                    }
                    
                    // Button for login with OTP
                    Button(action: {
                        // Action for login with OTP
                    }) {
                        Text("Login with One Time Password")
                            .foregroundColor(.red)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.red, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
        }
    }
}

struct WelcomeBackBottomSheetView_Previews: PreviewProvider {
    @State static var isPasswordEntered = false
    
    static var previews: some View {
        WelcomeBackBottomSheetView(isPasswordEntered: $isPasswordEntered)
    }
}

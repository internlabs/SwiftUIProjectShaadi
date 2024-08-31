import SwiftUI

struct AuthenticationView: View {
    // State variables for storing OTP input and managing focus
    @State private var otp = ["", "", "", ""]
    @FocusState private var focusedField: Int?
    
    // Phone number to be verified
    var phoneNumber: String
    
    // Environment variable to manage presentation
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // Back button
                    Button(action: {
                        // MARK: Action to go back
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                
                // Verification prompt
                Text("Verify your phone number 📱")
                    .font(.custom(FontsManager.KumbhSans.SemiBold, size: 24))
                    .padding(.top, 40)
                
                // Instructional text with the phone number
                Text("Enter 4-digit code we have sent to the phone number \(phoneNumber)")
                    .font(.custom(FontsManager.KumbhSans.Regular, size: 19))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 40)
                
                // OTP input fields
                HStack(spacing: 20) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("", text: $otp[index])
                            .frame(width: 50, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(focusedField == index ? Color("flamingoColor") : Color("grayColor"), lineWidth: 1)
                            )
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .focused($focusedField, equals: index)
                            .onAppear(perform: {
                                focusedField = 0
                            })
                            .onChange(of: otp[index]) { _, newValue in
                                if newValue.count == 1 {
                                    // Auto-focus on the next field when a digit is entered
                                    if index < 3 {
                                        focusedField = index + 1
                                    } else {
                                        focusedField = nil
                                    }
                                } else if newValue.isEmpty {
                                    // Auto-focus on the previous field when text is deleted
                                    if index > 0 {
                                        focusedField = index - 1
                                    }
                                }
                            }
                    }
                }
                .padding(.vertical, 20)
                
                // MARK: Footer
                HStack {
                    Text("Didn’t get the OTP?")
                        .font(.custom(FontsManager.KumbhSans.Regular, size: 16))
                        .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    
                    // Button to resend OTP
                    Button(action: {
                        // MARK: Action for Resend OTP button
                    }) {
                        Text("Resend Again")
                            .font(.custom(FontsManager.KumbhSans.Regular, size: 16))
                            .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29))
                    }
                }
                .padding()
                
                Spacer()
                
                // Navigation link to next view (registration success)
                NavigationLink(destination: RegistrationSuccessView()) {
                    Text("Next")
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
        .navigationBarHidden(true)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(phoneNumber: "+91 7977828994")
    }
}

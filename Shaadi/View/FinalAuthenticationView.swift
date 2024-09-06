import SwiftUI

struct FinalAuthenticationView: View {
    @State private var otp = ["", "", "", ""]
    @FocusState private var focusedField: Int?
    @State private var isShowingSheet = false
    @State private var isPasswordEntered = false
    @Environment(\.presentationMode) var presentationMode // Add this line

    var phoneNumber: String
    
    var body: some View {
        NavigationView {
            VStack {
                // Back button
                HStack {
                    Button(action: {
                        // Action to go back
                        presentationMode.wrappedValue.dismiss() // Dismiss the current view
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                
                // Header text
                Text("Enter the code sent on your \nnumber 📱")
                    .font(.custom("KumbhSans-SemiBold", size: 24))
                    .padding(.top, 40)
                
                // Subheader text
                Text("Enter 4-digit we have sent via the phone number \(phoneNumber)")
                    .font(.custom("KumbhSans-Regular", size: 19))
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
                
                // Footer with resend option
                HStack {
                    Text("Didn’t get the OTP?")
                        .font(.custom("KumbhSans-Regular", size: 16))
                        .foregroundColor(Color.black.opacity(0.50))
                    
                    Button(action: {
                        // Action for Resend button
                    }) {
                        Text("Resend Again")
                            .font(.custom("KumbhSans-Regular", size: 16))
                            .foregroundColor(Color(red: 0.94, green: 0.29, blue: 0.29))
                    }
                }
                .padding()
                
                Spacer()
                
                // Next button to show the bottom sheet
                Button(action: {
                    isShowingSheet.toggle()
                }) {
                    Text("Next")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
                .sheet(isPresented: $isShowingSheet) {
                    // Bottom sheet view
                    WelcomeBackBottomSheetView(isPasswordEntered: $isPasswordEntered)
                        .interactiveDismissDisabled(!isPasswordEntered)
                        .presentationDetents([.medium, .height(360)])
                        .presentationCornerRadius(30)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    FinalAuthenticationView(phoneNumber: "+91 7977828994")
}

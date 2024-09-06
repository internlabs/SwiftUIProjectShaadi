import SwiftUI

struct RegistrationSuccessView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // Success icon with a red circle background
                ZStack {
                    Circle()
                        .fill(Color.red.opacity(0.2))
                        .frame(width: 200, height: 200)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.red)
                }
                
                // Success message
                Text("Registration Successful")
                    .font(.custom(FontsManager.KumbhSans.Bold, size: 24))
                    .padding(.top, 20)
                
                // Description message
                Text("Your account has been created.\nYou can now login to your account to explore more.")
                    .font(.custom(FontsManager.KumbhSans.Regular, size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                
                Spacer()
                
                // Navigation link to login view
                NavigationLink(destination: PhoneNumberView()) {
                    Text("Continue to Login")
                        .font(.custom(FontsManager.KumbhSans.SemiBold, size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarHidden(true)
    }
}

struct RegistrationSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationSuccessView()
    }
}

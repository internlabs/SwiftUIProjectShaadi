import SwiftUI
import Combine

struct PhoneNumberView: View {
    @State var presentSheet = false
    @State var countryCode: String = "+91"
    @State var countryFlag: String = "🇮🇳"
    @State var countryPattern: String = "### ### ####"
    @State var countryLimit: Int = 17
    @State var mobPhoneNumber = ""
    @State private var searchCountry: String = ""
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var keyIsFocused: Bool
    
    let counrties: [CPData] = Bundle.main.decode("CountryNumbers.json")
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 50)
                
                // Header text
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Welcome Back 👻")
                            .font(.custom(FontsManager.KumbhSans.Bold, size: 24))
                            .foregroundColor(.black)
                        
                        Text("Login to your Account")
                            .font(.custom(FontsManager.KumbhSans.Regular, size: 16))
                            .foregroundColor(.black)
                            .padding(.top, 5)
                    }
                    .padding(.trailing, 120)
                }
                
                // Country code and phone number input
                HStack {
                    Button {
                        presentSheet = true
                        keyIsFocused = false
                    } label: {
                        Text("\(countryFlag) \(countryCode)")
                            .padding(10)
                            .frame(minWidth: 80, minHeight: 47)
                            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .foregroundColor(foregroundColor)
                    }
                    
                    TextField("", text: $mobPhoneNumber)
                        .placeholder(when: mobPhoneNumber.isEmpty) {
                            Text("Phone number")
                                .foregroundColor(.secondary)
                        }
                        .focused($keyIsFocused)
                        .keyboardType(.numbersAndPunctuation)
                        .onReceive(Just(mobPhoneNumber)) { _ in
                            applyPatternOnNumbers(&mobPhoneNumber, pattern: countryPattern, replacementCharacter: "#")
                        }
                        .padding(10)
                        .frame(minWidth: 80, minHeight: 47)
                        .background(backgroundColor, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .padding(.top, 30)
                .padding(.horizontal, 40)
                
                // Navigation link to OTP view
                NavigationLink(destination: FinalAuthenticationView(phoneNumber: "+91 7977828994")) {
                    Text("Send One Time Password")
                        .font(.custom(FontsManager.KumbhSans.SemiBold, size: 16))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.top, 20)
                }
                
                // Button to login using password
                Button(action: {
                    // Action for login using password
                }) {
                    Text("Login using Password")
                        .font(.custom(FontsManager.KumbhSans.SemiBold, size: 16))
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                }
                
                Spacer()
            }
            .background(Color.white)
            .navigationBarHidden(true)
            .sheet(isPresented: $presentSheet) {
                // Country selection sheet
                NavigationView {
                    List(filteredResorts) { country in
                        HStack {
                            Text(country.flag)
                            Text(country.name)
                                .font(.headline)
                            Spacer()
                            Text(country.code)
                                .foregroundColor(.secondary)
                        }
                        .onTapGesture {
                            self.countryFlag = country.flag
                            self.countryCode = country.code
                            self.countryPattern = country.pattern
                            self.countryLimit = country.limit
                            presentSheet = false
                            searchCountry = ""
                        }
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchCountry, prompt: "Your country")
                }
                .presentationDetents([.medium, .large])
            }
            .ignoresSafeArea(.keyboard)
        }
        .navigationBarHidden(true)
    }
    
    // Filtered list of countries based on search text
    var filteredResorts: [CPData] {
        if searchCountry.isEmpty {
            return counrties
        } else {
            return counrties.filter { $0.name.contains(searchCountry) }
        }
    }
    
    // Foreground color based on color scheme
    var foregroundColor: Color {
        if colorScheme == .dark {
            return Color(.white)
        } else {
            return Color(.black)
        }
    }
    
    // Background color based on color scheme
    var backgroundColor: Color {
        if colorScheme == .dark {
            return Color(.systemGray5)
        } else {
            return Color(.systemGray6)
        }
    }
    
    // Function to apply pattern on phone number
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
}

extension View {
    // Placeholder for TextField
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

// Extension to hide keyboard
extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

// Extension to disable view with opacity
extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberView(countryCode: "+91", countryFlag: "🇮🇳", countryPattern: "### ### ####", countryLimit: 17)
    }
}

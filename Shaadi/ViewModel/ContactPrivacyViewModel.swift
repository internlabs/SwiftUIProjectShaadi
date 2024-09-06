import SwiftUI

// ViewModel for managing the contact privacy options
class ContactPrivacyViewModel: ObservableObject {
    @Published var selectedOption: ContactPrivacyOption = .showToAll // Published property to hold the selected privacy option
}


import SwiftUI

// ViewModel for managing employment options
class EmploymentViewModel: ObservableObject {
    @Published var selectedOption: EmploymentOption? = nil // Published property to hold the selected employment option
}

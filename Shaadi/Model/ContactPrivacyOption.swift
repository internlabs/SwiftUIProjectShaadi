import Foundation

//MARK: Define an enumeration called ContactPrivacyOption which conforms to the String and CaseIterable protocols.
enum ContactPrivacyOption: String, CaseIterable {
    //MARK: Enumerations for different contact privacy options, each with a raw value of type String.
    
    //MARK: Represents the option to show contact information to everyone.
    case showToAll = "Show to all"
    //MARK: Represents the option to hide contact information from everyone.
    case hideFromAll = "Hide from all"
    //MARK: Represents the option to show contact information only to members the user expresses interest in.
    case showToInterested = "Show to the members I express interest in"
}

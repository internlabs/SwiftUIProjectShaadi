import Foundation

//MARK: Define an enumeration called EmploymentOption which conforms to the String and CaseIterable protocols.
enum EmploymentOption: String, CaseIterable {
    //MARK: Enumerations for different types of employment options, each with a raw value of type String.
    
    //MARK: Represents employment in the private sector.
    case privateSector = "Private Sector"
    //MARK: Represents employment in the government or public sector.
    case governmentPublicSector = "Government/Public Sector"
    //MARK: Represents employment in civil services.
    case civilService = "Civil Service"
    //MARK: Represents employment in the defense sector.
    case defense = "Defense"
    //MARK: Represents self-employment or owning a business.
    case businessSelfEmployed = "Business/ Self Employed"
    //MARK: Represents the state of not working or being unemployed.
    case notWorking = "Not Working"
}



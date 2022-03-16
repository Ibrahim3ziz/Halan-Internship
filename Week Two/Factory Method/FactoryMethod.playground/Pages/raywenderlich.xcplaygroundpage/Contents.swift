//: [Previous](@previous)
// https://www.raywenderlich.com/books/design-patterns-by-tutorials/v3.0/chapters/11-factory-pattern
// Creating a Factory pattern to generate job applicant response emails

import Foundation

public struct JobApplicant {
    public let name: String
    public let email: String
    public var status: Status
    
    public enum Status {
        case new
        case interview
        case hired
        case rejected
    }
}

public struct Email {
    public let subject: String
    public let messageBody: String
    public let recipientEmail: String
    public let senderEmail: String
}



// An applicant has a name, email, and four types of status. The email’s subject and messageBody will be different depending on an applicant’s status.

public struct EmailFactory {
    public let senderEmail: String
    
    public func createEmail(to recipient: JobApplicant) -> Email {
        let subject: String
        let messageBody: String
        
        switch recipient.status {
        case .new:
            subject = "We Received Your Application"
            messageBody =
                "Thanks for applying for a job here! " +
                "You should hear from us in 17-42 business days."
            
        case .interview:
            subject = "We Want to Interview You"
            messageBody =
                "Thanks for your resume, \(recipient.name)! " +
                "Can you come in for an interview in 30 minutes?"
            
        case .hired:
            subject = "We Want to Hire You"
            messageBody =
                    "Congratulations, \(recipient.name)! " +
                    "We liked your code, and you smelled nice. " +
                    "We want to offer you a position! Cha-ching! $$$"
            
        case .rejected:
            subject = "Thanks for Your Application"
            messageBody =
                   "Thank you for applying, \(recipient.name)! " +
                   "We have decided to move forward " +
                   "with other candidates. " +
                   "Please remember to wear pants next time!"
        }
        
        return Email(subject: subject, messageBody: messageBody, recipientEmail: recipient.email, senderEmail: senderEmail)
    }
}


var Ibrahim = JobApplicant(name: "Ibrahim Abdul Aziz", email: "ibrahim.aziz1198@gmail.com", status: .new)

let emailFactory =
  EmailFactory(senderEmail: "HalanEmployee@Halan.com")

// New
print(emailFactory.createEmail(to: Ibrahim), "\n")

// Interview
Ibrahim.status = .interview
print(emailFactory.createEmail(to: Ibrahim), "\n")

// Hired
Ibrahim.status = .hired
print(emailFactory.createEmail(to: Ibrahim), "\n")


//: [Next](@next)

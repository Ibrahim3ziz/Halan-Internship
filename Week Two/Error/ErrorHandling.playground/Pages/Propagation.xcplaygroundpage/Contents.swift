import UIKit



struct Recipe {
    let ingredients: [String]
    let steps: [String]
}

enum ParseRecipeError: Error {
    case parseError(line: Int, symbol: String)
    case noRecipeDetected
    case noIngredientsDetected
}

struct RecipeExtractior {
    let html: String
    
//    func extractRecipe() -> Recipe? {
//        do {
//            return try parseWebpage(html)
//        }
//        // Adding more information for the error.
//        catch let ParseRecipeError.parseError(line, symbol) {
//            print("Parsing failed at line \(line), and symbol \(symbol)")
//            return nil
//        }
//        catch {
//            print("Couldn't parse recipe")
//            return nil
//        }
//    }
    
    func extractRecipe() throws -> Recipe {
        return try parseWebpage(html)
        
    }
    
//    private func parseWebpage(_ html: String) throws -> Recipe {
//        let ingredients = try parseIngredients(html)
//        let steps = try parseSteps(html)
//        return Recipe(ingredients: ingredients, steps: steps)
//    }
    
    private func parseWebpage(_ html: String) throws -> Recipe {
        let ingredients = try parseIngredients(html)
        let steps = try parseSteps(html)
        return Recipe(ingredients: ingredients, steps: steps)
    }
    
    private func parseIngredients(_ html: String) throws -> [String] {
        
        do {
            return try parseIngredients(html)
        }
        catch {
            throw ParseRecipeError.noIngredientsDetected
        }
    }
    
    private func parseSteps(_ html: String) throws -> [String] {
        do {
            return try parseSteps(html)
        }
        catch {
            throw ParseRecipeError.noRecipeDetected
        }
    }
    
}

// MARK: -  Centralized Error Handler
struct ErrorHandler {
    // Singleton so that any code can reach the error handler.
    static let `default` = ErrorHandler()
    
    let genericMessage = "Sorry! something went wrong"
    
    func handleError(_ error: Error) {
        presentToUser(message: genericMessage)
    }
    
    func handleError(_ error: LocalizedError) {
        if let errorMessage = error.errorDescription {
            presentToUser(message: errorMessage)
        } else {
            presentToUser(message: genericMessage)
        }
    }
    
    private func presentToUser(message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "", style: .default))

        // Show alert dialog in iOS or OS X, or print to stderror
        print(message)
    }
}



let html = ""
let recipeExtractor = RecipeExtractior(html: html)

do {
    let recipe = try? recipeExtractor.extractRecipe()
    print(recipe)
}
catch {
    ErrorHandler.default.handleError(error)
}


// Implementing LocalizedError
extension ParseRecipeError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .parseError:
            return NSLocalizedString("The HTML file had unexpected symbols.", comment: "Parsing error reason unexpected symbols.")
        case .noIngredientsDetected:
        return NSLocalizedString("No ingredients were detected.", comment: "Parsing error no ingredients.")
        case .noRecipeDetected:
            return NSLocalizedString("No recipe was detected.", comment: "Parsing error no recipe.")
        }
    }
    
    var failureReason: String? {
        switch self {
        case let .parseError(line: line, symbol: symbol):
            return String(format: NSLocalizedString("Parsing data failed at line: %i and symbol: %@", comment: "Parsing error line symbol"),line, symbol)
        case .noIngredientsDetected:
            return NSLocalizedString("The recipe seems to be missing its ingredients.", comment: "Parsing error reason missing ingredients.")
        case .noRecipeDetected:
            return NSLocalizedString("The recipe seems to be missing its recipe.", comment: "Parsing error reason missing recipe")
        }
    }
    
    var recoverySuggestion: String? {
        return "Please try a different recipe."
    }
}

// String(format: NSLocalizedString("Parsing data failed at line: %i and symbol: %@", comment: "Parsing error line symbol"), line, symbol)


extension ParseRecipeError: CustomNSError {
    static var errorDomain: String { return "com.recipeextractor" }
    var errorCode: Int { return 300 }
    var errorUserInfo: [String: Any] {
            return [
                NSLocalizedDescriptionKey: errorDescription ?? "",
                NSLocalizedFailureReasonErrorKey: failureReason ?? "",
                NSLocalizedRecoverySuggestionErrorKey: recoverySuggestion ?? ""
            ]
        }
}

let nsError: NSError = ParseRecipeError.parseError(line: 3, symbol: "#") as NSError
print(nsError)





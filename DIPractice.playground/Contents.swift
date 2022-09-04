import UIKit

class A {
    var name = "after like"
}

class B {
    var aClass = A()
}

let b = B()
print(b.aClass.name)

//class Barista {
//    private let recipeNote: Recipe
//
//    // 생성자로 Injection
//    init(recipeNote: Recipe) {
//        self.recipeNote = recipeNote
//    }
//
//    func printRecipeNote() {
//        print(recipeNote.printRecipe())
//    }
//}

class Barista {
    var recipeNote: Recipe?

    func printRecipeNote() {
        print(recipeNote?.printRecipe())
    }
}

//class Barista {
//    func printRecipe(recipeNote: Recipe) {
//        recipeNote.printRecipe()
//    }
//}

class Recipe {
    private let coffeeBean: String = "아라비카"
    private let coffeeType: [String] = ["아메리카노", "라떼", "카라멜 마끼야또", "바닐라빈 라떼"]
    
    func printRecipe() {
        print("오늘의 커피 원두: ", coffeeBean)
        print("커피 레시피: ", coffeeType)
    }
}

let borabong = Barista()
borabong.recipeNote = Recipe()
borabong.printRecipeNote()

protocol RecipeNote {
    var coffee: String { get }
    var smoothie: String { get }
    var latte: String { get }
}

class Recipes: RecipeNote {
    var coffee: String
    var smoothie: String
    var latte: String
    
    init(coffee: String, smoothie: String, latte: String) {
        self.coffee = coffee
        self.smoothie = smoothie
        self.latte = latte
    }
}

class Baristas {
    var recipe: RecipeNote
    
    init(recipe: RecipeNote) {
        self.recipe = recipe
    }
}

let borabongBarista = Baristas(recipe: Recipes(coffee: "커피", smoothie: "스무디", latte: "라떼"))
print(borabongBarista.recipe.latte)

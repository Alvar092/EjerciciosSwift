import Cocoa

// MARK: - Exercise 1: count characters
// Solución 1: for-in
/// Cuenta la cantidad de veces que un carácter específico aparece en un texto: countCharacters
///
/// - parameters:
///   - text: un texto de tipo `String` en el cual se buscará el carácter.
///   - character: el carácter de tipo `Character` que se desea contar en el texto.
///
/// - returns: un entero (`Int`) que representa la cantidad de veces que el carácter aparece en el texto.
///
/// - note: la función diferencia entre mayúsculas y minúsculas (`A` no es lo mismo que `a`).
/// - important: el texto puede estar vacío. En ese caso, la función devolverá `0`.
///
/// Ejemplo de uso:
/// ```swift
/// let texto = "programación en Swift"
/// let cuenta = countCharacters(in: texto, character: "o")
/// print("La letra 'o' aparece \(cuenta) veces en el texto.")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// La letra 'o' aparece 2 veces en el texto.
/// ```

func countCharacters(text: String?, character: Character) -> Int {
    guard let text = text else {
        return 0
    }
    var counter = 0
    for char in text {
        if char == character{
            counter += 1
        }
    }
    return counter
}

let texto = "programación en Swift"
let cuenta = countCharacters(text: texto, character: "o")
print("La letra 'o' aparece \(cuenta) veces en el texto ")
    /// print("La letra 'o' aparece \(cuenta) veces en el texto.")
// MARK: - Exercise 1 con filter: count characters
/// Cuenta la cantidad de veces que un carácter específico aparece en un texto: countCharacters3
///
/// - parameters:
///   - text: un texto de tipo `String` en el cual se buscará el carácter.
///   - character: el carácter de tipo `Character` que se desea contar en el texto.
///
/// - returns: un entero (`Int`) que representa la cantidad de veces que el carácter aparece en el texto.
///
/// - note: la función diferencia entre mayúsculas y minúsculas (`A` no es lo mismo que `a`).
/// - important: el texto puede estar vacío. En ese caso, la función devolverá `0`.
///
/// # Implementación
/// La función hace uso del método `filter` de Swift para filtrar los caracteres del texto que coincidan con el carácter proporcionado.
/// Para más información sobre esta función, puedes acceder a la documentación [Filter](https://developer.apple.com/documentation/swift/string/filter(_:))
///
/// Ejemplo de uso:
/// ```swift
/// let texto = "programación en Swift"
/// let cuenta = countCharacters(in: texto, character: "o")
/// print("La letra 'o' aparece \(cuenta) veces en el texto.")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// La letra 'o' aparece 2 veces en el texto.
/// ```

func countCharacters3(text: String?, character: Character) -> Int {
    if let text = text {
        return text.filter{$0 == character}.count
    } else {
        return 0
    }
}

let texto1 = "programación en Swift"
let cuenta1 = countCharacters3(text: texto, character: "o")
print("La letra 'o' aparece \(cuenta1) veces en el texto ")


// MARK: - Exercise 2: remove duplicates
/// Elimina los caracteres duplicados de una cadena, manteniendo el orden original: removeDuplicates
///
/// - parameters:
///   - fromString: la cadena de tipo `String` de la cual se eliminarán los caracteres duplicados.
///
/// - returns: una nueva cadena de tipo `String` que contiene los mismos caracteres de la cadena original pero sin repeticiones y respetando el orden en que aparecen.
///
/// - note: La función es sensible a mayúsculas y minúsculas (`A` se considera diferente de `a`).
/// - important: Se mantiene solo la primera aparición de cada carácter. Si el texto está vacío, la función devolverá una cadena vacía.
///
///
/// Ejemplo de uso:
/// ```swift
/// let texto = "programación"
/// let textoSinDuplicados = removeDuplicates(fromString: texto)
/// print("Texto sin duplicados: \(textoSinDuplicados)")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// Texto sin duplicados: programción
/// ```

func removeDuplicates(fromString: String) -> String {
    var result = ""
    
    for char in fromString {
        if result.contains(char) == false {
            result.append(char)
        }
    }
    return result
}

let texto2 = "programación"
let textoSinDuplicados = removeDuplicates(fromString: texto2)
print("Texto sin duplicados: \(textoSinDuplicados)")





// MARK: - Exercise 3: condense whitespace
/// Elimina los caracteres en blanco repetidos de una cadena, manteniendo únicamente un único espacio entre palabras: condense
///
/// - parameters:
///   - str: la cadena de tipo `String` que puede contener caracteres en blanco repetidos.
///
/// - returns: una nueva cadena de tipo `String` con los caracteres en blanco redundantes eliminados. Asimismo, se eliminan los espacios en blanco iniciales y finales.
///
/// - note: La función elimina todos los caracteres en blanco consecutivos (incluidos los tabuladores), dejando solamente un único espacio en su lugar. Funciona también con cadenas vacías y cadenas que solo contienen espacios.
/// - important: Si la cadena contiene solo espacios en blanco, se devolverá una cadena vacía.
///
/// # Implementación
/// La función debe implementarse utilizando sentencias `if` para verificar las condiciones
///
/// Ejemplo de uso:
/// ```swift
/// let texto = "   Hola    Swift   Developers   "
/// let textoCondensado = condense(texto)
/// print("'\(textoCondensado)'")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// 'Hola Swift Developers'
/// ```

func condenseWhiteSpace(str: String) -> String {
    var result = ""
    var alreadyOne = false
    
    for char in str{
        if char == " " || char == "\t" {
            if alreadyOne == false{
                result.append(char)
                alreadyOne = true
            }
        } else {
            result.append(char)
            alreadyOne = false
        }
    }
    return result.trimmingCharacters(in: .whitespaces)
}

let texto3 = "   Hola    Swift   Developers   "
let textoCondensado = condenseWhiteSpace(str: texto3)
print("'\(textoCondensado)'")

// MARK: - Exercise 4: classify
/// Clasifica los caracteres de una cadena en dos categorías: vocales y caracteres que no son vocales (consonantes): classify
///
/// - parameters:
///   - str: la cadena de tipo `String` que se va a analizar.
///
/// - returns: una tupla con dos valores:
///      - `vowels`: el número de vocales que contiene la cadena.
///      - `consonants`: el número de caracteres que no son vocales, considerando solo letras.
///
/// - note: La función diferencia entre vocales mayúsculas y minúsculas pero las agrupa ambas como vocales.
/// - important: Sólo se consideran las letras para esta clasificación; cualquier carácter que no sea letra (como números, signos de puntuación o espacios) será ignorado.
///
/// Ejemplo de uso:
/// ```swift
/// let texto = "Swift es Genial!"
/// let clasificacion = classify(texto)
/// print("Vocales: $clasificacion.vowels), Consonantes: \(clasificacion.consonants)")
/// ```
///
/// Output esperado para el ejemplo anterior:
/// ```
/// Vocales: 6, Consonantes: 9
/// ```



func classify(str: String) -> (vowels: Int, consonants: Int) {
    let vowel = "aeiouAEIOU"
    var vowelsCount = 0
    var consonantCount = 0
    for char in str {
        if char.isLetter{
            if vowel.contains(char){
                vowelsCount += 1
            } else {
                consonantCount += 1
            }
        }
    }
    return (vowelsCount, consonantCount)
}

let texto4 = "Swift es Genial!"
let clasificacion = classify(str: texto4)
print("Vocales: \(clasificacion.vowels), Consonantes: \(clasificacion.consonants)")


// MARK: - Exercise 5: fizz buzz
/// Genera una lista de resultados de una variante del problema clásico "FizzBuzz" para los números del 1 al 100: fizzBuzz
///
/// - returns: Un array de cadenas (`[String]`) que contiene el resultado para los números del 1 al 100,
/// siguiendo estas reglas:
///    - Si el número es divisible por 3, se agrega "Fizz" al array.
///    - Si es divisible por 5, se agrega "Buzz" al array.
///    - Si es divisible tanto por 3 como por 5, se agrega "FizzBuzz" al array.
///    - Si no es divisible por ninguno, se agrega el número mismo (como cadena).
///
/// # Implementación
/// Para la implementación, es útil conocer el operador `%`
///
/// Ejemplo de uso:
/// ```swift
/// let resultados = fizzBuzz()
/// print(resultados)
/// ```
///
/// Output esperado para un fragmento:
/// ```
/// ["1", "2", "Fizz", "4", "Buzz", "Fizz", ..., "FizzBuzz"]
/// ```
func fizzBuzz() -> [String]{
    var result:[String] = []
    for number in 1...100 {
        if number % 3 == 0 && number % 5 == 0{
            result.append("FizzBuzz")
        } else if number % 3 == 0 {
            result.append("Fizz")
        } else if number % 5 == 0 {
            result.append("Buzz")
        } else {
            result.append("\(number)")
        }
    }
    return result
    }

let resultados = fizzBuzz()
print(resultados)

// MARK: Exercise 7: contains
/// Verifica si una cadena (*hayStack*) contiene otra cadena (*needle*): contains
///
/// - parameters:
///   - hayStack: La cadena principal que será inspeccionada (el "pajar").
///   - needle: La subcadena que estamos buscando en el *hayStack* (la "aguja").
///
/// - returns: `true` si la *needle* está contenida dentro de la *hayStack*, de lo contrario, `false`.
///
/// - note:
///    - La búsqueda diferencia entre mayúsculas y minúsculas ("a" no es igual a "A").
///    - Si `needle` está vacío, se considera que está contenido en cualquier `hayStack` y la función devolverá `true`.
///    - Si `hayStack` es más corto que `needle`, la función devolverá `false`.
///
/// Ejemplo de uso:
/// ```swift
/// let resultado1 = contains(hayStack: "Hola mundo", needle: "mundo")
/// print(resultado1) // true
///
/// let resultado2 = contains(hayStack: "Hola mundo", needle: "Swift")
/// print(resultado2) // false
///
/// let resultado3 = contains(hayStack: "Hola mundo", needle: "")
/// print(resultado3) // true
/// ```

func contains(hayStack: String, needle: String) -> Bool {
    var result = false
    guard hayStack.count > needle.count else {
        return false
    }
    guard needle != "" else {
        return true
    }
   
    return hayStack.contains((needle))
}

let resultado7 = contains(hayStack: "Hola mundo", needle: "mundo")
print(resultado7) // true



// MARK: - Exercise 8: find
/// Encuentra la posición inicial de una subcadena (*needle*) dentro de una cadena (*hayStack*): find
///
/// - parameters:
///   - hayStack: La cadena principal en la que se desea buscar (el "pajar").
///   - needle: La subcadena que se desea localizar dentro del *hayStack* (la "aguja").
///
/// - returns: Un entero representando la posición inicial (basada en cero) de la *needle* dentro del *hayStack*.
/// Si no se encuentra la *needle*, devuelve la constante `NSNotFound`.
///
/// - note:
///    - La función utiliza `hayStack.range(of:)` para determinar el rango donde aparece la *needle*.
///    - La constante `NSNotFound` (definida en Cocoa) se utiliza como valor estándar para indicar que no se encontró la *needle*.
///
/// - important:
///    - Si alguna de las cadenas ingresadas está vacía, la función retorna `NSNotFound` de inmediato.
///    - La búsqueda diferencia entre mayúsculas y minúsculas. Por ejemplo, `"Swift"` y `"swift"` no coinciden.
///
/// Ejemplo de uso:
/// ```swift
/// let resultado1 = find(hayStack: "Hola mundo", needle: "mundo")
/// print(resultado1) // 5
///
/// let resultado2 = find(hayStack: "Hola mundo", needle: "Swift")
/// print(resultado2) // NSNotFound
///
/// let resultado3 = find(hayStack: "Hola mundo", needle: "")
/// print(resultado3) // NSNotFound
/// ```

func find (hayStack: String, needle: String) -> Int {
    guard hayStack != "" && needle != "" else {
        return NSNotFound
    }
    
    guard hayStack.range(of: needle) != nil  else {
        return NSNotFound
    }
    
    guard let range = hayStack.range(of: needle) else {
        return NSNotFound
    }
    
    let start = hayStack.distance(from: hayStack.startIndex, to: range.lowerBound)
    return start
}

let resultado8 = find(hayStack: "Hola mundo", needle: "mundo")
print(resultado8) // 5

let resultado9 = find(hayStack: "Hola mundo", needle: "Swift")
print(resultado9) // NSNotFound

let resultado10 = find(hayStack: "Hola mundo", needle: "")
print(resultado10) // NSNotFound

// MARK: - Exercise 10: containsOccurrences
/// Verifica si una cadena (*hayStack*) contiene una subcadena específica (*needle*) exactamente un número determinado de veces.
///
/// - parameters:
///   - hayStack: La cadena principal en la que se desea buscar (el "pajar").
///   - needle: La subcadena que se desea localizar dentro del *hayStack* (la "aguja").
///   - numOfOccs: Un entero que indica el número exacto de ocurrencias esperadas de *needle* en el *hayStack*.
///     - Si `numOfOccs < 0`, la función devuelve `false`.
///     - Si `numOfOccs == 0`, la función comprueba si *needle* aparece **cero veces** dentro de *hayStack*.
///     - Si `numOfOccs > 0`, la función comprueba si *needle* aparece exactamente el número indicado.
///
/// - returns: `true` si la cantidad de ocurrencias coincide con `numOfOccs`, de lo contrario, `false`.
///
/// - note:
///    - Si el *needle* está vacío, el método `components(separatedBy:)` puede dividir el *hayStack* en sus componentes de manera inesperada, no garantizando los resultados deseados. En este caso, se debería decidir un comportamiento claro.
///    - La lógica actual diferencia entre mayúsculas y minúsculas: `"Swift"` es diferente de `"swift"`.
///
/// Ejemplo de uso:
/// ```swift
/// let resultado1 = containsOccurrences(hayStack: "Hola mundo mundo", needle: "mundo", numOfOccs: 2)
/// print(resultado1) // true
///
/// let resultado2 = containsOccurrences(hayStack: "Hola mundo", needle: "Swift", numOfOccs: 0)
/// print(resultado2) // true
///
/// let resultado3 = containsOccurrences(hayStack: "Hola mundo", needle: "o", numOfOccs: -1)
/// print(resultado3) // false
/// ```

func containsOccurrences(hayStack: String, needle: String, numOfOccs: Int ) -> Bool {
    guard numOfOccs >= 0 else {
        return false
    }
    guard needle != "" else {
        return false
    }
    
    let needlesX = hayStack.components(separatedBy: needle)
    let occurrences = needlesX.count - 1
    
    return occurrences == numOfOccs
}

let resultado11 = containsOccurrences(hayStack: "Hola mundo mundo", needle: "mundo", numOfOccs: 2)
print(resultado11) // true

let resultado12 = containsOccurrences(hayStack: "Hola mundo", needle: "Swift", numOfOccs: 0)
print(resultado12) // true

let resultado13 = containsOccurrences(hayStack: "Hola mundo", needle: "o", numOfOccs: -1)
print(resultado13) // false



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
    var count = 0
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
    return result
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


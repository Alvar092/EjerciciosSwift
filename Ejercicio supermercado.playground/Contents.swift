/*:
# Ejercicio 1: gestión de un Supermercado
 
 ![Ejercicio de supermercado](supermercado.png)

 Imagina que estás desarrollando un sistema simple para gestionar un supermercado. Usa los conceptos que has aprendido (tipos de datos, arrays, sets, tuplas y diccionarios) para completar las tareas siguientes:
 
 */
/*:
 ## Paso 1: Tipos de datos

 Define las siguientes constantes y variables con el tipo adecuado:

 - **Nombre del supermercado** (string): `"Super Awesome Market"`
 - **Dirección del supermercado** (string): `"Calle Ficticia, 123"`
 - **Años en que lleva operando** (int): `10`
 - **Nivel de satisfacción promedio de los clientes** (float): `4.5`
 - **Variable booleana** llamada `isOpen`: `true` (indica si el supermercado está abierto)

 */
let supermarket = "Super Awesome Market"
let adress = "Calle Ficticia, 123"
var agesOperating = 10
var satisfactionAverage: Float = 4.5
var isOpen = true

/*:
 ## Paso 2: Arrays - Gestionar inventario
 
 Crea un array que liste los siguientes productos del supermercado:

 - manzanas
 - plátanos
 - leche
 - huevos
 - pan

 Agrega al final del array:

 - caramelos

 Imprime el número total de productos en el inventario.

 */
var products = ["manzanas", "plátanos", "leche", "huevos", "pan"]
products.append("caramelos")
print(products.count)
/*:
 ## Paso 3: Sets - Seguimiento de clientes frecuentes

 Crea un conjunto inicial con los nombres de los clientes frecuentes:

 - "alice"
 - "bob"
 - "charlie"

 Realiza las siguientes operaciones:

 1. Agrega un nuevo cliente llamado **diana**.
 2. Elimina al cliente **charlie**, ya que ha dejado de ser frecuente.
 3. Verifica si **alice** es aún cliente frecuente.

 */
var clients = Set(["alice", "bob", "charlie"])
clients.insert("diana")
clients.remove("charlie")
clients.contains("alice")


/*:
 ## Paso 4: Tuplas - Información de ofertas

 Crea una tupla para representar una oferta semanal llamada `weeklyOffer`. Cada oferta se compone de:

 - **Nombre del producto en oferta** (string)
 - **Precio original** (float)
 - **Descuento aplicado como porcentaje** (int)

 Por ejemplo: `manzanas`, `2.99`, `20`.

 Imprime el precio descontado usando los valores de la tupla.

 */
var weeklyOffer = (name: "manzanas", price: 2.99, discount: 20.00)
var discountApplied = weeklyOffer.price - ((weeklyOffer.price * weeklyOffer.discount) / 100)

print("Esta semana las \(weeklyOffer.name) a \(discountApplied) con un \(weeklyOffer.discount) % de descuento.")



/*:
 ## Paso 5: Diccionarios - Registro de ventas

 Crea un diccionario llamado `salesRecord` donde las claves sean los nombres de los productos y los valores sean las cantidades vendidas.

 Inicializa el diccionario con los valores:

 - manzanas: `50`
 - plátanos: `30`
 - leche: `20`
 - huevos: `10`

 Actualiza los datos:

 - Se vendieron `5` manzanas adicionales.
 - Se agotaron los huevos (quedan `0` en existencias).

 Repite el diccionario para imprimir el producto y su cantidad vendida.

 */
var salesRecord: [String: Int] = ["manzanas": 50, "plátanos": 30, "leche": 20, "huevos": 10]
salesRecord["manzanas"] = 55
salesRecord["huevos"] = 0
print(salesRecord)

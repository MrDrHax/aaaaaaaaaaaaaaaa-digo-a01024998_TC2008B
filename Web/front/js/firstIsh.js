console.log("Hello world!!!")

//1
function primerCadena(cadena) {
    let dict = {};
    for (let y = 0; y < cadena.length; y++) {
        let i = cadena[y];
        if (! isNaN(dict[i])) {
            dict[i] += 1;
        } else {
            dict[i] = 1;
        }
        
    }

    for (const [key, value] of Object.entries(dict)) {
        if (value === 1){
            return key;
        }
    }
}

console.log(primerCadena('abacddbec'));

//2
function bubbleSort(laEntrada) {
    let cantidad = laEntrada.length;

    let notSorted = true;

    let tempCache = 0;

    while (notSorted) {
        notSorted = false;
        
        for (let i = 0; i < laEntrada.length - 1; i++) {
            if (laEntrada [i] > laEntrada[i+1]){
                notSorted = true;
                tempCache = laEntrada [i];
                laEntrada [i] = laEntrada [i+1];
                laEntrada [i+1] = tempCache;
            }
        }
    }

    return laEntrada;
}

console.log(bubbleSort([0,2,4,56,1,3]));

//3
// Invertir creando una marinola nueva
function invertir1(laEntrada){
    let toreturn = Array(laEntrada.length);
    for (let i = 0; i < laEntrada.length; i++) {
        toreturn[laEntrada.length - i - 1] = laEntrada[i];
    }

    return toreturn;
}

console.log(invertir1([1,2,3]));

// Invertir sobre la existente
function invertir2(laEntrada){
    let cosoTemp = Object;

    for (let i = 0; i < Math.floor(laEntrada.length / 2); i++) {
        cosoTemp = laEntrada [i]
        laEntrada[i] = laEntrada[laEntrada.length - i -1];
        laEntrada[laEntrada.length - i -1] = cosoTemp;
    }

    return laEntrada;
}
console.log(invertir2([1,2,3]));


//4 funcion que hace mayuscula la primera letra de cada palabra
function hacerMayus(strInicial) {
    let hacerMayus = true;
    let strFinal = "";

    for (let i = 0; i < strInicial.length; i++) {
        if (hacerMayus){
            strFinal += strInicial[i].toUpperCase();
            hacerMayus = false;
        } else {
            strFinal += strInicial[i];
        }

        if (strInicial[i] === " "){
            hacerMayus = true;
        }
    }

    return strFinal
}

console.log(hacerMayus("Hola como estas?"))

//5 funcion que saca el maximo comun divisor
function maximoComunDivisor(x,y) {
    let divisor = 1;
    let dividendo = 2;
    while (y != 1 && x != 1){
        if (x % dividendo == 0 ){
            x = x / dividendo;
            if (y % dividendo == 0){
                y = y / dividendo;
                divisor = divisor * dividendo;
            } else {
                dividendo++;
            }
        }
    }

    return divisor;
}

console.log(maximoComunDivisor(6,9));

//6 funcion que convierte a hacker speak cualquier cadena de texto
function convertirHackerSpeak(entrada) {
    let salida = "";
    [...entrada].forEach(i => {
        switch (i) {
            case "a":
                salida += "4";
                break;
            case "e":
                salida += "3";
                break;
            case "i":
                salida += "1";
                break;
            case "o":
                salida += "0";
                break;
            case "s":
                salida += "5";
                break;

            default:
                salida += i;
                break;
        }
    });

    return salida;
}

console.log(convertirHackerSpeak("hola como estas"));

//7 factoriza un numero
function factorizar(laEntrada){
    let salida = [];
    let dividendo = 2;
    while (laEntrada != 1){
        if (laEntrada % dividendo == 0 ){
            laEntrada = laEntrada / dividendo;
            salida.push(dividendo);
        } else {
            dividendo++;
        }
    }

    return salida;
}

console.log(factorizar(6));

//8 Escribe una función que quite los elementos duplicados de un arreglo y regrese una lista con los elementos que quedan. Por ejemplo: quitaDuplicados([1, 0, 1, 1, 0, 0]) -> [1, 0]

function quitarDuplicados(listaInicial) {
    let usados = {};

    listaInicial.forEach(i => {
        if (! isNaN(usados[i])) {
            usados[i] += 1;
        } else {
            usados[i] = 1;
        }
    });

    let listaFinal = [];

    for (const [key, value] of Object.entries(usados)) {
        listaFinal.push(key);
    }

    return listaFinal;
}

console.log(quitarDuplicados([1, 0, 1, 1, 0, 0]));

// 9 Escribe una función que reciba como parámetro una lista de cadenas de texto, y regrese la longitud de la cadena más corta.
function cadenaMasCorta(listaInicial) {
    let longitud = 0;
    listaInicial.forEach(i => {
        if (longitud === 0){
            longitud = i.length;
        } else {
            if (i.length < longitud){
                longitud = i.length;
            }
        }
    });

    return longitud;
}

console.log(cadenaMasCorta(["hola", "como", "estas"]));

// 10 Escribe una función que revise si una cadena de texto es un palíndromo o no.
function esPalindromo(cadena) {
    let esONO = true;

    for (let i = 0; i < Math.floor(cadena.length / 2); i++) {
        if (cadena[i] !== cadena[cadena.length - i - 1]){
            esONO = false;
        }
    }

    return esONO;
}

console.log(esPalindromo("hola"));
//console.log(esPalindromo("alela"));

// 11 Escribe una función que tome una lista de cadena de textos y devuelva una nueva lista con todas las cadenas en orden alfabético.
function ordenarAlfabeticamente(listaInicial) {
    let temporal = "";

    let isSorted = false;

    while (!isSorted){
        isSorted = true;
        // Implementando el bubble sort
        for (let i = 0; i < listaInicial.length - 1; i++) {
            if (listaInicial[i] > listaInicial[i+1]){
                temporal = listaInicial[i];
                listaInicial[i] = listaInicial[i+1];
                listaInicial[i+1] = temporal;
                isSorted = false;
            }
        }
    }

    return listaInicial;
}

console.log(ordenarAlfabeticamente(["hola", "como", "estas"]));

// 12 Escribe una función que tome una lista de números y devuelva la mediana y la moda.
function medianaYModa(listaInicial) {
    let mediana = 0;
    let moda = 0;

    let ocurrecncias = {};

    listaInicial.forEach(i => {
        if (! isNaN(ocurrecncias[i])) {
            ocurrecncias[i] += 1;
        } else {
            ocurrecncias[i] = 1;
        }
        
        mediana += i;
    });

    mediana = mediana / listaInicial.length;
    moda = Object.keys(ocurrecncias).reduce((a, b) => ocurrecncias[a] > ocurrecncias[b] ? a : b);

    return [mediana, moda];
}

console.log(medianaYModa([1,2,3,4,5,6,7,8,8,10,11,12,13,14,15]));

// 13 Escribe una función que tome una lista de cadenas de texto y devuelva la cadena más frecuente.
function cadenaMasFrecuente(listaInicial) {
    let dict = {};

    for (let i = 0; i < listaInicial.length; i++) {
        if (! isNaN(dict[listaInicial[i]])) {
            dict[listaInicial[i]] += 1;
        } else {
            dict[listaInicial[i]] = 1;
        }
    }

    return Object.keys(dict).reduce((a, b) => dict[a] > dict[b] ? a : b);
}

console.log(cadenaMasFrecuente(["hola", "como", "estas", "hola"]));

// 14 Escribe una función que tome un número y devuelva verdadero si es una potencia de dos, falso de lo contrario.
function esPotenciaDeDos(numero) {
    let esONO = true;
    let potencia = 0;

    while (Math.pow(2, potencia) < numero){
        potencia++;
    }

    if (Math.pow(2, potencia) != numero){
        esONO = false;
    }

    return esONO;
}

console.log(esPotenciaDeDos(8));

// 15 Escribe una función que tome una lista de números y devuelva una nueva lista con todos los números en orden descendente.
function ordenarDescendente(listaInicial) {
    let temporal = 0;

    let isSorted = false;

    while (!isSorted){
        isSorted = true;
        // Implementando el bubble sort
        for (let i = 0; i < listaInicial.length - 1; i++) {
            if (listaInicial[i] < listaInicial[i+1]){
                temporal = listaInicial[i];
                listaInicial[i] = listaInicial[i+1];
                listaInicial[i+1] = temporal;
                isSorted = false;
            }
        }
    }

    return listaInicial;
}

console.log(ordenarDescendente([1,2,3,4,5,6,7,8,8,10,11,12,13,14,15]));
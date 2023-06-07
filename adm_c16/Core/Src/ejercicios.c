/*
 * ejercicios.c
 *
 *  Created on: Mayo 23, 2023
 *      Author: Amilcar Rincon Charris
 */

#include "ejercicios.h"

/* Ejercicio 1 - Realizar una función que inicialice un vector con ceros.
La función debe tener el siguiente prototipo: void zeros (uint32_t *vector, uint32_t longitud);
*/
void zeros(uint32_t *vector, uint32_t longitud) {
    for (uint32_t i = 0; i < longitud; i++) {
        vector[i] = 0;
    }
}

/* Ejercicio 2 - Realizar una función que realice el producto de un vector y un escalar (por ejemplo, podría servir
para cambiar el nivel de amplitud de una señal).
void productoEscalar32 (uint32_t *vectorIn, uint32_t *vectorOut uint32_t longitud, uint32_t escalar);
*/

void productoEscalar32(uint32_t *vectorIn, uint32_t *vectorOut, uint32_t longitud, uint32_t escalar) {
    for (uint32_t i = 0; i < longitud; i++) {
        vectorOut[i] = vectorIn[i] * escalar;
    }
}

/* Ejercicio 3 - Adapte la función del ejercicio 2 para realizar operaciones sobre vectores de 16 bits:
void productoEscalar16 (uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar);
*/
void productoEscalar16(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar) {
    for (uint32_t i = 0; i < longitud; i++) {
        vectorOut[i] = vectorIn[i] * escalar;
    }
}


/* Ejercicio 4 - Adapte la función del ejercicio 3 para saturar el resultado del producto a 12 bits:
void productoEscalar12 (uint16_t * vectorIn, uint16_t * vectorOut, uint32_t longitud, uint16_t escalar);
*/
void productoEscalar12(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitud, uint16_t escalar) {
    for (uint32_t i = 0; i < longitud; i++) {
        uint32_t producto = (uint32_t)vectorIn[i] * escalar;
        if (producto > 4095) {
            vectorOut[i] = 4095; // Satura el resultado a 12 bits
        }
        else {
            vectorOut[i] = (uint16_t)producto;
        }
    }
}


/* Ejercicio 5 - Realice una función que implemente un filtro de ventana móvil de 10 valores sobre un vector de
muestras.
void filtroVentana10(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitudVectorIn);
*/
void filtroVentana10(uint16_t *vectorIn, uint16_t *vectorOut, uint32_t longitudVectorIn) {
    for (uint32_t i = 0; i < longitudVectorIn; i++) {
        uint32_t suma = 0;
        uint32_t numValores = 0;

        // Suma los valores de la ventana actual
        for (uint32_t j = i; j < i + 10 && j < longitudVectorIn; j++) {
            suma += vectorIn[j];
            numValores++;
        }

        // Calcula el promedio y asigna al elemento correspondiente en el vector de salida
        vectorOut[i] = suma / numValores;
    }
}


/* Ejercicio 6 - Realizar una función que reciba un vector de números signados de 32 bits y los “empaquete” en
otro vector de 16 bits. La función deberá adecuar los valores de entrada a la nueva precisión.
void pack32to16 (int32_t *vectorIn, int16_t *vectorOut, uint32_t longitud);
*/
void pack32to16(int32_t *vectorIn, int16_t *vectorOut, uint32_t longitud) {
    for (uint32_t i = 0; i < longitud; i++) {
        // Ajustar el valor de entrada a la nueva precisión
        if (vectorIn[i] >= 32767) {
            vectorOut[i] = 32767;
        } else if (vectorIn[i] <= -32768) {
            vectorOut[i] = -32768;
        } else {
            vectorOut[i] = (int16_t)vectorIn[i];
        }
    }
}


/* Ejercicio 7 - Realizar una función que reciba un vector de números signados de 32 bits y devuelva la posición
del máximo del vector.
int32_t max_c(int32_t *vectorIn, uint32_t longitud);
*/

/*int32_t max_c(int32_t *vectorIn, uint32_t longitud)	{
    int32_t maximo = vectorIn[0];
    uint32_t posicionMaximo = 0;

    for (uint32_t i = 1; i < longitud; i++) {
        if (vectorIn[i] > maximo) {
            maximo = vectorIn[i];
            posicionMaximo = i;
        }
    }

    return posicionMaximo;
}*/

/* Ejercicio 8 - Realizar una función que reciba un vector de muestras signadas de 32 bits y lo decime
descartando una cada N muestras.
void downsampleM (int32_t *vectorIn, int32_t *vectorOut, uint32_t longitud, uint32_t N);
*/
void downsampleM(int32_t *vectorIn, int32_t *vectorOut, uint32_t longitud, uint32_t N) {
    uint32_t longitudDecimado = longitud / N;

    for (uint32_t i = 0; i < longitudDecimado; i++) {
        vectorOut[i] = vectorIn[i * N];
    }
}

/* Ejericio 9 - Realizar una función que reciba un vector de muestras no signadas de 16 bits e invierta su orden.
void invertir (uint16_t *vector, uint32_t longitud);
*/
void invertir(uint16_t *vector, uint32_t longitud) {
    uint32_t inicio = 0;
    uint32_t fin = longitud - 1;

    while (inicio < fin) {
        // Intercambiar los elementos en las posiciones inicio y fin
        uint16_t temp = vector[inicio];
        vector[inicio] = vector[fin];
        vector[fin] = temp;

        // Avanzar los índices de inicio y fin
        inicio++;
        fin--;
    }
}


/* Ejercicio 10 - Realizar una función que calcule la correlación entre dos vectores. Luego optimice utilizando
instrucciones SIMD.
void corr (int16_t *vectorX, int16_t *vectorY, int16_t vectorCorr, uint32_t longitud);
*/

void corr(int16_t *vectorX, int16_t *vectorY, int16_t *vectorCorr, uint32_t longitud) {
    for (uint32_t i = 0; i < longitud; i++) {
        vectorCorr[i] = 0;
        for (uint32_t j = 0; j < longitud; j++) {
            vectorCorr[i] += vectorX[j] * vectorY[(i + j) % longitud];
        }
    }
}



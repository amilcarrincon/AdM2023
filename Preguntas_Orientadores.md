<h4>Arquitectura de Microprocesadores</h4>
<h4>Carrera de Especialización en Sistemas Embebidos</h4>
<h4>FIUBA 2023</h4>
<h4>Amilcar Rincon Charris</h4>

<h1>Preguntas Orientadoras</h1>

<h3>1. 	Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.</h3> 

<h4>Los perfiles son líneas de productos, orientadas a determinados mercados o soluciones. Tienen que ver con el rendimiento esperado, y se deben elegir según 
la aplicación requerida. Los tres perfiles de ARM son los cortex A, cortex R y cortex M.

Cortex A: línea orientada a aplicaciones (corren en un Sistema operativo de propósito general). Procesadores de alto rendimiento orientados a la implementación 
de Sistemas Operativos en Sistemas Embebebidos de alto desempeño (optimizados para correr aplicaciones de usuario en un sistema operativo multitarea). Pueden procesar muchas cosas al mismo tiempo, pero 
es un procesamiento no determinista (pueden existir demoras). No es adecuado para aplicaciones en tiempo real. Tienen memoria caché. 

Cortex R: línea orientada a tiempo real. Procesadores orientados a sistemas de tiempo real donde la necesidad principal es implementar soluciones de baja latencia y alta 
capacidad de procesamiento. Ejemplos: sistemas del automóvil (seguridad, frenado, etc.), sistemas médicos, industriales, etc.
El cortex R es como un cortex A (alta capacidad de procesamiento) pero sin la capacidad de hacer que las aplicaciones corran rápido. Es un procesador potente 
pero orientado a correr aplicaciones de tiempo real (baja latencia y alta capacidad de procesamiento). No tienen memoria caché.

Cortex M: línea orientada a microcontroladores. Procesadores orientados a dispositivos de consumo masivo y sistemas embebidos compactos (diseñados para 
alta densidad de código y programación en C). Comparado con un cortex M, un cortex A tiene mucha más capacidad de procesamiento, pero tiene mucho mayor 
consumo y costo. Los cortex M ya vienen con memoria, flash, periféricos internos. Los cortex A no. </h4>

<h1>Córtex M</h1>

<h3>1.	Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4 <br>

<h4>Cortex M0: posee arquitectura ARMv6-M y arquitectura de memoria Von-Neumann (bus único). No posee MPU. Admite sólo instrucciones de 32 bits y no soporta 
todo el set de instrucciones Thumb. Presenta una implementación mínima de bajo costo para aplicaciones sencillas que requieren bajo consumo.

Cortex M3: posee arquitectura ARMv7-M y arquitectura Harvard (más rápida). Admite instrucciones hasta 64 bits y soporta Thumb. Presentan mayor performance 
y capacidades de protección a memoria. El set de instrucciones más extenso permite operaciones más avanzadas y eficientes, tales como la división por hardware.

Cortex M4: posee arquitectura ARMv7E-M y arquitectura Harvard. Admite instrucciones hasta 64 bits y soporta Thumb. Tiene posibilidad de agregar memoria 
caché al CPU. Respecto a M3, el set de instrucciones es más extenso y los co-procesadores son más potentes, permitiendo procesamiento digital de señales (DSP) 
  y operaciones de punto flotante (FPU).</h4>

<h3>2. ¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique</h3>
<h3>3. ¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?</h3>
<h3>4. ¿Cómo es el mapa de memoria de la familia?<br></h3>
  <h4>La familia Córtex M tiene un espacio para direcciones de memoria de 4Gb, particionado en las siguientes secciones:<br>
  Región de código de programa - Memoria FLASH.<br>
  Región de datos - Memoria SRAM.<br>
  Región de periféricos.<br>
  Control interno - Bus privado.<br></h4>
<h3>5. ¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?</h3>
<h3>6. Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.</h3>
  <h3>7. ¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo</h3>
<h3>8. ¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo </h3>
  <h3>9. Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).</h3>
<h3>10. Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?</h3>
<h3>11. Describa la secuencia de reset del microprocesador.
<h3>12. ¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?</h3>
<h3>13. ¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo</h3>
<h3>14. ¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?</h3>
<h3>15. Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo </h3>
<h3>17. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?</h3>
<h3>16. Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.</h3>
<h3>17. ¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?</h3>
<h3>18. ¿Qué funciones cumple la unidad de protección de memoria (MPU)?</h3>
<h3>19. ¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?</h3>
<h3>20. ¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo</h3>
<h3>21. ¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.</h3>
<h1>ISA</h1>
<h3>1. ¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo</h3>
<h3>2. ¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo</h3>
<h3>3. ¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.</h3>
<h3>4. Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?</h3>
<h3>5. ¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un ejemplo.</h3>

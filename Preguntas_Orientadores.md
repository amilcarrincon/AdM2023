<h4>Arquitectura de Microprocesadores</h4>
<h4>Carrera de Especialización en Sistemas Embebidos</h4>
<h4>FIUBA 2023</h4>
<h4>Amilcar Rincon Charris</h4>

<h1>Preguntas Orientadoras</h1>

<h3>1. 	Describa brevemente los diferentes perfiles de familias de microprocesadores/microcontroladores de ARM. Explique alguna de sus diferencias características.</h3> 
    <h4>Los perfiles son líneas de productos, orientadas a determinados mercados o soluciones. Tienen que ver con el rendimiento esperado, y se deben elegir según la aplicación requerida. Los tres perfiles de ARM son los cortex A, cortex R y cortex M.
    Cortex A: línea orientada a aplicaciones (corren en un Sistema operativo de propósito general). Procesadores de alto rendimiento orientados a la implementación de Sistemas Operativos en Sistemas Embebebidos de alto desempeño (optimizados para correr aplicaciones de usuario en un sistema operativo multitarea). Pueden procesar muchas cosas al mismo tiempo, pero es un procesamiento no determinista (pueden existir demoras). No es adecuado para aplicaciones en tiempo real. 
    Tienen memoria caché. 
    Cortex R: línea orientada a tiempo real. Procesadores orientados a sistemas de tiempo real donde la necesidad principal es implementar soluciones de baja latencia y alta capacidad de procesamiento. Ejemplos: sistemas del automóvil (seguridad, frenado, etc.), sistemas médicos, industriales, etc.
    El cortex R es como un cortex A (alta capacidad de procesamiento) pero sin la capacidad de hacer que las aplicaciones corran rápido. Es un procesador potente pero orientado a correr aplicaciones de tiempo real (baja latencia y alta capacidad de procesamiento). No tienen memoria caché.
    Cortex M: línea orientada a microcontroladores. Procesadores orientados a dispositivos de consumo masivo y sistemas embebidos compactos (diseñados para alta densidad de código y programación en C). Comparado con un cortex M, un cortex A tiene mucha más capacidad de procesamiento, pero tiene mucho mayor consumo y costo. Los cortex M ya vienen con memoria, flash, periféricos internos. Los cortex A no. </h4>

<h1>Córtex M</h1>
<h3>1.	Describa brevemente las diferencias entre las familias de procesadores Cortex M0, M3 y M4 <br></h3>
    <h4>Cortex M0: posee arquitectura ARMv6-M y arquitectura de memoria Von-Neumann (bus único). No posee MPU. Admite sólo instrucciones de 32 bits y no soporta todo el set de instrucciones Thumb. Presenta una implementación mínima de bajo costo para aplicaciones sencillas que requieren bajo consumo.
    Cortex M3: posee arquitectura ARMv7-M y arquitectura Harvard (más rápida). Admite instrucciones hasta 64 bits y soporta Thumb. Presentan mayor performance y capacidades de protección a memoria. El set de instrucciones más extenso permite operaciones más avanzadas y eficientes, tales como la división por hardware.
    Cortex M4: posee arquitectura ARMv7E-M y arquitectura Harvard. Admite instrucciones hasta 64 bits y soporta Thumb. Tiene posibilidad de agregar memoria caché al CPU. Respecto a M3, el set de instrucciones es más extenso y los co-procesadores son más potentes, permitiendo procesamiento digital de señales (DSP) y operaciones de punto flotante (FPU).</h4>

<h3>2. ¿Por qué se dice que el set de instrucciones Thumb permite mayor densidad de código? Explique</h3>
    <h4>Las instrucciones de Thumb son de 16 bit y son un subconjunto de las instrucciones de 32 bit de ARM. Las instrucciones de Thumb tienen el mismo efecto sobre el procesador que las instrucciones de ARM, operan como instrucciones de 32 bit con todas sus ventajas solo que el código utilizado para una misma tarea es más pequeño, ocupa menos espacio y por lo tanto se puede codificar más en un mismo espacio de memoria.</h4>
<h3>3. ¿Qué entiende por arquitectura load-store? ¿Qué tipo de instrucciones no posee este tipo de arquitectura?</h3>
    <h4>En una arquitectura load-store, el set de instrucciones se divide en dos tipos: de acceso a memoria (load y store entre memoria y registros) y de operaciones de la ALU (sólo entre registros). Un ejemplo de arquitectura con este modelo es el x86. En la primera, se cargan datos desde la memoria a los registros internos del procesador (lectura) y también desde estos registros hacia la memoria (escritura). En la segunda, se tiene como operandos sólo registros del procesador, por lo que, para ejecutar operaciones entre posiciones de memoria primero se deben cargar éstas en los registros del procesador.
    En resumen, ninguna instrucción opera directamente sobre memoria, por lo que para acceder u operar sobre un valor en memoria, primero se lo debe cargar en un registro, y luego se lo debe guardar en un registro para pasarlo nuevamente a memoria.</h4>  
<h3>4. ¿Cómo es el mapa de memoria de la familia?<br></h3>
    <h4>La familia Córtex M tiene un espacio para direcciones de memoria de 4Gb, particionado en las siguientes secciones:<br>
    Región de código de programa - Memoria FLASH.<br>
    Región de datos - Memoria SRAM.<br>
    Región de periféricos.<br>
    Control interno - Bus privado.<br></h4>
<h3>5. ¿Qué ventajas presenta el uso de los “shadowed pointers” del PSP y el MSP?</h3>
    <h4>Los stack pointers del OS (MSP) y de las tareas de aplicación (PSP) permiten implementar un OS más confiable y eficiente sobre los Cortex M. El OS puede definir las regiones del stack permitidas para cada tarea, evitando acceder a regiones no permitidas.</h4>
<h3>6. Describa los diferentes modos de privilegio y operación del Cortex M, sus relaciones y como se conmuta de uno al otro. Describa un ejemplo en el que se pasa del modo privilegiado a no priviligiado y nuevamente a privilegiado.</h3>
    <h4>Existen dos modos de operación de los procesadores Cortex M, el modo usuario (no privilegiado) y el modo supervisor (privilegiado).
    El modo privilegiado brinda un acceso y control total de las instrucciones del procesador y recursos de la arquitectura. 
    El modo no privilegiado es aquel en el que corren las aplicaciones, y dicho acceso es restringido, es decir, el sistema operativo puede asignar recursos del sistema a la aplicación, ya sea como privados o compartidos. Este modo brinda protección frente a otros procesos y tareas.</h4>
  
<h3>7. ¿Qué se entiende por modelo de registros ortogonal? Dé un ejemplo</h3>
    <h4>En un modelo de registros ortogonal, todos los registros (excepto stack pointer, link register y program counter) pueden ser utilizados de forma indistinta por las instrucciones. Las instrucciones no operan sobre registros específicos, si no que existe un grupo de registros de propósito general en el cual todas las instrucciones 
    pueden operar. En los Cortex M3 y M4, existen 13 registros de propósito general (r0 a r12) en donde pueden operar las instrucciones de AND, ADD, MOV, etc. sobre cualquier registro. Por ejemplo, la suma entre los registros r9 y r11: ADD r9, r11.</h4>
  
<h3>8. ¿Qué ventajas presenta el uso de intrucciones de ejecución condicional (IT)? Dé un ejemplo </h3>
<h4> La ventaja es que se pueden ejecutar hasta cuatro instrucciones basadas en la condición de ejecución. Ejemplo de una instrucción IF-THEN-ELSE-THEN-THEN:

CMP R0, #1      	// compara R0 con el valor 1<br>
ITETT NE 		// si no es igual:<br>
ADDNE R0, R0, R1 	// suma R0 = R0 + R1<br>
ADDEQ R0, R0, R3 	// si es igual R0 = R0 + R3<br>
ADDNE R2, R4, #1 	// si no es igual R2 = R4 + 1<br>	
MOVNE R5, R3		// si no es mueve R3 a R5 </h4>

<h3>9. Describa brevemente las excepciones más prioritarias (reset, NMI, Hardfault).</h3>
<h4> En los Cortex-M puede haber tres tipos de Reset:<br>
•	Power on Reset: Resetea todo en el microcontrolador. Inclusive en procesador, periféricos y la sesión de debug.<br>
•	System reset: resetea el procesador y los periféricos.<br>
•	Processor reset: solo resetea el procesador. Se mantiene la sesión de debug con el host.<br>
EL Host puede generar un reset del Sistema o del procesador via un registro en el System Control Block (SCB). <br>

Non Maskable Interrupt (NMI): Puede ser usada por algún periférico, por ejemplo, un timer o un detector de nivel de voltaje, útil para advertir al procesador de una tensión fuera de rango.

Hardfault: estas interrupciones se disparan cuando el procesador detecta un error. Por ejemplo, una ejecución de una instrucción desconocida o cuando se recibe un 
mensaje de error al intentar acceder a la memoria. Estas tres interrupciones no se pueden deshabilitar. </h4>

<h3>10. Describa las funciones principales de la pila. ¿Cómo resuelve la arquitectura el llamado a funciones y su retorno?</h3>
<h4> La pila es una forma de usar una parte de la memoria como un buffer FIFO (First in – First out). Tiene la función PUSH para guardar los datos, y la función PULL para recuperar los datos. Se puede utilizar la pila para:<br>
- Guardar datos temporalmente.<br>
- Pasar información a funciones o subrutinas.<br>
- Almacenar variables locales.<br>
- Mantener el estado del procesador o los valores de los registros cuando se utiliza interrupciones, por ejemplo, estas detienen la ejecución del programa para ejecutar otra parte del código, al hacer esto, es necesario guardar el estado de las variables o registros para que el programa siga su ejecución desde el punto en que se detuvo.<br>
La arquitectura guarda el contenido de los registros que necesitan cambiar su valor debido al llamado de una función. Cuando la función termina, se restauran los valores de los registros utilizando la información almacenada en la pila.<br><h4>

<h3>11. Describa la secuencia de reset del microprocesador.
 <h4> Luego del reset y antes de ejecutar el programa, los Cortex-M leen las dos primeras palabras de la memoria. Estas dos primeras palabras son: el valor inicial del MSP y la dirección de la rutina de Reset. Luego el procesador setea el MSP y el contador del programa (PC) con estos valores. </h4> 
   
<h3>12. ¿Qué entiende por “core peripherals”? ¿Qué diferencia existe entre estos y el resto de los periféricos?</h3>
 <h4>  Los periféricos internos son los que están dentro de la misma unidad del CORTEX. Se encuentran los siguientes: Nested Vectored Interrupt Controller (NVIC), System Control Block (SBC), System timer, Memory Protection Unit (MPU). Estos los brinda ARM junto con el procesador. Los demás periféricos, por ejemplo: ADCs, timers, GPIOS, etc se los agregan los fabricantes de microcontroladores.</h4>
    
<h3>13. ¿Cómo se implementan las prioridades de las interrupciones? Dé un ejemplo</h3>
 <h4> Las prioridades se asignan con números ascendentes desde la prioridad más alta a la más baja. La prioridad más alta la tiene el Reset y se representa con un número negativo (-3), le sigue la NMI y la ´Hard fault´. Estas últimas no son programables, ya vienen definidas, todas las demás – puede haber hasta 256 – son programables. 
Los diseñadores limitan la cantidad de interrupciones que un MPU pueda tener cortando la cantidad de bits, esto se hace para bajar el consumo de potencia y la complejidad del NVIC, además de reducir la velocidad. Los bits que se sacan son los menos significativos, esto es así porque favorece la portabilidad, por ejemplo, si se quiere un MPU con 8 niveles de prioridad, solo se tendra los 3 bits superiores del Byte de configuración de prioridades.  </h4>    
    
<h3>14. ¿Qué es el CMSIS? ¿Qué función cumple? ¿Quién lo provee? ¿Qué ventajas aporta?</h3>
<h4>  Las siglas significan: Cortex Microcontroller Software Interface Standard. Provee bibliotecas standar y funciones para programar CORTEX-M. Hace que sea más fácil la reusabilidad de código y la portabilidad. Lo provee ARM. Ademas, provee otras ventajas:<br>
- Es abierto, es decir cualquiera puede descargarlo y usarlo.<br>
- De fácil aprendizaje.<br>
- Los drivers de los dispositivos pueden utilizarse con diferentes compiladores. <br> </h4>
    
<h3>15. Cuando ocurre una interrupción, asumiendo que está habilitada ¿Cómo opera el microprocesador para atender a la subrutina correspondiente? Explique con un ejemplo </h3>
<h4> Al ocurrir una interrupción el procesador pasa por cuatro etapas: Acepta el pedido de interrupción, cumple una secuencia de entrada, ejecuta la interrupción y vuelve de la interrupción.<br>
Primera etapa: Se aceptará si el procesador está activo, la interrupción está habilitada y si la interrupción tiene una prioridad más alta que la que pudiera estar ejecutándose.<br>
Segunda etapa: Guarda en el stack varios registros y también la dirección a la que tiene que regresar luego de que termine de ejecutar la interrupción. Accede al vector de interrupción (Dirección) y luego a la instrucción a ejecutarse. Después actualiza varios registros del NVIC y el core.<br>
Tercera etapa: Ejecuta la rutina de interrupción, se utilizará el MSP para operaciones con el Stack y se operará en modo privilegiado.<br>
Cuarta etapa: En los Cortex-M el regreso desde una interrupción se realiza con una dirección especial llamada EXC_RETURN en el program counter. Luego el procesador leerá los registros guardados en la pila para continuar donde estaba antes de la interrupción.<br></h4>
    
<h3>16. ¿Cómo cambia la operación de stacking al utilizar la unidad de punto flotante?</h3>
<h4>Los Cortex-M4 son los que tienen unidad de punto flotante, y por default tiene habilitado un modo de operación llamado lazy stacking, esta funcionalidad reserva un espacio de memoria para utilizar como stack donde guardara el contenido de los registros utilizados para punto flotante, S0 – S15. Entonces, si se utiliza operaciones con punto flotante el procesador guardara ahí el contenido de esos registros, de lo contrario solo quedara reservado el espacio. Este modo de funcionamiento reduce el tiempo de respuesta en el llamado a una interrupción, ya que almacena solo los registros necesarios. </h4>    
    
<h3>17. Explique las características avanzadas de atención a interrupciones: tail chaining y late arrival.</h3>
<h4>Tail chaining: Cuando se está ejecutando una interrupción y se produce la interrupción de otro de igual o mayor prioridad, el procesador seguirá con la interrupción actual (en el caso de que las prioridades sean las mismas) o la suspenderá (En el caso de que la nueva interrupción tenga una prioridad mayor), y atenderá la nueva. 
Cuando termine de ejecutar la interrupción atenderá la que quedó suspendida. Esto evita operar el stack entre la ejecución de cada interrupción, ahorra tiempo y energía. 
Late arrival: Se llama así a una interrupción de más alta prioridad que sucede luego de una interrupción de más baja prioridad, mientras el procesador realiza el “stacking”. Cuando termine de llenar el stack atenderá la interrupción con la prioridad más alta.</h4>
    
<h3>18. ¿Qué es el systick? ¿Por qué puede afirmarse que su implementación favorece la portabilidad de los sistemas operativos embebidos?</h3>
<h4>Es un timer que puede generar la interrupción “SysTick”. Es de 24 bit, decremental y puede utilizar la frecuencia del procesador o de alguna otra referencia. Este timer puede ser utilizado por sistemas operativos en tiempo real en sistemas embebidos, entonces si el sistema operativo fue hecho para un Cortex-M3/M4, el mismo podrá ser usado en otro microcontrolador que tenga el mismo procesador. Por otro lado, si no se utiliza un FreeRTOS, este timer puede ser utilizado para otros propósitos propios de los timers.</h4>    
    
<h3>19. ¿Qué funciones cumple la unidad de protección de memoria (MPU)?</h3>
<h4>Es una característica opcional, no todos los Cortex la traen y sirve básicamente para proteger ciertas regiones de memoria a través de distintos modos de acceso, este puede ser privilegiado o no. Es programable y las funciones que cumple pueden ser:<br>
- Previene que las aplicaciones corrompan los datos de la pila utilizada por otra aplicación o un sistema operativo. Es decir, reserva memoria para una pila “privada” solo para ciertas aplicaciones.<br>
- Previene que se pueda acceder a ciertos periféricos que pueden ser sensibles al funcionamiento de un sistema.<br>
- Define una parte de la memoria como no ejecutable, previniendo inyección de código.<br>   
    
<h3>20. ¿Cuántas regiones pueden configurarse como máximo? ¿Qué ocurre en caso de haber solapamientos de las regiones? ¿Qué ocurre con las zonas de memoria no cubiertas por las regiones definidas?</h3>
<h4>En los Cortex M3 y M4 soportan hasta 8 regiones programables. En caso de que un dato quiera ser guardado en una parte de la memoria protegida compartida por dos regiones, este será guardado en la región con el número de identificación de división más alto. Si se intenta acceder a un área no definida, el acceso será bloqueado 
y se disparara una excepción de falla. </h4>   
   
<h3>21. ¿Para qué se suele utilizar la excepción PendSV? ¿Cómo se relaciona su uso con el resto de las excepciones? Dé un ejemplo</h3>
<h4> Es otro tipo de excepción y es importante para soportar operaciones con sistemas embebidos. Tiene la prioridad más baja entre todas las interrupciones, y su función es la de esperar a que se terminen de ejecutar todas las interrupciones con prioridades más altas, para que dentro de ella el sistema operativo realice el cambio de 
contexto de una tarea. De este modo el cambio de contexto se retrasará al haber una interrupción ejecutándose antes.
Esto es así, porque en el caso de que un sistema operativo intente realizar un cambio de contexto mientras se está ejecutando una interrupción, si se intenta ejecutar otra tarea en el modo Thread interrumpiendo la interrupción se dará una falla de ejecución. Entonces de este modo volverá al modo Thread cuando termine la interrupción de prioridad más baja que es PendSV. </h4>
    
<h3>22. ¿Para qué se suele utilizar la excepción SVC? Expliquelo dentro de un marco de un sistema operativo embebido.</h3>
<h4>Se utiliza para hacer un sistema embebido más robusto, al ser una excepción permite que las aplicaciones, corriendo en modo no privilegiado, accedan mediante el SO corriendo en modo privilegiado, a datos u otros recursos como periféricos. Además, al ejecutarse inmediatamente después de ser disparada, no agrega un tiempo desconocido hasta la ejecución del SO. También hace que el diseño de las tareas sea más fácil, porque el programador puede abstraerse del hardware utilizado ya que esto lo manejaría el SO.</h4>
    
<h1>ISA</h1>
<h3>1. ¿Qué son los sufijos y para qué se los utiliza? Dé un ejemplo</h3>
<h4> Los sufijos se usan en instrucciones condicionales para realizar una acción dependiendo del resultado. Y luego hay otras con las que se puede actualizar los flags de una operación. Ejemplo de instrucción condicional, NE es Not Equal y EQ es Equal:<br>
CMP R0, #0    // compara R0 con el valor 0<br>
ITE   NE      // si no es igual a 0<br>
ADDNE R0, #1  // le sumo 1<br>
ADDEQ  R0, R1 // si es igual le sumo el registro R1<br></h4>   
    
<h3>2. ¿Para qué se utiliza el sufijo ‘s’? Dé un ejemplo</h3>
<h4> El sufijo s actualiza el registro APSR (Application Program Status Register, such as Carry, Overflow, Zero and Negative flags).Ejemplo: <br>
ADDS r0, 0x70 // [r0] = 0x70  Actualiza el flag si es que hubo overflow o no. <br></h4>   
    
<h3>3. ¿Qué utilidad tiene la implementación de instrucciones de aritmética saturada? Dé un ejemplo con operaciones con datos de 8 bits.</h3>
<h4>Es útil cuando se hacen procesamiento de datos, por ejemplo, si al realizar una operación aritmética el resultado es más grande que el número máximo capaz de representarse según la cantidad de bits utilizada, habrá overflow, y el dato interpretado será erróneo. Explícitamente seria: Si en 8 bits tengo 0xFF y le sumo 0x01, el resultado será 
0x00. Si utilizo la aritmética saturada el resultado será: 0xFF. Esto se interpreta como saturación.</h4>
    
<h3>4. Describa brevemente la interfaz entre assembler y C ¿Cómo se reciben los argumentos de las funciones? ¿Cómo se devuelve el resultado? ¿Qué registros deben guardarse en la pila antes de ser modificados?</h3>
<h4>Los argumentos de las funciones en asembly se reciben a través de los registros R0 – R3, siendo R0 el primer argumento de la función, R1 el segundo, R2 el tercero y R3 el cuarto argumento. También pueden utilizarse los registros S0-S15 en el caso de Cortex-M4 con FPU. Si se necesita pasar más de cuatro parámetros, se utilizará la 
pila. R0 es el registro utilizado para devolver un valor, también puede utilizarse el R1 para devolver un valor de 64 bit.<br>
Si la función en asembly necesita utilizar más registros para realizar operaciones y guardar temporalmente los resultados, se deberá guardar en la pila el valor de dichos registros, estos son R4 – R11, R13, R14, y en el caso del Cortex-M4 con unidad de punto flotante se deben guardar los registros S16-S31. Una vez que la función 
termina sus instrucciones y antes de volver a “C”, debe reestablecer el valor de dichos registros desde la pila.
El caso contrario sería una función en asembler que llama a una función en “C”, esta debe guardar los registros R0-R3, R12, S0-S15 ya que la función podría cambiar sus valores. También debe guardarse el valor del registro LR o R14 si la función contiene un salto BL o BLX, ya que al ejecutarlo sobrescribirá el valor de dicho registro. <br></h4>   
   
<h3>5. ¿Qué es una instrucción SIMD? ¿En qué se aplican y que ventajas reporta su uso? Dé un ejemplo.</h3>
<h4> Es una instrucción que permite realizar múltiples operaciones de datos en paralelo. Es útil cuando por ejemplo se hace el procesamiento de audio pudiendo procesar los dos canales, izquierdo y derecho, en paralelo. Es una característica que tiene el Cortex-M4, y hace que el procesamiento de datos sea más veloz, ya que el resultado de 
una instrucción también se aplica a varias salidas al mismo tiempo. Por ejemplo, en el caso de la instrucción SADD8 {Rd,} Rn, Rm, los registros Rn y Rm contienen 4 bytes cada uno, la instrucción realiza la suma de cada byte entre Rn y Rm y pone el resultado de cada una de las 4 sumas en Rd, también de 4 bytes, estos últimos 4 bytes pueden representar distintas salidas.</h4>

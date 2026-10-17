# RORO-supreme

-Introducción

En esta práctica se implementa la arquitectura RORO Supreme, un sistema que integra una memoria ROM de instrucciones de 12 bits, dos memorias ROM de operandos llamadas ROMa y ROMina, y la unidad aritmético-lógica ALUMIPS. Al ir haciendo los retos de sincronización y decodificación en Verilog, logramos coordinar la lectura de operandos de 32 bits y la evaluación de resultados junto con la bandera de cero ZF.


-Objetivo

El objetivo general es diseñar e integrar el módulo superior RORO Supreme para ejecutar una secuencia de 16 instrucciones de 12 bits, reutilizando los módulos base ROM, ALUMIPS y RORO, además de crear la ROM de instrucciones y los testbenches. 

Los objetivos particulares consisten en:

Diseñar la memoria ROM de instrucciones de 16 posiciones y 12 bits inicializada mediante readmemb con el archivo de instrucciones.

Configurar ROMa y ROMina cargando datos independientes desde archivos de inicialización.

Desarrollar los testbenches con comprobaciones automáticas de tipo PASS y FAIL para validar las operaciones de suma, resta y comparación SLT.


-Desarrollo

El proyecto se realizó dividiéndolo en varias etapas prácticas en Verilog. Primero se inspeccionaron las interfaces de los módulos ROM, ALUMIPS y RORO proporcionados en clase sin modificar su lógica fundamental. Después construimos dos instancias para ROMa y ROMina cargadas desde archivos independientes mediante readmemb.

<img width="1000" height="591" alt="22222222222" src="https://github.com/user-attachments/assets/4a5a82be-0db9-4a24-af1c-312eca5097de" />

<img width="1000" height="585" alt="33333333333" src="https://github.com/user-attachments/assets/ce7c933a-278c-48eb-b1e3-adb85896939e" />

<img width="1000" height="597" alt="666666666" src="https://github.com/user-attachments/assets/d9269012-fa1e-4dec-9f65-d0a421caf9b7" />


En tercer lugar diseñamos la ROM de instrucciones de 16 posiciones y palabras de 12 bits inicializada con el archivo de instrucciones. En cuarto lugar desarrollamos el módulo superior RORO Supreme conectando la instrucción, ambas memorias ROM y la ALU. En quinto y sexto lugar escribimos los testbenches RORO_tb para verificar el bloque de ROM y ALU, y RORO_Supreme_tb para recorrer las 16 instrucciones comprobando los resultados y las banderas. Mientras fuimos resolviendo los detalles de sincronización, integramos todos los archivos necesarios y documentamos las 16 operaciones obligatorias que distribuyen seis sumas, seis restas y cuatro comparaciones SLT utilizando las 16 direcciones de las ROMs.

| Dir | OP | ROMa | ROMina | DD esperado | ZF esperado |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 2 | 12 | 5 | 17 | 0 |
| 1 | 2 | 7 | 14 | 21 | 0 |
| 2 | 2 | 25 | 10 | 35 | 0 |
| 3 | 2 | 3 | 9 | 12 | 0 |
| 4 | 2 | 40 | 20 | 60 | 0 |
| 5 | 2 | 18 | 30 | 48 | 0 |
| 6 | 6 | 0 | 0 | 0 | 1 |
| 7 | 6 | 15 | 6 | 9 | 0 |
| 8 | 6 | 63 | 12 | 51 | 0 |
| 9 | 6 | 9 | 50 | 4294967255 | 0 |
| 10 | 6 | 100 | 3 | 97 | 0 |
| 11 | 6 | 2 | 2 | 0 | 1 |
| 12 | 7 | 31 | 31 | 0 | 1 |
| 13 | 7 | 55 | 11 | 0 | 1 |
| 14 | 7 | 8 | 16 | 1 | 0 |
| 15 | 7 | 20 | 4 | 0 | 1 | 


-Evidencias de Simulación

El banco de pruebas recorrió las dieciséis instrucciones del programa obligatorio generando un registro exitoso de tipo PASS en cada caso. A continuación se presentan las evidencias que demuestran el funcionamiento de las dieciséis operaciones solicitadas:

1. Registro Completo de Consola (Prueba PASS de las 16 Instrucciones)

2. Sumas (Direcciones 0 a 5: seis sumas en total)

3. Restas (Direcciones 6 a 11: seis restas en total)

4. Comparaciones SLT (Direcciones 12 a 15: cuatro comparaciones SLT en total)

<img width="1000" height="593" alt="2222222wqe2222" src="https://github.com/user-attachments/assets/0561514b-031f-4a24-a299-e51ace0574db" />

Explicación de casos obligatorios:

Caso de Resta Negativa (Dirección 9): En la dirección nueve, al restar nueve menos cincuenta, la ALU procesa un resultado negativo que se interpreta en complemento a dos como un patrón de treinta y dos bits equivalente a 4294967255, manteniendo la bandera de cero en cero.

Caso de Resultado Cero y ZF Activa (Direcciones 6 y 11): En las direcciones seis y once, al restar dos menos dos u operar ceros, el bus de datos entrega un valor de cero, activando la bandera ZF en uno únicamente cuando el resultado DD es igual a cero según lo requerido.

<img width="1000" height="604" alt="5555555" src="https://github.com/user-attachments/assets/f2340e9e-856f-4b96-b5d9-8ed1e12ceb14" />



-Conclusión

Logramos implementar y desarrollar los módulos requeridos utilizando el entorno de Verilog que ya conocíamos, reforzando nuestros conocimientos sobre el funcionamiento de RORO y comprendiendo mejor la integración de memorias y unidades aritméticas. Asimismo, conseguimos realizar la actividad en equipo utilizando la plataforma de GitHub, lo que nos permitió aprender a configurar organizaciones y repositorios compartidos.

-Referencias

Aritmético Lógica (ALU). (s.f.). En Wikidot. https://sistdig.wikidot.com/wiki:arquitectura
Universidad de Chile. (s.f.). Programación de software de sistemas: Memorias ROM y RAM, lenguaje Verilog. CC3301.
Coddy. (s.f.). Repaso - Diseño de ALU. Coddy, sección Fundamentos del Journey de Verilog, lección 57 de 90. https://coddy.tech/learn/es/verilog/fundamentals/recap__alu_design




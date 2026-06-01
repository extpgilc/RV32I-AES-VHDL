# Criptographic module added to RV32I

Abstract 

· Tienes que añadir referencias a bibliografía (enlaces valen también), al menos de los más importante (AES, Two process, AXI, Arty-Z7, y muchas más....). También es conveniente añadir al principio una sección de acrónimos y abreviaturas. No obstante, las referencia las debes añadir en los capítulo. No las pongas en el abstract. 

Introducción 

· Echo de menos que en algún momento, supongo que en la introducción, menciones la ventajas/desventajas de los algoritmos de clave simétrica frente a los de clave asimétrica. El hecho de que los de clave asimétrica sean mucho más lentos hace que 'tengamos' que seguir utilizando los de clave simétrica. El caso es justificar por qué has decidido trabajar sobre AES y justificar que es un algoritmo plenamente vigente aún. 

· Los párrafos de la sección 2.1 hay que darles continuidad. En el último deberías explicar de qué se trata el 'canal lateral' y por qué es importante en este tema. En cuanto a que los trabajos con FPGA siguen siendo predominantes es, básciamente debido al alto coste de desarrollo de los ASIC. 

Implementación del algoritmo AES 

· Añade alguna referencia a los campos finitos de Galois y en particular el que usa AES. 

· Intenta añadir un ejemplo representativo en cada una de las secciones para que quede más claro al lector. 

VHDL 

· Introduce que son los HDL y por qué te has decantado por VHDL (se usa más en Europa, ESA, etc.) 

· "VHDL tienden a empaquetarse como bloques en el entorno de desarrollo Vivado AMD/Xilinx." No menciones aquí AMD/Xilinx ya que, lo mismo, lo podrías hacer con herramientas de Microsemi o Intel/Altera. Justifica más adelante por qué utilizarás el entorno Xilinx Vivado (tarjeta de evaluación disponible, etc.) 

Estilo de codificación Two Process 

- Añadir referencia a algún artículo (ESA, …) 

- Añadir pequeño ejemplo de código. 

Bus AXI y coprocesadores hardware 

- ¿Tu bloque AES soporta stream de datos de más de 128b? Esto es importante en relación con AXI Stream. Lo hablamos. 

- Comenta también la diferencia entre master y slave en este tipo de interfaces. Luego te será más fácil explicar dónde encaja el DMA: 2 master AXI hacia memoria y 2 AXI stream (master y slave) hacia tu acelerador. 

Diseño e implementación Análisis de requisitos y especificaciones 

- En algunos casos llamas ‘acelerador’ y otros ‘coprocesador’ Seguramente, mejor llamarlo siempre ‘acelerador’ 

Arquitectura de alto nivel 

- ¿qué quieres decir con (el estado)? 

Diseño detallado de los módulos VHDL de cifra 

- Si has utilizado código de un repositorio para ‘adaptarlo’ al método two process (creo que lo hiciste así), tienes que citarlo y mencionar las modificaciones y mejoras que has realizado. 

- Como anoté antes, un ejemplo sencillo de cada oparación sería muy ilustrativo. 

Máquina de estados 

- Además del texto explicativo, deberías añadir un diagrama de flujo de la máquina de estados. 

Diseño detallado de las interfaces de comunicación 

- Añadir una tabla de mapa de registros 

- Si has utilizado código de AXI del repositorio de SLAC debes citarlo. 
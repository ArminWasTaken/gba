Este proyecto tiene como objetivo la implementación en VHDL de la arquitectura de un microprocesador derivada de la del Zilog Z80 (utilizado por varios sistemas de videojuegos comerciales) en FPGA, capaz de ejecutar las instrucciones básicas de su CPU y algún programa simple escrito en su código ensamblador. Para ello se utilizará la plataforma Vivado, configurando una FPGA Nexys A7 con lenguaje VHDL y técnicas y estrategias de diseño digital.

El proceso de ejecución del proyecto se llevará a cabo marcando hitos, asegurando las funcionalidades básicas del sistema y construyendo sobre ellas. Estos hitos han seguido el siguiente orden:

•	Desarrollo de la Unidad Aritmético-Lógica (ALU) mediante métodos de diseño de circuitos combinacionales.

•	Desarrollo del Decodificador de Instrucciones

•	Desarrollo de la Lógica de Control (microcódigo basado en LUT’s (LookUp Tables) y máquina de estados finitos para descripción del funcionamiento de la CPU para cada instrucción).

•	Rutado final de todos los módulos desarrollados, junto con el set de registros y la memoria RAM del sistema.

•	Test y depuración del código, completando como resultado previsto el diseño digital completo de un microprocesador funcional.

•	Verificación en la placa Nexys A7.

Este desarrollo se ha llevado a cabo siguiendo una estrategia metódica de desarrollo a fin de mantener un código limpio, legible y compacto, comprobando la correcta funcionalidad de todas y cada una de las etapas previo al avance hacia la siguiente, simplificando así la tarea de depuración global.

Para ello se ha hecho uso continuado de la herramienta git a lo largo del desarrollo del proyecto para la creación y actualización de repositorios (uno de ellos en GitHub, de acceso público con el contenido del proyecto) a fin de mantener un control de versiones y facilitar la colaboración con mi tutor. También se eligió este sistema de trabajo para permitir el uso de varias ramas para añadir mejoras posteriores al proyecto.

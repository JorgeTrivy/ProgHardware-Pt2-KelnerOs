# ProgHardware-Pt2-KelnerOs
Este programa trabaja por medio de interrupciones de teclado, obteniendo la tecla pulsada, mostrandola, y guardándola en el buffer, y, dependiendo de qué teclas se pulsen, se podrá elegir entre varias opciones.
De forma normal, mostrará por pantalla un número determinado de veces la tecla pulsada, en este caso le he indicado que se repita hasta 5 veces. Dicha letra se sumará en el buffer, y se mostrará la secuencia por pantalla. El resto de opciones aparecen al pulsar:
  - Tecla 'Esc', que efectuará la salida del propio programa.
  - Tecla '1', que mostraría la información del sistema operativo.
  - Tecla '2', que mostraría la información de la CPU.
  - Tecla '3', que mostraría la información de la memoria utilizada.

Cada una de éstas opciones está separada por funciones y, para no colapsar la pantalla, al principio de cada una de éstas funciones, se llama a una otra función, 'limpiar_pantalla', la cuál, vacía la pantalla para no colapsar la propia terminal.

Bibliografía:

http://uin14131.blogspot.com/p/nombre-de-la-escuela-universidad.html
https://www.cartagena99.com/recursos/alumnos/ejercicios/210428171148-Laboratorio%20Practica3.pdf
http://arantxa.ii.uam.es/~gdrivera/labetcii/int_dos.htm
https://academicos.azc.uam.mx/jfg/diapositivas/sistemas/Unidad_2.pdf
https://cs.uns.edu.ar/~ldm/mypage/data/oc/apuntes/2019-modulo10.pdf

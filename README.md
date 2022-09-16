# TCLAB Adaptado con Sensores de Corriente
En esta placa del laboratório de temperatura es adicionado dos resistencias shunt en el transistor, para permitir la lectura de la corriente a través de la ley de Ohm.  Y un tercer sensor de temperatura para medir la temperatura externa del circuito.

<img src="https://raw.githubusercontent.com/sergioacg/TCLAB_CAE/master/Dual_Heater_CAE/tclab.jpg" width="512" height="384">

Se debe buscar una fuente de alimentación de potencia hacia los transistores que encaje mediante una conexión de Jack plug de 5.0mm que puede ser de 5v / 12v con el positivo en el centro.

<img src="https://github.com/sergioacg/TCLAB_CAE/blob/master/plug_power.jpg?raw=true" width="512" height="384">

Cursos de Control en Sistemas Embebidos
--------------------

Si esta interesado en realizar cursos de control sin necesidad de usar Python o Matlab, sino que desea saber como programar los controladores directamente en el microcontrolador Arduino o en un microcontrolador PIC de Microchip empleando el PIC C Compiler, puede acceder a los siguientes cursos con un Cupon de Descuento en el sitio web de **Control Automático Educación**

Implementación de Controladores en Dispositivos Embebidos usando el TCLAB_CAE <https://controlautomaticoeducacion.com/sistemas-de-control-en-dispositivos-embebidos/>


En este repositório, tenemos 2 archivos:

## tclab_v2_Arduino_Code
Este es el archivo que debe ser cargado en el Arduino a través del Arduino IDE. Permite direccionar todos los sensores y actuadores de la placa para una correcta lectura con Matlab.

El transistor 2, está configurado para recibir menos potencia que el transistor 1. Se puede cambiar esta configuración dentro del archivo del Arduino:

<img src="https://github.com/sergioacg/TCLAB_CAE/blob/master/Potencia.PNG?raw=true">

Se puede seleccionar el tipo de sensor de temperatura con el cual fue construido el TCLab, por defecto se espera que la planta sea construida con el sensor TMP36, sin embargo, si se utiliza el sensor LM35 este debe ser especificado en el código del Arduino colocando la variable booleana en TRUE, como es mostrado en la siguiente figura:


<img src="https://github.com/sergioacg/TCLAB_CAE/blob/master/sensor.png?raw=true">

## Dual_Heater_CAE - MATLAB Code

En esta carpeta se encuentran los archivos de prueba con los cuales se puede probar el laboratorio de temperatura.

Estos archivos son propios de [APMonitor](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl "APMonitor") del laboratorio del profesor John Hedengren.

Solo han sido **MODIFICADOS** para permitir la lectura de la **temperatura externa** y permitir la lectura de la **corriente que circula por los transistores**.

<img src="https://raw.githubusercontent.com/sergioacg/TCLAB_CAE/master/files.PNG">

### test_LED.m
Permite realizar un testeo del LED de la placa del TCLAB realizando un parpadeo y verificando que responde adecuadamente.

### test_Heaters.m
Permite realizar un testeo de los calentadores o Heaters (Transisotres) de la placa del TCLAB. Encendiendo y apagando ambos calentadores, para verificar si efectivamente la temperatura está  incrementando.

- Es necesario tener conectado la fuente externa hacia los transistores
- Tener precausión para evitar quemaduras si van a tocar los transistores.

### test_Temp_Read.m
Permite realizar un testeo de los 3 sensores de temperatura de la placa del TCLAB_CAE. Mostrando la temperatura actual de los 3 sensores, encendiendo ambos calentadores por un tiempo preestablecido, y finalmente mostrando el resultado de la lectura de los sensores nuevamente.

### test_Current_Read.m
Permite realizar un testeo de los 2 sensores de corriente de la placa del TCLAB_CAE. Encendiendo gradualmente los calentadores y mostrando cada segundo la lectura de la corriente que circula por cada transistor.

Dado que en el Arduino está configurado a que el transistor 1 tenga mayor potencia que el transistor 2, dependiendo del porcentaje de PWM configurado en los transistores, es normal que circule más corriente por el transistor 1 en una misma configuración de PWM.

Verificar también con un multimetro el valor real de la resistencia R1 y R2 y puede modificarse en el archivo **tclab** y **arduino_tclab**.

<img src="https://raw.githubusercontent.com/sergioacg/TCLAB_CAE/master/resistor.PNG">

### arduino_lab.slx
Archivo de Simulink, que permite variar los heaters de la placa y observar la variación de los 5 sensores que posee el TCLAB_CAE.

Nuevamente, este archivo es una modificación del Archivo original que puede ser encontrado en [APMonitor](http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl "APMonitor") del laboratorio del profesor John Hedengren.

<img src="https://raw.githubusercontent.com/sergioacg/TCLAB_CAE/master/simulink.PNG">

## Instalación del Driver de Arduino en Matlab

Para que Matlab soporte directamente la conexión de una placa Arduino, puede descargarse el driver en el siguiente enlace: [Driver Arduino-Matlab](https://la.mathworks.com/hardware-support/arduino-matlab.html)


## Instalación de la Biblioteca de Python con el TCLab_CAE

El repositorio de la biblioteca de *TCLab_CAE* está disponible en el siguiente repositorio: <https://github.com/sergioacg/TCLAB_PYTHON_CAE>

La instalación del TCLAB se hace en el terminal usando el manejador de paquetes ``pip``(en el caso de Anaconda abra el programa como administrador en Windows para una correcta instalación de los paquetes):

``pip install tclab-cae``

Si hay problemas con los permisos se puede intentar el comando:

``pip install tclab-cae --user``

Posteriormente, deberemos instalar la biblioteca de comunicación serial pyserial:

``pip install pyserial``

``conda install pyserial``


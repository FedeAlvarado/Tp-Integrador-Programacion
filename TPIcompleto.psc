Algoritmo ReservaVuelos
    definir usuarios, provincias, reservasCompra, horariosVuelo, arrayEquipajesGuardados, opcionesEquipaje, elementoABuscar como cadena
    definir origen, destino, horario, codigosDeReserva,opcionValija, opcionCantidad, codigoReservaAsignado, encontrarIndiceDeReserva, indiceEquipajes como entero
    definir retorno, registro, login Como Logico
	definir costoTotal, tarifaBase, costoPasaje, costoFinalEquipaje como real
	
	dimension usuarios[100, 5] // Almacenamiento de los datos de registro de los usuarios
    dimension reservasCompra[100,5] // Almacenamiento info sobre compra de pasaje
	dimension opcionesEquipaje[4,3] // muestra las opciones de equipaje --CONVERTIR EN SUBPROCESO?
	dimension arrayEquipajesGuardados[100,3] //almacenamiento del equipaje cargado por los usuarios
	dimension provincias[24,2] //array orígenes/destinos + zona tarifaria
	
	
	codigoReservaAsignado<-0
	indiceEquipajes<-0
	codigosDeReserva<- 1000
    cantidadUsuarios <- 0
	cantidadReservas <- 0
	tarifaBase<- 10000
	iva<-1.21
    costoPasaje<-0
	costoFinalEquipaje<-0
	
    opcionesEquipaje[0,0] <- "Equipaje de mano"
    opcionesEquipaje[0,1] <- "Hasta 5 kg"
    opcionesEquipaje[0,2] <- "0" 
    
    opcionesEquipaje[1,0] <- "Valija chica"
    opcionesEquipaje[1,1] <- "Hasta 10 kg"
    opcionesEquipaje[1,2] <- "1000"  
    
    opcionesEquipaje[2,0] <- "Valija mediana"
    opcionesEquipaje[2,1] <- "Hasta 15 kg"
    opcionesEquipaje[2,2] <- "2000" 
	
	opcionesEquipaje[3,0] <- "Valija grande"
    opcionesEquipaje[3,1] <- "Hasta 20 kg"
    opcionesEquipaje[3,2] <- "3000" 
	
	
	
	provincias[0, 0] <- "Buenos Aires"
    provincias[0, 1] <- "1"
    provincias[1, 0] <- "Córdoba"
    provincias[1, 1] <- "1"
    provincias[2, 0] <- "Santa Fe"
    provincias[2, 1] <- "1"
    provincias[3, 0] <- "Mendoza"
    provincias[3, 1] <- "3"
    provincias[4, 0] <- "Tucumán"
    provincias[4, 1] <- "4"
    provincias[5, 0] <- "Entre Ríos"
    provincias[5, 1] <- "2"
    provincias[6, 0] <- "Salta"
    provincias[6, 1] <- "4"
    provincias[7, 0] <- "Chaco"
    provincias[7, 1] <- "5"
    provincias[8, 0] <- "Corrientes"
    provincias[8, 1] <- "2"
    provincias[9, 0] <- "Santiago del Estero"
    provincias[9, 1] <- "5"
    provincias[10, 0] <- "San Juan"
    provincias[10, 1] <- "3"
    provincias[11, 0] <- "Jujuy"
    provincias[11, 1] <- "4"
    provincias[12, 0] <- "Río Negro"
    provincias[12, 1] <- "3"
    provincias[13, 0] <- "Neuquén"
    provincias[13, 1] <- "3"
    provincias[14, 0] <- "Formosa"
    provincias[14, 1] <- "5"
    provincias[15, 0] <- "Chubut"
    provincias[15, 1] <- "3"
    provincias[16, 0] <- "Misiones"
    provincias[16, 1] <- "2"
    provincias[17, 0] <- "San Luis"
    provincias[17, 1] <- "1"
    provincias[18, 0] <- "La Rioja"
    provincias[18, 1] <- "3"
    provincias[19, 0] <- "Catamarca"
    provincias[19, 1] <- "3"
    provincias[20, 0] <- "La Pampa"
    provincias[20, 1] <- "1"
    provincias[21, 0] <- "Santa Cruz"
    provincias[21, 1] <- "4"
    provincias[22, 0] <- "Tierra del Fuego"
    provincias[22, 1] <- "6"
    provincias[23, 0] <- "CABA"
    provincias[23, 1] <- "1"
    
    dimension horariosVuelo[3] 
    horariosVuelo[0] <- "salida 8:00 / llegada 11:00"  
    horariosVuelo[1] <- "salida 12:00 / llegada 15:00"
    horariosVuelo[2] <- "salida 16:00 / llegada 19:00"
	
	
	Mostrar "---------------------------------"
    Mostrar "|      *** BIENVENIDO!!! ***     |"
    Mostrar "|                                |"
    Mostrar "|   Ingrese una opción para      |"
    Mostrar "|          comenzar...           |"
    Mostrar "---------------------------------"

    
    Repetir
		opcionMenu <- menu()
		Segun opcionMenu
			
			1:   registrarUsuario(usuarios, cantidadUsuarios)
				
			2:	login<-validarLogin(usuarios)
				si login==Verdadero
					Limpiar Pantalla
					mostrar "----------------------------------------------------------------------------------------------"
					mostrar "se ha loggeado correctamente!!! ya puede realizar una reserva o consultar su reserva previa!!!"
					mostrar "----------------------------------------------------------------------------------------------"
				SiNo
					mostrar "-------------------------------------------------------------------------------"
					mostrar "ERROR, no ha ingresado un dni o password valido, o no se encuentra registrado"
					mostrar "-------------------------------------------------------------------------------"
				FinSi
				
				
				
			3: 
				si login==verdadero
					reservas(cantidadReservas, provincias, horariosVuelo, reservasCompra, codigosDeReserva, costoPasaje, tarifaBase)
					cargaDeEquipaje<-costoEquipaje(opcionesEquipaje, iva, arrayEquipajesGuardados, costoFinalEquipaje, indiceEquipajes)
					mostrarCostoFinal(costoPasaje, costoFinalEquipaje, iva)
					
					// login<- falso 
				SiNo
					mostrar "---------------------------------------------------------------------------"
					mostrar "debe registrase y loggearse correctamente para acceder a reservar un pasaje"
					mostrar "---------------------------------------------------------------------------"
				finsi
				
				
				
			4:	encontrarIndiceDeReserva<-buscarElemento(reservasCompra,cantidadReservas,3)
				mostrar encontrarIndiceDeReserva // se muestra temporalmente para chequear si está funcionando correctamente, después borrar
				// a continuacion se recorren todos los arrays para mostrar los datos en el indice donde se escontró el dni, si funciona correctanmente debería mostrar todos los datos correspondientes a un mismo usuario
				
				
				//
				mostrar "Esta es su Reserva:"
				mostrar "Origen    -  Destino   -   Horario    -    cod. Reserva   -  Costo Pasaje"
				mostrarArrayEnIndiceEspecifico(encontrarIndiceDeReserva,reservasCompra,cantidadReservas,5)
				mostrar "Tipo de equipaje    -  cantidad   -   Costo Equipaje"
				mostrarArrayEnIndiceEspecifico(encontrarIndiceDeReserva,arrayEquipajesGuardados,indiceEquipajes,3)
				mostrar "--------------------------------------------------"
				mostrar " *** Gracias por visitar nuestro programa!!! ***"
				mostrar "--------------------------------------------------"
		FinSegun
	Mientras Que opcionMenu<>6
	
FinAlgoritmo

Funcion return<- menu() //funcion para validar las opciones del menu
	Definir opcionM Como Entero
	Repetir
		
		Escribir "1- Registrarse como usuario" //
		Escribir "2- loggin "
		Escribir "3- Consultar Destinos y realizar compra"//En esta versión los orígenes/destinos se muestran como un listado con cada provincia con un nro asignado y no hay búsqueda, se muestra tmb l zona traifaria que vamos a usar para calcular el costo del pasaje
		Escribir "4- Ver estado de reserva" //el usuario puede buscar su reserva por dni (única búsqueda que va a hacer el usuario)
		Escribir "5- usuario Admin" // este usuario va a tener un loggin y pass hardcodeado, respresenta a un empleado de la empresa que va a poder realizar distintas búsquedas
		Escribir "6- salir"
		
		
		Leer opcionM
	Mientras Que opcionM<1 y opt>6
	return<-opcionM
FinFuncion

SubProceso  registrarUsuario(usuarios Por Referencia, cantidadUsuarios Por Referencia)
    definir nombre, apellido, edad, dni, password1, password2 como cadena
    
    Mostrar "Ingresar nombre:"
    leer nombre
    Mostrar "Ingresar apellido:"
    leer apellido
    
    Repetir
        Mostrar "Ingresar DNI:"
        leer dni
    Hasta Que Longitud(dni) >= 6 Y Longitud(dni) <= 8 //validacion DNI entre 6 y 8 caracteres
    
	Repetir
		Mostrar "Ingrese edad:" 
		leer edad //falta validad edad
		validacion<-ConvertirANumero(edad)	
		
	Mientras Que validacion<=0
	
	
	
	Repetir
		mostrar "ingresar password"
		leer password1
		mostrar "ingresar password nuevamente"
		leer password2
		si password1<>password2
			mostrar "no coinciden los passwords, vuelva a intentarlo"
		FinSi
		
	Mientras Que password1<>password2
	
    usuarios[cantidadUsuarios, 0] <- nombre 
    usuarios[cantidadUsuarios, 1] <- apellido
    usuarios[cantidadUsuarios, 2] <- dni
    usuarios[cantidadUsuarios, 3] <- edad
	usuarios[cantidadUsuarios, 4] <- password2
	
	
    
    cantidadUsuarios <- cantidadUsuarios + 1 //la var iable cantidadUsuarios que se aumenta en +1 por cada usuario que se registra, permite ir almacenando los datos de cada usuario en una fila distinta del array
    
	// bucle temporal para comprobar si se están guardando los datos en el array correctamente

		Para i<-0 Hasta cantidadUsuarios-1 Hacer 
			Para j<-0 Hasta 4 Hacer
				Escribir Sin Saltar usuarios[i,j] "   "
			Fin Para
			Escribir ""
		Fin Para
		
		Limpiar Pantalla
		mostrar "-------------------------------------"
		mostrar "Registro exitoso! puede continuar..."
		mostrar "-------------------------------------"
		
FinSubProceso

Funcion return<- validarLogin(usuarios)
	Definir i Como Entero
	definir dni, password como cadena
	definir dniEncontrado Como Logico
	
	mostrar "ingresar DNI"
	leer dni
	mostrar "ingresar password"
	leer password
	
	i<-0;
	dniEncontrado <- Falso;
	Mientras i <= n-1 y no dniEncontrado
		si usuarios[i,2] == dni y usuarios[i,4]==password Entonces
			dniEncontrado <- Verdadero //fuerzo la salida del bucle
			mostrar "se ha loggeado correctamente!"
			
		FinSi
		i <- i +1; 
	FinMientras
	return	<- Verdadero
	
FinFuncion

subproceso reservas(cantidadReservas por referencia, provincias, horariosVuelo, reservasCompra Por Referencia, codigosDeReserva Por Referencia, costopasaje Por Referencia, tarifaBase por referencia)
	definir codigoReservaAsignado como entero
	mostrar "------------------------------"
	mostrar "     Reserva de Vuelos"
    mostrar "------------------------------"
    mostrar "    Seleccione el origen:"
	mostrar "------------------------------"
    
	
    
	para i <- 0 hasta 23 hacer //se muestra el listado de provincias para elegir el origen
		
		mostrar i+1, ". ", provincias[i,0], "     zona tarifaria: " provincias[i,1]
		
	FinPara
	
	
	leer origen // validar
	
    mostrar "------------------------------"
    mostrar "    Seleccione el destino:"
	mostrar "------------------------------"// el listado de provincias sigue en pantalla
	
	Repetir
		leer destino 
		si destino == origen entonces
			mostrar "-----------------------------------------------------"
			mostrar "Error, debe seleccionar un destino distinto al origen"
			mostrar "Origen: " origen
			mostrar "-----------------------------------------------------"
		FinSi
	Mientras Que destino==origen //validación para que no permita elegir mismo origen/destinos
	
	mostrar "--------------------------------"
	mostrar " Seleccione el horario de vuelo:"
	mostrar "--------------------------------"
	para i<-0 hasta 2
		mostrar  i+1,"     ", horariosVuelo[i] 
	FinPara
	
	leer horario //validar
	
	costoPasaje<- ConvertirANumero(provincias[origen-1,1])*tarifaBase + (convertirANumero(provincias[destino-1,1]) * tarifaBase)
	
	Limpiar Pantalla
	
	mostrar "------------------------------------------"
	mostrar " El costo de su vuelo es de: $" costoPasaje
	mostrar "------------------------------------------"
	mostrar "--------------------------------"
	mostrar "   su código de reserva es: "
	mostrar "--------------------------------"
	
	codigoReservaAsignado<-  codigosDeReserva +1 //	no funciona!!!!!!!!!!!
	mostrar codigoReservaAsignado
	
	reservasCompra[cantidadReservas,0]<- (provincias[origen-1,0]) 
	reservasCompra[cantidadReservas,1]<- (provincias[destino-1,0])
	reservasCompra[cantidadReservas,2]<- (horariosVuelo[horario-1])
	reservasCompra[cantidadReservas,3]<- ConvertirATexto(codigoReservaAsignado)
	reservasCompra[cantidadReservas,4]<- ConvertirATexto(costoPasaje)
	
	cantidadReservas<- cantidadReservas + 1 
	mostrar "-----------------------------------------------------------"
	mostrar " resumen de su reserva:"
	mostrar " Origen     Destino       hora de salida / Hora de llegada"
	mostrar "-----------------------------------------------------------"
	mostrarArray(reservasCompra,cantidadReservas,3) 
	mostrar "-----------------------------------------------------------"
	
FinSubProceso



funcion return<-costoEquipaje(opcionesEquipaje, iva Por Referencia, arrayEquipajesGuardados,costoFinalEquipaje por referencia, indiceEquipajes Por Referencia)
	definir cantidadValija como entero
	definir  costoAnumero como real
	definir costoCadena como cadena
	
	
	mostrar "---------------------"
	mostrar "Opciones de equipaje:"
    mostrar "---------------------"
    mostrar "Tipo               Peso                Costo"
    mostrar opcionesEquipaje[0,0], "  " opcionesEquipaje[0,1], "      " opcionesEquipaje[0,2] "	"
    mostrar opcionesEquipaje[1,0], "    " opcionesEquipaje[1,1], "     " opcionesEquipaje[1,2] "	 "
    mostrar opcionesEquipaje[2,0], "    " opcionesEquipaje[2,1], "     " opcionesEquipaje[2,2] "	"
	mostrar opcionesEquipaje[3,0], "     " opcionesEquipaje[3,1], "     " opcionesEquipaje[3,2] "	"
	mostrar "---------------------"
	mostrar "Elija una opción de equipaje"
	mostrar "1- equipaje de mano"
	mostrar "2- valija 10 kg"
	mostrar "3- valija 15 kg"
	mostrar "4- valija 20 kg"
	
	Repetir
		leer opcionValija
		mostrar "------------------------------------------"
		mostrar " ingresar cantidad de valijas (3 máximo)"
		mostrar "------------------------------------------"
		Repetir
			leer cantidadValija
		Mientras Que cantidadValija<1 o cantidadValija>3
		
		
	Mientras Que opcionValija < 1 o opcionValija > 4
	
	costoCadena<- opcionesEquipaje[opcionValija -1,2] // hice un solo array de cadena, en esta linea se busca la cadena en el array...
	costoAnumero<- ConvertirANumero(costoCadena) // y acá se convierte a número para poder calcular el costo
	// //////////////////////////////////////////////////////////////////
	//elimniar costoAnumero, se debe convertir directamente en la formula de abajo:
	// ////////////////////////////////////////////////////////////
	costoFinalEquipaje <- cantidadValija * costoAnumero 
	
	mostrar "-------------------------------------------------------"
	mostrar "resumen de su carga de equipaje"
	mostrar "-------------------------------------------------------"
	mostrar "tipo de equipaje: " opcionesEquipaje[opcionValija-1,0]
	mostrar "cantidad: " cantidadValija
	mostrar "costo Total de quipaje : " costoFinalEquipaje
	mostrar "-------------------------------------------------------"
	
	arrayEquipajesGuardados[indiceEquipajes,0]<- opcionesEquipaje[opcionValija-1,0]
	arrayEquipajesGuardados[indiceEquipajes,1]<- ConvertirATexto(cantidadValija)
	arrayEquipajesGuardados[indiceEquipajes,2]<- ConvertirATexto(costoFinalEquipaje)
	
	indiceEquipajes <- indiceEquipajes +1 
	
    return<- costoFinalEquipaje
FinFuncion

SubProceso mostrarCostoFinal(costoPasaje Por Referencia, costoFinalEquipaje por referencia, iva por referencia)
	
	Limpiar Pantalla
	mostrar "-------------------------------------------------------"
	mostrar "     ******** TICKET FINAL DE SU COMPRA *********"
	mostrar "-------------------------------------------------------"
	
	mostrar "Pasaje: " costoPasaje
	mostrar "Equipaje: " costoFinalEquipaje
	mostrar "Sub-total: " costoPasaje + costoFinalEquipaje
	mostrar "FINAL con IVA: $ " (costoPasaje + costoFinalEquipaje) * iva
	
	
FinSubProceso

SubProceso mostrarArray(array,n,m)
	
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] "   "
		Fin Para
		Escribir ""
	Fin Para
FinSubProceso

funcion return<- costoFinal()
	definir costoTotal como real
	
FinFuncion

Funcion return<- buscarElemento(array,n,columnaAbuscar)//la reserva ahora se busca por nro de reserva que es irrepetible, a diferencia del DNI. En este momento el programa no le impide a alguien registrarse 2 veces! :(
	Definir i Como Entero;
	definir elementoABuscar como cadena
	mostrar "ingresar nro de RESERVA para ver el estado de su compra"
	leer elementoABuscar
	i<-0;
	elementoEncontrado <- Falso;
	Mientras i <= n-1 y no elementoEncontrado
		si array[i,columnaAbuscar] == elementoABuscar Entonces
			elementoEncontrado <- Verdadero;
		SiNo
			i <- i +1; 
		FinSi
	FinMientras
	Si elementoEncontrado Entonces
		return <- i;
	SiNo
		return <- -1;
	FinSi
FinFuncion

SubProceso mostrarArrayEnIndiceEspecifico(encontrarIndiceDeReserva Por Referencia,array,n,m)
	
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[encontrarIndiceDeReserva,j] "   "
		Fin Para
		Escribir ""
	Fin Para
FinSubProceso



Algoritmo ReservaVuelos
    definir usuarios, provincias, reservasCompra, horariosVuelo, arrayEquipajesGuardados, opcionesEquipaje, elementoABuscar,pausa,finalizar como cadena
    definir origen, destino, horario, codigosDeReserva,cantidadUsuarios, opcionValija, opcionCantidad, codigoReservaAsignado, encontrarIndiceDeReserva, indiceEquipajes, numeroDeUsuario como entero
    definir retorno, registro, login, validaAdminUser como Logico
	definir costoTotal, tarifaBase, costoPasaje, costoFinalEquipaje como real
	
	dimension usuarios[100,6] // Almacenamiento de los datos de usuarios registrados
    dimension reservasCompra[100,5] // Almacenamiento info sobre compra de pasaje
	dimension opcionesEquipaje[4,3] // muestra las opciones de equipaje 
	dimension arrayEquipajesGuardados[100,3] //almacenamiento del equipaje cargado por los usuarios
	dimension provincias[24,2] //array or?genes/destinos + zona tarifaria
	
	numeroDeUsuario<-0
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
	
	provincias[0, 0] <- "Buenos Aires" //Se dividieron las provincias en 6 zonas geograficas, y luego se usa esto como criterio para calcular el costo del pasaje
    provincias[0, 1] <- "1"			 // multiplicando el n?mero de zona de origen por una tarifa base y sumando  esto a destino*tarifaBase
    provincias[1, 0] <- "Cordoba"	// la zona 1 es la zona centro del pa?s, zona 2 litoral, zona 3 cuyo, zona 4/5 norte, zona 6 patagonia
    provincias[1, 1] <- "1"			//con esta l?gica los vuelos son siempre m?s baratos entre provincias de la misma zona y a la vez aumentan de precio al alejarse
    provincias[2, 0] <- "Santa Fe"	//de la zona centro.
    provincias[2, 1] <- "1"
    provincias[3, 0] <- "Mendoza"
    provincias[3, 1] <- "3"
    provincias[4, 0] <- "Tucuman"
    provincias[4, 1] <- "4"
    provincias[5, 0] <- "Entre Rios"
    provincias[5, 1] <- "2"
    provincias[6, 0] <- "Salta"
    provincias[6, 1] <- "4"
    provincias[7, 0] <- "Chaco"
    provincias[7, 1] <- "5"
    provincias[8, 0] <- "Corrientes"
    provincias[8, 1] <- "2"
    provincias[9, 0] <- "Santiago del Estero"
    provincias[9, 1] <- "4"
    provincias[10, 0] <- "San Juan"
    provincias[10, 1] <- "3"
    provincias[11, 0] <- "Jujuy"
    provincias[11, 1] <- "4"
    provincias[12, 0] <- "Rio Negro"
    provincias[12, 1] <- "6"
    provincias[13, 0] <- "Neuquen"
    provincias[13, 1] <- "6"
    provincias[14, 0] <- "Formosa"
    provincias[14, 1] <- "5"
    provincias[15, 0] <- "Chubut"
    provincias[15, 1] <- "6"
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
    provincias[21, 1] <- "6"
    provincias[22, 0] <- "Tierra del Fuego"
    provincias[22, 1] <- "6"
    provincias[23, 0] <- "CABA"
    provincias[23, 1] <- "1"
    
    dimension horariosVuelo[3] 
    horariosVuelo[0] <- "Salida 8:00  / Llegada 11:00"  
    horariosVuelo[1] <- "Salida 12:00 / Llegada 15:00"
    horariosVuelo[2] <- "Salida 16:00 / Llegada 19:00"
	
	mostrar "|------------------------------|"
	mostrar "| *** Aerolineas FivePoint *** |"
	mostrar "|------------------------------|"
	mostrar "|  Se recomienda agrandar esta |"
	mostrar "| ventana para visualizar el   |"
	mostrar "|   programa correctamente     |"
	mostrar "|------------------------------|"
	mostrar "|   Presione una tecla para    |"
	mostrar "|         comenzar...          |"
	mostrar "|------------------------------|"
    Leer pausa
	Limpiar Pantalla
	
    Repetir
		opcionMenu <- menu()
		Segun opcionMenu
			
			1:  registrarUsuario(usuarios, cantidadUsuarios,numeroDeUsuario)
				
			2:	login<-validarLogin(usuarios,cantidadUsuarios)
				si login==Verdadero
					Limpiar Pantalla
					mostrar "|---------------|"
					mostrar "|LOGGIN ACEPTADO|"
					mostrar "|---------------|"
				SiNo
					mostrar "|---------------------------------------|"
					mostrar "|          !!!!ERROR!!!!                |"
					Mostrar "|     DNI O CONTRASEÑA INVALIDOS.       |"
					Mostrar "|  Si no se registro, HAGALO PRIMERO!!  |"
					mostrar "|---------------------------------------|"
				FinSi
				
			3: 
				si login==verdadero
					reservas(cantidadReservas, provincias, horariosVuelo, reservasCompra, codigosDeReserva, costoPasaje, tarifaBase)
					cargaDeEquipaje<-costoEquipaje(opcionesEquipaje, iva, arrayEquipajesGuardados, costoFinalEquipaje, indiceEquipajes)
					mostrarCostoFinal(costoPasaje, costoFinalEquipaje, iva)
					
					// login<- falso 
				SiNo
					Limpiar Pantalla
					mostrar "|-----------------------------------------------------|"
					mostrar "|  SI QUERES RESERVAR, PRIMERO REGITRARSE Y LOGEARSE  |"
					mostrar "|-----------------------------------------------------|"
				finsi
				
				
				
			4:	encontrarIndiceDeReserva<-buscarElemento(reservasCompra,cantidadReservas,3)
				mostrar encontrarIndiceDeReserva // se muestra temporalmente para chequear si est? funcionando correctamente, despu?s borrar
				// a continuacion se recorren todos los arrays para mostrar los datos en el indice donde se escontr? el dni, si funciona correctanmente deber?a mostrar todos los datos correspondientes a un mismo usuario
				
				
				//
				mostrar "Esta es su Reserva:"
				mostrar "Origen    -  Destino   -   Horario    -    cod. Reserva   -  Costo Pasaje"
				mostrarArrayEnIndiceEspecifico(encontrarIndiceDeReserva,reservasCompra,cantidadReservas,5)
				mostrar "Tipo de equipaje    -  cantidad   -   Costo Equipaje"
				mostrarArrayEnIndiceEspecifico(encontrarIndiceDeReserva,arrayEquipajesGuardados,indiceEquipajes,3)
				
				
			5:
				adminUser(usuarios, cantidadUsuarios,6)					
				
				// ////////////////////////////////////////////////////////////////
				
				// ordenamientos y busquedas para el admin user
				
				// ////////////////////////////////////////////////////////
			6:  Limpiar Pantalla

				Repetir
					
					Escribir "ESCRIBA *SALIR* PARA FINALIZAR EL SERVICIO"
					Leer finalizar
					finalizar=Mayusculas(finalizar)
					
					si finalizar=="SALIR" Entonces
						
						mostrar "--------------------------------------------------"
						mostrar " *** Gracias por utilizar nuestros servicios ***"
						mostrar "--------------------------------------------------"
						
						mostrar "--------------------------------------------------"
						mostrar "        ***** AEROLINEAS FIVEPOINT *****"
						mostrar "--------------------------------------------------"
					FinSi

				Mientras Que finalizar<>"SALIR"
				
		FinSegun
	Mientras Que opcionMenu<>6
	
FinAlgoritmo

Funcion return<- menu() //funcion para validar las opciones del menu
	Definir opcionM Como Entero
	Repetir
		mostrar "|------------------------------|"
		mostrar "| *** Aerolineas FivePoint *** |"
		mostrar "|------------------------------|"
		Escribir "1--> REGISTRARSE" //
		Escribir "2--> LOGGIN"
		Escribir "3--> CONSULTE DESTINOS Y RESERVE VUELOS"//En esta versi?n los or?genes/destinos se muestran como un listado con cada provincia con un nro asignado y no hay b?squeda, se muestra tmb l zona traifaria que vamos a usar para calcular el costo del pasaje
		Escribir "4--> VER EL ESTADO DE LA RESERVA" //el usuario puede buscar su reserva por nro de reserva.
		Escribir "5--> ADMINISTRADOR (ACCESO RESTRINGIDO)" // este usuario va a tener un loggin y pass hardcodeado, respresenta a un empleado de la empresa que va a poder realizar distintas b?squedas/ordenamientos
		Escribir "6--> SALIR"
		Leer opcionM
		Limpiar Pantalla
		si opcionM<=0 o opcionM>7
			Escribir "!!!!ERROR,INGRESE UNA OPCION VALIDA!!!!"
			Escribir ""
		FinSi
	Mientras Que opcionM<1 y opt>6
	return<-opcionM
FinFuncion

SubProceso  registrarUsuario(usuarios Por Referencia, cantidadUsuarios Por Referencia,numeroDeUsuario Por Referencia)
    definir nombre, apellido, edad, dni, password1, password2,pausa como cadena
    
	mostrar "-----------------------------------------------"
	mostrar "PARA REGISTRARSE COMPLETE LOS SIGUIENTES DATOS"
	mostrar "-----------------------------------------------"
	Escribir ""
    Mostrar Sin Saltar"Ingresar nombre:"
    leer nombre
    Mostrar Sin Saltar "Ingresar apellido:"
    leer apellido
    
    Repetir
        Mostrar Sin Saltar "Ingresar su DNI:"
        leer dni
    Hasta Que Longitud(dni) >= 6 Y Longitud(dni) <= 8 //validacion DNI entre 6 y 8 caracteres
    
	Repetir
		Mostrar Sin Saltar "Ingrese su edad:" 
		leer edad 
		validacion<-ConvertirANumero(edad)	
		
	Mientras Que validacion<=17 //validaci?n usuario mayor de edad
	
	Repetir
		mostrar "Ingrese su contraseña"
		leer password1
		mostrar "Ingrese nuevamente su contraseña"
		leer password2
		si password1<>password2
			mostrar "ERROR, LAS CONTRASEÑAS NO COINCIDEN."
			Mostrar "INTENTE NUEVAMENTE"
		FinSi
		
	Mientras Que password1<>password2
	
	numeroDeUsuario<-numeroDeUsuario + 1
	
    usuarios[cantidadUsuarios, 0] <- nombre 
    usuarios[cantidadUsuarios, 1] <- apellido
    usuarios[cantidadUsuarios, 2] <- dni
    usuarios[cantidadUsuarios, 3] <- edad
	usuarios[cantidadUsuarios, 4] <- password2
	usuarios[cantidadUsuarios, 5] <- convertirATexto(numeroDeUsuario)//se agreg? un nro de usuario para despue?s hacer ordenamiento alfab?tico y con el nro de usuario dejar el array en su oprden original
	
	Limpiar Pantalla
	mostrar "-------------------------------------"
	mostrar "SU REGISTRO FUE COMPLETADO CON EXITO."
	mostrar "-------------------------------------"
	
	mostrar "-------------------------------------"
	Mostrar "PRESIONE UNA TECLA PARA CONTINUAR"
	mostrar "-------------------------------------"
	Leer pausa
	Limpiar Pantalla
	
    cantidadUsuarios <- cantidadUsuarios + 1 //la var iable cantidadUsuarios que se aumenta en +1 por cada usuario que se registra, permite ir almacenando los datos de cada usuario en una fila distinta del array
    
	// bucle temporal para comprobar si se est?n guardando los datos en el array correctamente, despues bprrar!!!

FinSubProceso

Funcion return<- validarLogin(usuarios,n)
	Definir i Como Entero
	definir dni, password como cadena
	definir dniEncontrado Como Logico
	Limpiar Pantalla
	
	mostrar "-----------------------------------------------"
	mostrar "PARA LOGGEARSE COMPLETE LOS SIGUIENTES DATOS"
	mostrar "-----------------------------------------------"
	Escribir ""
	
	mostrar "Ingrese su DNI"
	leer dni
	mostrar "Ingrese su contraseña"
	leer password
	
	i<-0;
	dniEncontrado <- Falso;
	Mientras i <= n-1 y no dniEncontrado
		si usuarios[i,2] == dni y usuarios[i,4]==password Entonces
			dniEncontrado <- Verdadero //fuerzo la salida del bucle
			mostrar "Se ha loggeado correctamente!"
			
		FinSi
		i <- i +1; 
	FinMientras
	return	<- dniEncontrado
	
FinFuncion

subproceso reservas(cantidadReservas por referencia, provincias, horariosVuelo, reservasCompra Por Referencia, codigosDeReserva Por Referencia, costopasaje Por Referencia, tarifaBase por referencia)
	definir codigoReservaAsignado como entero
	
	mostrar "------------------------------"
	mostrar "     Reserva de Vuelos"
    mostrar "------------------------------"
    mostrar "    Seleccione el origen:"
	mostrar "------------------------------"
    
	para i <- 0 hasta 23 hacer //se muestra el listado de provincias para elegir el origen
		
		mostrar i+1, ". ", provincias[i,0], "     Zona Tarifaria: " provincias[i,1]
		
	FinPara
	
	mostrar "------------------------------"
    mostrar "    Seleccione el origen:"
	mostrar "------------------------------"
	
	Repetir
		leer origen 
	Mientras Que origen<1 o origen>24
	
    mostrar "------------------------------"
    mostrar "    Seleccione el destino:"
	mostrar "------------------------------"// el listado de provincias sigue en pantalla
	
	Repetir
		Repetir
			leer destino 
		Mientras Que destino<1 o destino>24
		si destino == origen entonces
			mostrar "-----------------------------------------------------"
			mostrar "Error, debe seleccionar un destino distinto al origen"
			mostrar "Origen: " origen
			mostrar "Vuelva a seleccionar un destino:"
			mostrar "-----------------------------------------------------"
		FinSi
	Mientras Que destino==origen //validaci?n para que no permita elegir mismo origen/destinos
	
	mostrar "--------------------------------"
	mostrar " Seleccione el horario de vuelo:"
	mostrar "--------------------------------"
	para i<-0 hasta 2
		mostrar  i+1,"     ", horariosVuelo[i] 
	FinPara
	
	Repetir
		leer horario 
	Mientras Que horario<1 o horario>3
	
	costoPasaje<- ConvertirANumero(provincias[origen-1,1])*tarifaBase + (convertirANumero(provincias[destino-1,1]) * tarifaBase)
	Limpiar Pantalla
	mostrar "------------------------------------------"
	mostrar " El costo de su vuelo es de: $" costoPasaje
	mostrar "------------------------------------------"
	mostrar "--------------------------------"
	mostrar "   Su codigo de reserva es: "
	mostrar "--------------------------------"
	
	codigosDeReserva<-  codigosDeReserva +1 
	
	mostrar codigosDeReserva
	
	reservasCompra[cantidadReservas,0]<- (provincias[origen-1,0]) 
	reservasCompra[cantidadReservas,1]<- (provincias[destino-1,0])
	reservasCompra[cantidadReservas,2]<- (horariosVuelo[horario-1])
	reservasCompra[cantidadReservas,3]<- ConvertirATexto(codigosDeReserva)
	reservasCompra[cantidadReservas,4]<- ConvertirATexto(costoPasaje)
	
	cantidadReservas<- cantidadReservas + 1
	
	mostrar "-----------------------------------------------------------"
	mostrar " Resumen de su reserva:"
	mostrar " Origen     Destino       Hora de salida / Hora de llegada"
	mostrar "-----------------------------------------------------------"
	mostrarArray(reservasCompra,cantidadReservas,3) 
	mostrar "-----------------------------------------------------------"
	Escribir "PRESIONE UNA TECLA PARA CONTINUAR"
	Leer pausa
	Limpiar Pantalla
FinSubProceso

funcion return<-costoEquipaje(opcionesEquipaje, iva Por Referencia, arrayEquipajesGuardados,costoFinalEquipaje por referencia, indiceEquipajes Por Referencia)
	definir cantidadValija como entero
	definir  costoAnumero como real
	definir costoCadena como cadena
	cantidadValija<-0
	mostrar "---------------------"
	mostrar "Opciones de equipaje:"
    mostrar "---------------------"
    mostrar "Tipo               Peso                Costo"
    mostrar opcionesEquipaje[0,0], "  " opcionesEquipaje[0,1], "      " opcionesEquipaje[0,2] "	"
    mostrar opcionesEquipaje[1,0], "    " opcionesEquipaje[1,1], "     " opcionesEquipaje[1,2] "	 "
    mostrar opcionesEquipaje[2,0], "    " opcionesEquipaje[2,1], "     " opcionesEquipaje[2,2] "	"
	mostrar opcionesEquipaje[3,0], "     " opcionesEquipaje[3,1], "     " opcionesEquipaje[3,2] "	"
	mostrar "---------------------"
	mostrar "Elija una opcion de equipaje"
	mostrar "1- Equipaje de mano"
	mostrar "2- Valija 10 kg"
	mostrar "3- Valija 15 kg"
	mostrar "4- Valija 20 kg"
	
	Repetir
		leer opcionValija
	Mientras Que opcionValija < 1 o opcionValija > 4
	
	mostrar "------------------------------------------"
	mostrar " Ingresar cantidad de valijas (3 maximo)"
	mostrar "------------------------------------------"
		
		Repetir
			leer cantidadValija
		Mientras Que cantidadValija<1 o cantidadValija>3
		
	costoCadena<- opcionesEquipaje[opcionValija -1,2] 
	
	costoFinalEquipaje <- cantidadValija * ConvertirANumero(costoCadena )
	
	mostrar "-------------------------------------------------------"
	mostrar "Resumen de su carga de equipaje"
	mostrar "-------------------------------------------------------"
	mostrar "Tipo de equipaje: " opcionesEquipaje[opcionValija-1,0]
	mostrar "Cantidad: " cantidadValija
	mostrar "Costo Total de quipaje : " costoFinalEquipaje
	mostrar "-------------------------------------------------------"
	
	arrayEquipajesGuardados[indiceEquipajes,0]<- opcionesEquipaje[opcionValija-1,0]
	arrayEquipajesGuardados[indiceEquipajes,1]<- ConvertirATexto(cantidadValija)
	arrayEquipajesGuardados[indiceEquipajes,2]<- ConvertirATexto(costoFinalEquipaje)
	
	indiceEquipajes <- indiceEquipajes +1 
	
    return<- costoFinalEquipaje
FinFuncion

SubProceso mostrarCostoFinal(costoPasaje Por Referencia, costoFinalEquipaje por referencia, iva por referencia)
	
	
	mostrar "-------------------------------------------------------"
	mostrar "     ******** TICKET FINAL DE SU COMPRA *********"
	mostrar "-------------------------------------------------------"
	
	mostrar "Pasaje: " costoPasaje
	mostrar "Equipaje: " costoFinalEquipaje
	mostrar "Sub-total: " costoPasaje + costoFinalEquipaje
	mostrar "FINAL con IVA: $ " (costoPasaje + costoFinalEquipaje) * iva
	
	mostrar "--------------------------------------"
	Escribir "PRESIONE UNA TECLA PARA CONTINUAR"
	mostrar "--------------------------------------"
	Leer pausa
	Limpiar Pantalla
FinSubProceso

SubProceso mostrarArray(array,n,m)
	
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar array[i,j] "   "
		Fin Para
		Escribir ""
	Fin Para
FinSubProceso

Funcion return<- buscarElemento(array,n,columnaAbuscar)//la reserva ahora se busca por nro de reserva que es irrepetible, a diferencia del DNI. En este momento el programa no le impide a alguien registrarse 2 veces! :(
	Definir i Como Entero;
	definir elementoABuscar como cadena
	
	mostrar "Ingresar nro de RESERVA para ver el estado de su compra"
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
			Escribir "Error ingrese nro de reserva valido" ;
			elementoEncontrado<-Falso
			return<- i-1
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

subproceso adminUser(usuarios, cantidadUsuarios Por referencia,6)
	definir opcionMenu,contador Como Entero
	definir user, pass como cadena
	contador<-0
	
	//-----------------------------//
	// user: admin                //
	//                            //
	//password: admin             //
	//----------------------------//
	
	Repetir
		
		mostrar "Ingrese su nombre de usuario"
		leer user
		mostrar "Ingrese su password"
		leer pass
		contador<- contador +1
		
	Mientras Que (user<> "admin" o pass<> "admin") y contador<3
	
	Si contador == 3 Entonces
		Escribir "Ha ingresado los datos de forma incorrecta 3 veces, vuelva a intentarlo mas tarde..."
		Leer pausa
		
	SiNo
		
		mostrar "Ingrese una opcion"
		mostrar "1 - Ver usuarios registrados en el sistema"
		mostrar "2 - Buscar usuario registrado por apellido"//         2 - buscar un usuario registrado espec?fico(por apellido)
		mostrar "3 - Visualizar usuarios Orden Alfabetico(Apellido)"
		mostrar "4 - Visualizar Ventas"
		mostrar "5 - Ventas ordenadas por monto"
		mostrar "6 - Buscar Ventas segun Origen/destino"
		mostrar "7 - salir"
		Repetir
			leer opcionMenu
		Mientras Que opcionMenu<1 o opcionMenu>7
		
		Repetir
			Segun opcionMenu Hacer
				1:
					mostrarArray(usuarios,cantidadUsuarios,6)
					
					
					
				2:
					
					buscarUsuarioRegistrado(usuarios,cantidadUsuarios,6)
					
					
				3:
					ordernarUsuariosDESC(usuarios,cantidadUsuarios,6,1)
					mostrarArray(usuarios,cantidadUsuarios,6)
					ordernarArregloASC(usuarios,cantidadUsuarios,6,5)//Regresa a su orden original, ordenandolo por nro de usuario registrado
					//continuar
				4:
					
					
					
				5:
					
					
					
				6:	
					
					
					
				7:
					Escribir "Saliendo de modo administrador."
					Escribir "Para operar nuevamente vuelva a loguearse."
					Leer pausa
					
			Fin Segun	
		Mientras Que opcionMenu<>7
		
	Fin Si
	
	
	
FinSubProceso



SubProceso mostrarUsuarios(usuarios,n,m) // ya hay un subproceso de mostrar array!!!!!
	definir i,j como entero
	Para i<-0 Hasta n-1 Hacer
		Para j<-0 Hasta m-1 Hacer
			Escribir Sin Saltar usuarios[i,j] "   "
		Fin Para
		Escribir ""
	Fin Para
FinSubProceso

SubProceso buscarUsuarioRegistrado(usuarios,n,m)
	
FinSubProceso

SubProceso ordernarUsuariosDESC(array,n,m,columnaAOrdenar) // para ordenar usuarios Alfab?ticamente
	Definir aux Como cadena
	para i<-0 hasta n-2 Hacer 
		para k<-i+1 hasta n-1 Hacer 
			si array[i,1]>array[k,1] Entonces
				Para j<-0 Hasta m-1 Hacer
					aux <- array[i,j]
					array[i,j] <- array[k,j]
					array[k,j] <- aux
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso ordernarArregloASC(array,n,m,columnaAOrdenar) // para ordenar usuarios por nro de usuario (dps de ordenar alfab?ticamente)
	Definir aux Como Texto
	para i<-0 hasta n-2 Hacer 
		para k<-i+1 hasta n-1 Hacer 
			si array[i,columnaAOrdenar]>array[k,columnaAOrdenar] Entonces
				Para j<-0 Hasta m-1 Hacer
					aux <- array[i,j]
					array[i,j] <- array[k,j]
					array[k,j] <- aux
				Fin Para
			FinSi
		FinPara
	FinPara
FinSubProceso

//----------------------------------------------------------------------//
//************ Faltantes/cambios que se pueden agregar *******************
//----------------------------------------------------------------------//

//funcion()
//	

// crear una funcion que impida  a un usuario registrarse 2 veces?(buscando si el dni ya est? en el array usuarios)

//FinFuncion

//-------------------------------------------




// puntos 2,4,5,6 del USER ADMIN (distintas busquedas y ordenamientos, varios subprocesos se pueden reutilizar)

//hay que ver como se sale del switch, ahora siempre est? en bucle, hay que pedirle al usuario opcionMenu
//al final de cada case

//en el login del user admin tiene 3 intentos m?ximo pero hay que agregarle mensaje informativo o de error, 
//ahora no muestra nada

//-----------------------------------------

//funcion()


// posibilidad de cancelar reserva?(se podr?a dejar el array usuarios y borrar los datos de reservasCompra y arrayEquipajesGuardados)

//FinFuncion

//----------------------------------------------

// faltan varios "LIMPIAR PANTALLA"  y mejorar est?ticamente lo que se ve en consola, sobre todo cu?ndo se llama al subprocesp mostrarArray
// no se cu?nto se puede mejorar esto ya que las columnas siempre quedan algo desalineadas seg?n la longitud de lo que est? en el array
//de todas formas al comienzo del programa se agreg? un mensaje que recomienda agrandar la ventana para que se vea mejor.

//-----------------------------------------------------------------------

//NO ME DI CUENTA QUE NO ESTABA CON EL PERFIL DE LA TUP! por lo que hay que revisar todo y que no quede ninguna VARIABLE sin definir
// hay que revisar todas las i,j y todos los contadores/sumadores

//------------------------------------------------------------------------


// en la consulta ESTADO DE RESERVA falta agregarle un mensaje de error cu?ndo se ingresa un n?mero incorrecto y que no siga adelante,
//ahora muestra estos encabezados a?n cu?ndo el nro sea inv?lido:


//mostrar "Esta es su Reserva:"
//mostrar "Origen    -  Destino   -   Horario    -    cod. Reserva   -  Costo Pasaje"

//mostrar "Tipo de equipaje    -  cantidad   -   Costo Equipaje"

//-------------------------------------------------

// al array horariosVuelos podr?amos directamente agregarle una fecha simb?lica(sin cambiar la dimension!), si de todas formas es una cadena y no afecta en nada,ser?a solamente algo est?tico
// ya que queda raro que en ning?n momento del programa se muestre una fecha


//----------------------------------------------------1
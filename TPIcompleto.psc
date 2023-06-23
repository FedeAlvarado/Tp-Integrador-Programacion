Algoritmo ReservaVuelos
    definir usuarios, provincias, reservasCompra, horariosVuelo, arrayEquipajesGuardados, opcionesEquipaje como cadena
    definir origen, destino, horario, codigosDeReserva,opcionValija, opcionCantidad como entero
    definir retorno, registro, login Como Logico
	definir costoTotal como real
	dimension usuarios[100, 5]
    dimension reservasCompra[100,4]
	dimension opcionesEquipaje[4,3] 
	Dimension arrayEquipajesGuardados[100,3]

	
	codigosDeReserva<- 1000
    cantidadUsuarios <- 0
	cantidadReservas <- 0
	
	
	
	iva<-1.21
    
    opcionesEquipaje[0,0] <- "Equipaje de mano"
    opcionesEquipaje[0,1] <- "Hasta 5 kg"
    opcionesEquipaje[0,2] <- "0"  // equipaje de mano hasta 5 kg
    
    opcionesEquipaje[1,0] <- "Valija"
    opcionesEquipaje[1,1] <- "Hasta 10 kg"
    opcionesEquipaje[1,2] <- "1000"  // valija  hasta 10 kg
    
    opcionesEquipaje[2,0] <- "Valija mediana"
    opcionesEquipaje[2,1] <- "Hasta 15 kg"
    opcionesEquipaje[2,2] <- "2000"  // valija  hasta 15 kg
	
	opcionesEquipaje[3,0] <- "Valija grande"
    opcionesEquipaje[3,1] <- "Hasta 20 kg"
    opcionesEquipaje[3,2] <- "3000"  // valija  hasta 20 kg
	
    dimension provincias[24] //array orígenes/destinos
    provincias[0] <- "Buenos Aires"
    provincias[1] <- "Córdoba"
    provincias[2] <- "Santa Fe"
    provincias[3] <- "Mendoza"
    provincias[4] <- "Tucumán"
    provincias[5] <- "Entre Ríos"
    provincias[6] <- "Salta"
    provincias[7] <- "Chaco"
    provincias[8] <- "Corrientes"
    provincias[9] <- "Santiago del Estero"
    provincias[10] <- "San Juan"
    provincias[11] <- "Jujuy"
    provincias[12] <- "Río Negro"
    provincias[13] <- "Neuquén"
    provincias[14] <- "Formosa"
    provincias[15] <- "Chubut"
    provincias[16] <- "Misiones"
    provincias[17] <- "San Luis"
    provincias[18] <- "La Rioja"
    provincias[19] <- "Catamarca"
    provincias[20] <- "La Pampa"
    provincias[21] <- "Santa Cruz"
    provincias[22] <- "Tierra del Fuego"
    provincias[23] <- "CABA"
    
    dimension horariosVuelo[3] 
    horariosVuelo[0] <- "salida 8:00 / llegada 11:00"  //esta sería la opción más sencilla, un array unidimensional de cadena que aplique a todos los orígenes/destinos
    horariosVuelo[1] <- "salida 12:00 / llegada 15:00"
    horariosVuelo[2] <- "salida 16:00 / llegada 19:00"
    
    Repetir
		opcionMenu <- menu()
		Segun opcionMenu
			
			1:   registrarUsuario(usuarios, cantidadUsuarios)
				
			2:	login<-validarLogin(usuarios)
				si login==Verdadero
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
					reservas(cantidadReservas, provincias, horariosVuelo, reservasCompra)
				SiNo
					mostrar "---------------------------------------------------------------------------"
					mostrar "debe registrase y loggearse correctamente para acceder a reservar un pasaje"
					mostrar "---------------------------------------------------------------------------"
				finsi
				
				//cargaDeEquipaje<-costoEquipaje(opcionesEquipaje, iva, arrayEquipajesGuardados)
				
			4:
				Escribir "Gracias por visitar nuestro programa";
		FinSegun
	Mientras Que opcionMenu<>6
	
FinAlgoritmo

	subproceso reservas(cantidadReservas por referencia, provincias, horariosVuelo, reservasCompra Por Referencia)
	mostrar "Reserva de Vuelos"
    mostrar "------------------------------"
    mostrar "Seleccione el origen:"
	mostrar "------------------------------"
    
	// A partir de acá habría que convertir esto a función o subprocesps y que los datos del resumen final 
	// se guarden en un array, que sería el mismo dónde se guardan los datos del registro
	// de los usuarios ? o habría un array para el registro de usuario, otra para el equipaje
	// otro para el pasaje, etc...y después se concatenan ..¿?
    
	para i <- 0 hasta 23 hacer //se muestra el listado de provincias para elegir el origen
        mostrar i+1, ". ", provincias[i]
	FinPara
	
	
	leer origen // validar
	
    mostrar "------------------------------"
    mostrar "Seleccione el destino:"
	mostrar "------------------------------"// el listado de provincias sigue en pantalla
	
	Repetir
		leer destino 
		si destino == origen entonces
			mostrar "Error, debe seleccionar un destino distinto al origen"
		FinSi
	Mientras Que destino==origen //validación para que no permita elegir mismo origen/destinos
	
	mostrar "Seleccione el horario de vuelo:"
	para i<-0 hasta 2
		mostrar  i+1,"     ", horariosVuelo[i] 
	FinPara
	
	leer horario //validar
	
	mostrar "su código de reserva es: "
	mostrar codigosDeReserva +1 
	
	mostrar "Reserva realizada:" //resumen
	mostrar "Origen:", provincias[origen - 1]
	mostrar "Destino:", provincias[destino - 1]
	mostrar "Horario de vuelo:", horariosVuelo[horario - 1]
	
	reservasCompra[cantidadReservas,0]<- ConvertirATexto(origen) //solo debería convertir a texto el código de reserva pero  provisoriamente convierto todo porque pseint me tira tipo de dato inválido
	reservasCompra[cantidadReservas,1]<- ConvertirATexto(destino)
	reservasCompra[cantidadReservas,2]<- ConvertirATexto(horario)
	reservasCompra[cantidadReservas,3]<- ConvertirATexto(codigosDeReserva)
	
	cantidadReservas<- cantidadReservas + 1 //
	
FinSubProceso

	
	Funcion return<- menu() //funcion para validar las opciones del menu
		Definir opcionM Como Entero
		Repetir
			Escribir "Ingrese una opción del MENU: " 
			Escribir "1- Registrarse como usuario" //
			Escribir "2- loggin "
			Escribir "3- Consultar Destinos y realizar compra"//En esta versión los orígenes/destinos se muestran como un listado con cada provincia con un nro asignado y no hay búsqueda.
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
    
    cantidadUsuarios <- cantidadUsuarios + 1 //la variable cantidadUsuarios que se aumenta en +1 por cada usuario que se registra, permite ir almacenando los datos de cada usuario en una fila distinta del array
    
   // para i <- 0 hasta cantidadUsuarios - 1 // bucle temporal para comprobar si se están guardando los datos en el array correctamente
   //     para j <- 0 hasta 4
  //          mostrar "", usuarios[i, j]
   //     FinPara
  //  FinPara
    
    
	
	
		mostrar "Registro exitoso!"
	
	
FinSubProceso


	

	Funcion return<- validarLogin(usuarios)
		Definir i Como Entero
		definir dni, password como cadena
		
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

funcion return<-costoEquipaje(opcionesEquipaje, iva Por Referencia, arrayEquipajesGuardados)
	definir cantidadValija como entero
	definir costoFinal, costoAnumero como real
	definir costoCadena como cadena
	
	mostrar "Opciones de equipaje:"
    mostrar "---------------------"
    mostrar "Tipo               Peso                Costo"
    mostrar opcionesEquipaje[0,0], "  " opcionesEquipaje[0,1], "      " opcionesEquipaje[0,2] "	"
    mostrar opcionesEquipaje[1,0], "            " opcionesEquipaje[1,1], "     " opcionesEquipaje[1,2] "	 "
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
		mostrar "ingresar cantidad de valijas (3 máximo)"
		Repetir
			leer cantidadValija
		Mientras Que cantidadValija<1 o cantidadValija>3
		
		
	Mientras Que opcionValija < 1 o opcionValija > 4
	
	costoCadena<- opcionesEquipaje[opcionValija -1,2] // hice un solo array de cadena, en esta linea se busca la cadena en el array...
	costoAnumero<- ConvertirANumero(costoCadena) // y acá se convierte a número para poder calcular el costo
	
	costoFinal <- cantidadValija * costoAnumero * iva // cálculo final
	
	mostrar "resumen de su carga de equipaje"
	mostrar "tipo de equipaje: " opcionesEquipaje[opcionValija-1,0]
	mostrar "cantidad: " cantidadValija
	mostrar "costo Total de quipaje IVA incluído: " costoFinal
	
	arrayEquipajesGuardados[cantidadReservas,0]<- opcionesEquipaje[opcionValija-1,0]
	arrayEquipajesGuardados[cantidadReservas,1]<- ConvertirATexto(cantidadValija)
	arrayEquipajesGuardados[cantidadReservas,2]<- ConvertirATexto(costoFinal)
	
	
    return<- costoFinal
FinFuncion


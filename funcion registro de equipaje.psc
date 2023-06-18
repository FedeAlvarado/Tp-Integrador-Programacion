Algoritmo TPIequipajes
    definir opcionesEquipaje como cadena
	definir costoTotal como real
	definir opcionValija, opcionCantidad como entero
    dimension opcionesEquipaje[4,3]  // [tipo, peso, costo]
	
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
	
	mostrar "elegir Opciones de equipaje"
	mostrar""
	mostrar""
	
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
	
	costoTotal <- costoEquipaje(opcionesEquipaje, iva) //llamada a la función
    mostrar "El costo total es: ", costoTotal
	

	
	
FinAlgoritmo

funcion return<-costoEquipaje(opcionesEquipaje, iva)
	definir cantidadValija como entero
	definir costoFinal, costoAnumero como real
	definir costoCadena como cadena

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
    
    return<- costoFinal
FinFuncion
	



Algoritmo sin_titulo
    definir usuarios como cadena
    definir retorno Como Logico
    dimension usuarios[100, 5]
    cantidadUsuarios <- 0
    
    return <- registrarUsuario(usuarios, cantidadUsuarios)
    
    si retorno == Verdadero
        mostrar "Registro exitoso"
    FinSi
	
FinAlgoritmo

Funcion return<- registrarUsuario(usuarios Por Referencia, cantidadUsuarios Por Referencia)
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
    
    para i <- 0 hasta cantidadUsuarios - 1 // bucle temporal para comprobar si se están guardando los datos en el array correctamente
        para j <- 0 hasta 4
            mostrar "", usuarios[i, j]
        FinPara
    FinPara
    
    return <- Verdadero
FinFuncion

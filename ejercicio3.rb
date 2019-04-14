#1. Crear un menú que permita registrar la información de los alumnos del curso.
#
#2. Opción 1: Permite ingresar los datos de una persona:
#    - Nombre
#    - Edad
#    - Comuna
#    - Género
#
#3. Opción 2: Permite editar los datos de la persona.
#4. Opción 3: Permite eliminar una persona.
#5. Opción 4: Muestra la cantidad de personas ingresadas.
#6. Opción 5: Muestra las comunas de todas las personas.
#
#	*hint:* Generar un array con las comunas, eliminar repeticiones. Considerar que pueden haber nombres escritos con mayúscula y minúscula.
#
#5. Opción 6: Muestra una lista con todas las personas que tengan entre 20 y 25 años.
#6. Opción 7: Muestra la suma de las edades de todas las personas.
#7. Opción 8: Muestra el promedio de las edades del grupo.
#8. Opción 9: Muestra dos listas de personas, una por cada género.
#9. El menú debe repetirse hasta que el usuario ingrese la opción 10 (salir).

# 1. Información de problema  
#%w convierte todos los elementos el arreglo en strings

opciones_menu = ['Opción 1: Ingresar datos',
                'Opción 2: Editar existente', 
                'Opción 3: Eliminar existente', 
                'Opción 4: Mostrar la cantidad de personas', 
                'Opción 5: Mostrar comunas de personas', 
                'Opción 6: Mostrar lista de personas entre 20 y 25', 
                'Opción 7: Mostrar suma de edades de todos', 
                'Opción 8: Mostrar promedio de edades de todos (grupo)', 
                'Opción 9: Mostrar listas de personas, según género', 
                'Opción 10: Salir del menú']

curso_estudiantes = 0

opcion_seleccionada = 0

opcion_salida = opciones_menu.length

instrucciones = "Seleccione una opción para avanzar :) \n"

instrucciones_nuevas = "Seleccione una nueva opción para avanzar :) \n"

# 2. Declarar el procesamiento
def mostrar_menu(menu)
  puts menu
end

def mostrar_instrucciones(instruccion)
  puts instruccion
end

def seleccionar_opcion(opciones)
  alternativa_seleccionada = gets.chomp
  alternativa_transformada = alternativa_seleccionada.to_f.to_i
  cantidad_opciones = opciones.length

  while !(0 < alternativa_transformada and alternativa_transformada <= cantidad_opciones)
    puts "Escribiste '#{alternativa_seleccionada}', y ésta es una opción no válida :(."
    puts "Debes escoger un número entre '1' y '#{cantidad_opciones}'\n"
    alternativa_seleccionada = gets.chomp
    alternativa_transformada = alternativa_seleccionada.to_f.to_i
  end
  return alternativa_transformada
end

# Opción 1
def ingresar_alumno(grupo)  
    puts 'Eligió ingresar los datos de un estudiante. A continuación le pediremos los datos según corresponda:'
    puts '¿Cuál es el nombre del estudiante?'
    nombre_alumno = gets.chomp
    # print nombre_alumno
    puts '¿Cuál es la edad del estudiante?'
    edad_alumno = gets.chomp.to_i
    # print edad_alumno
    puts '¿Cuál es la comuna donde vive el estudiante?'
    comuna_alumno = gets.chomp
    # print comuna_alumno
    puts '¿Cuál es el género (opciones: masculino o femenino) del estudiante?'
    genero_alumno = gets.chomp
    nuevo_alumno = Array.new
    nuevo_alumno.push(edad_alumno)
    nuevo_alumno.push(comuna_alumno.capitalize)
    nuevo_alumno.push(genero_alumno.capitalize)
    grupo[nombre_alumno.capitalize.to_sym] = nuevo_alumno
    puts "\n"
    print grupo
end

# Opción 2
def editar_alumno(grupo)
    puts 'Escogió la opción 2 para editar estudiantes.'
    puts '¿Cuál de los siguientes es el estudiante que quiere editar?'
    grupo.each_key { |nombre| print "#{nombre}"}
    nombre_alumno = gets.chomp
    if grupo.has_key?(nombre_alumno.capitalize.to_sym)
        puts "¿Cuál es el nuevo nombre designado para #{nombre_alumno}?"
        nombre_alumno = gets.chomp
        puts "¿Cuál es la nueva edad designado para #{nombre_alumno}?"
        edad_alumno = gets.chomp
        puts "¿Cuál es la nueva comuna donde vive #{nombre_alumno}?"
        comuna_alumno = gets.chomp
        puts "¿Cuál es el nuevo género (masculino o femenino) designado para #{nombre_alumno}?"
        genero_alumno = gets.chomp
        nuevo_alumno = []
        nuevo_alumno.push(edad_alumno.to_i)
        nuevo_alumno.push(comuna_alumno.capitalize)
        nuevo_alumno.push(genero_alumno.capitalize)
        grupo[nombre_alumno.capitalize.to_sym] = nuevo_alumno
        puts "Los datos modificados para #{nombre_alumno.capitalize} son #{grupo}"
    else
        puts "El nombre señalado no está en el registro de curso disponible :( .\n"
    end
end

# Opción 3
def eliminar_alumno(grupo)
    puts 'Escogió la opción 3 para eliminar del registro un estudiante.'
    puts "¿Cuál de los siguientes es el estudiante que quiere borrar? \n"
    grupo.each_key { |nombre| print "#{nombre}"}
    nombre_alumno = gets.chomp
    if grupo.has_key?(nombre_alumno.capitalize.to_sym)
        grupo.delete(nombre_alumno.capitalize.to_sym)
        puts "El estudiante de nombre #{nombre_alumno.capitalize} ha sido borrado del registro :)\n"
    else
        puts "El nombre señalado no está en el registro de curso disponible :( \n."
    end
end

# Opción 4
def mostrar_grupo(grupo)
    puts 'Escogió la opción 4 para mostrar la cantidad de estudiantes.'
    puts "La cantidad de estudiantes del grupo de curso es de #{grupo.length} personas"
end

# Opción 5
def mostrar_comunas_grupo(grupo)
    puts 'Escogió la opción 5 para mostrar la cantidad de comunas.'
    grupo.each { |key, value| puts "La comuna de #{key} es #{value[1]};"}
end

# Opción 6
def mostrar_grupo_edad(grupo, edad1 = 20, edad2 = 25)
    puts "Escogió la opción 6 para mostrar la cantidad de estudiantes con edades entre #{edad1} y #{edad2}."
    cantidad_alumnos = 0
    grupo.each do |key, value|
        if value[0] >= edad1 && value[0] <= edad2
            cantidad_alumnos += 1
        end
    end
    puts "La cantidad de estudiantes con los parámetros señalados es de #{cantidad_alumnos} personas."
end

# Opción 7
def mostrar_suma_edad(grupo)
    puts 'Escogió la opción 7 para mostrar la suma de edades entre los estudiantes del curso.'
    sumatoria_edades_alumnos = 0
    grupo.each { |key, value| sumatoria_edades_alumnos += value[0]}
    puts "La sumatoria de edades entre los estudiantes es de #{sumatoria_edades_alumnos} años."
end

# Opción 8
def mostrar_promedio_edad(grupo)
    puts 'Escogió la opción 8 para mostrar el promedio de edades entre los estudiantes del curso.'
    sumatoria_edades_alumnos = 0
    grupo.each { |key, value| sumatoria_edades_alumnos += value[0]}
    promedio_edades_alumnos = sumatoria_edades_alumnos.to_f / (grupo.length)
    puts "El promedio de edades de todos los estudiantes del curso es de #{promedio_edades_alumnos.round(2)} años."
end

# Opción 9
def mostrar_grupo_genero(grupo)
    puts 'Escogió la opción 9 para mostrar grupos de estudiantes según género.'
    grupo_masculino = []
    grupo_femenino = []
    grupo.each do |key, value|
        if value[2] == 'Masculino'
            grupo_masculino.push(key)
        else
            grupo_femenino.push(key)
        end
    end
    puts "El grupo femenino está compuesto por #{grupo_femenino} y el masculino por #{grupo_masculino}"
end

# Opción 10
def salir_menu
    puts 'Escogió la opción 10 para salir del menú. Adiosito~'
    exit
end



# 3. Procesar
mostrar_instrucciones(instrucciones)
mostrar_menu(opciones_menu)

while (opcion_seleccionada != opcion_salida) do
    opcion_seleccionada = seleccionar_opcion(opciones_menu)
    case opcion_seleccionada
    when 1
        ingresar_alumno(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 2
        editar_alumno(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 3
        eliminar_alumno(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 4
        mostrar_grupo(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 5
        mostrar_comunas_grupo(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 6
        mostrar_grupo_edad(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 7
        mostrar_suma_edad(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 8
        mostrar_promedio_edad(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when 9
        mostrar_grupo_genero(curso_estudiantes)
        mostrar_instrucciones(instrucciones_nuevas)
    when opcion_salida
        salir_menu
        break
    end
end
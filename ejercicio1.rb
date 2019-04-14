#Dado el array:
#
#~~~ruby
# a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]
#~~~
#
#1. Utilizando *map* generar un nuevo arreglo con cada valor aumentado en 1.
#2. Utilizando *map* generar un nuevo arreglo que contenga todos los valores convertidos a *float*.
#3. Utilizando *map* generar un nuevo arreglo que contenga todos los valores convertidos a *string*.
#4. Utilizando *reject* descartar todos los elementos <u>menores</u> a 5 en el array.
#5. Utilizando *select* descartar todos los elementos <u>mayores</u> a 5 en el array.
#6. Utilizando *inject* obtener la suma de todos los elementos del array.
#7. Utilizando *group_by* agrupar todos los números por paridad (si son pares, es un grupos, si son impares es otro grupo).
#8. Utilizando *group_by* agrupar todos los números mayores y menores que 6.

a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]
# 1:
print a.map { |x| x + 1 }
# 2:
print a.map { |x| x.to_f }
# 3:
print a.map { |x| x.to_s }
# 4:
print a.reject { |x| x < 5 }
# 5:
print a.select { |x| x > 5 }
# 6:
puts a.inject { |sum,x| sum + x }
# 7:
puts a.group_by { |x| x.even? }
# 8:
puts a.group_by { |x| x < 6 }
arch = File.open("archivo_prueba.csv")
contenido = arch.readlines()
arch.close

#método
def alumnos_aprobados(promedio=5)
	arch = File.open("archivo_prueba.csv")
	contenido = arch.readlines()
	arch.close

	hash_alumnos = {}
	contenido.each do |linea|
		prom = 0
		arr = linea.split(", ")
		divisor = arr.length-1
		
		arr.each do |nota|
			prom += nota.chomp.to_f
		end			
		
		prom = prom / divisor
		if prom >= promedio
			hash_alumnos[arr[0]] = prom
		end
	end

	if hash_alumnos.length > 0
		puts "Los alumnos aprobados son (nota mínima: #{promedio}):"
		hash_alumnos.each do |k,v|
			puts "#{k}, promedio: #{v} "
		end
	else
		puts "No hay alumnos aprobados"
	end
		
end

opcion = 1

while opcion != 4		
	puts "Menu: Ingrese una opción entre 1 y 4"
	puts "1: Para generar un archivo con alumnos y promedio de sus notas"
	puts "2: Para mostrar inasistencias totales"
	puts "3: Para conocer qué alumnos aprobaron"
	puts "4: Salir"

	opcion = gets.chomp.to_i

	if opcion == 1
		arch_prom_notas = File.open("promedio_notas.txt","w")
		arch_prom_notas.close

		divisor = 0

		contenido.each do |linea|
			prom = 0
			arr = linea.split(", ")
			divisor = arr.length-1
			
			arr.each do |nota|
				prom += nota.chomp.to_f
			end
			
			prom = prom / divisor
			arch_prom_notas = File.open("promedio_notas.txt","a")
			arch_prom_notas.puts ("#{arr[0]}, #{prom}")
		end
		puts "Fue creado el archivo arch_prom_notas.txt"
		puts ""
	end

	if opcion == 2
		total = 0
		contenido.each do |linea|
			cont = 0
			arr = linea.split(", ")

			arr.each do |inasistencia|
				if inasistencia.chomp == "A"
					cont += 1
				end
			end
			if cont > 0
				total += cont
				puts "La cantidad de inasistencias de #{arr[0]} es: #{cont}"
			end
		end

		if total > 0
			puts "Total: #{total}"
			puts ""
		end
	end

	if opcion == 3
		puts "Ingrese nota mínima de Aprobación (5.0 por defecto):"
		nota = gets.chomp.to_f

		if nota == 0
			alumnos_aprobados()
		else
			alumnos_aprobados(nota)
		end
		puts ""
	end

	if opcion > 4
		puts "Opción NO válida, vuelva a intentarlo"
		puts ""
	end

end



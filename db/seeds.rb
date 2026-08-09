rio_gallegos = Locality.find_or_create_by!(name: "Rio Gallegos", province: "Santa Cruz")
calafate = Locality.find_or_create_by!(name: "El Calafate", province: "Santa Cruz")

industrial = School.find_or_create_by!(code: "EET-01") do |school|
  school.name = "Escuela Industrial Nro 1"
  school.address = "Av. San Martin 1250"
  school.level = :secondary
  school.locality = rio_gallegos
end

primaria = School.find_or_create_by!(code: "EPP-22") do |school|
  school.name = "Escuela Provincial Primaria Nro 22"
  school.address = "Belgrano 845"
  school.level = :primary
  school.locality = rio_gallegos
end

secundaria_calafate = School.find_or_create_by!(code: "CPES-09") do |school|
  school.name = "Colegio Secundario Nro 9"
  school.address = "Los Glaciares 320"
  school.level = :secondary
  school.locality = calafate
end

Project.find_or_create_by!(title: "Huerta escolar comunitaria", school: primaria) do |project|
  project.description = "Proyecto ambiental para producir alimentos y trabajar ciencias naturales."
  project.category = :environment
  project.status = :active
  project.starts_on = Date.new(2026, 3, 15)
  project.ends_on = Date.new(2026, 11, 30)
end

Project.find_or_create_by!(title: "Club de robotica educativa", school: industrial) do |project|
  project.description = "Taller de programacion y armado de prototipos para estudiantes de secundaria."
  project.category = :technology
  project.status = :active
  project.starts_on = Date.new(2026, 4, 1)
  project.ends_on = Date.new(2026, 10, 20)
end

Project.find_or_create_by!(title: "Lecturas patagonicas", school: secundaria_calafate) do |project|
  project.description = "Ciclo de lectura, escritura y produccion oral sobre autores regionales."
  project.category = :reading
  project.status = :draft
  project.starts_on = Date.new(2026, 5, 5)
  project.ends_on = Date.new(2026, 9, 15)
end

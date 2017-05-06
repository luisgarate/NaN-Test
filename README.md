# NaN-Test
Test NaN Labs

##Aclaraciones
Este es el código original que evaluó Mariano Moretti. Se puede mejorar por medio de refactoring, aplicando un **extract method** en la siguiente sección de código.
```
    result = response.scan(/\w+\.js/)
    unless result.empty?
      @webs[row.first.strip] << result
    end
```
Armando un método que se pueda reutilizar, por ejemplo:
```

  def scan_nan(text, web)
    result = text.scan(/\w+\.js/)
    @webs[web] << result unless result.empty?
  end
```


En la carpeta ```/app/services/ ``` se cuenta el archivo ```Parser.rb```el cual contiene la solución.



Para poder probar la solución se deben hacer dos cosas previas.
1- Modificar el path en las líneas 7 y 14, y poner los propios.

2- Tener los archivos ```index.html ``` de Trello, como de Clarín de forma local. En la prueba se los obtuvo por medio de ```wget```antes de comenzar.

Por último se debe abrir una consola ``` irb``` en donde se ejecute el siguiente código.
```
parser = Parser.new
parser.file_parse
parser.dependencies
parser.length
```

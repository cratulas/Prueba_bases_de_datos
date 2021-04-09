-- Creacion base de datos prueba
CREATE DATABASE prueba;


-- Se ingresa a la base de datos creada
\c prueba

-- Creacion tabla clientes
CREATE TABLE clientes(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    rut VARCHAR(15),
    direccion VARCHAR(255)
);


-- Creacion tabla productos
CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    valor INTEGER    
);


-- Creacion tabla facturas
CREATE TABLE facturas(
    numero SERIAL PRIMARY KEY,
    fecha DATE,
    subtotal INTEGER,
    impuesto SMALLINT,
    total INTEGER,
    cliente_id SMALLINT,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);


-- Creacion tabla categorias
CREATE TABLE categorias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT
);


-- Creacion tabla relacionadora entre factura y producto
CREATE TABLE factura_producto(
    cantidad SMALLINT,
    valor_total INTEGER,
    factura_numero INTEGER,
    producto_id INTEGER,
    FOREIGN KEY (factura_numero) REFERENCES facturas(numero),
    FOREIGN KEY (producto_id) REFERENCES productos (id)
);


-- Creacion tabla relacionadora entre categoria y producto
CREATE TABLE categoria_producto(
    producto_id INTEGER,
    categoria_id INTEGER,
    FOREIGN KEY (producto_id) REFERENCES productos(id),
    FOREIGN KEY (categoria_id) REFERENCES categorias (id)
);

/* Se debe crear el modelo en la base de datos, en una base de datos llamada prueba, e insertar los siguientes registros */


-- 5 clientes
INSERT INTO clientes(nombre,rut,direccion) VALUES ('Mauricio Mora','188612869','Rio Jordan 895');
INSERT INTO clientes(nombre,rut,direccion) VALUES ('Juan Perez','176569357','Manuel Rodriguez 98');
INSERT INTO clientes(nombre,rut,direccion) VALUES ('Alejandro Ruiz','152314569','Av Pajaritos 355');
INSERT INTO clientes(nombre,rut,direccion) VALUES ('Juan Gabriel','12456789k','Av Providencia 12');
INSERT INTO clientes(nombre,rut,direccion) VALUES ('Jose Luiz Rodriguez','12456789k','Av Providencia 12');

-- 8 productos

/* 1 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Samsung Galaxy S21', 'Ya no volverás a perderte esa toma perfecta. Conoce los Galaxy S21 5G y S21+ 5G. Están diseñados para revolucionar el video y la fotografía, con una resolución cinematográfica de 8K para que puedas tomar fotos épicas mientras haces un video. Ambos modelos tienen todas las características que necesitas: 64 MP, el conjunto de chips más rápido y una batería increíble que dura todo el día.1 Tu mundo será realmente épico.', 65);

/* 2 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('AOC Monitor 21,5','El E2270SWHN ofrece una gran calidad de imagen a una resolución de 1920 x 1080 Full HD, proporcionando características y conectividad que le benefician. El monitor de 21,5" pulgadas, el E2270SWHN también tiene todas la conectividad que necesita para vídeo y audio digital de alta calidad.',23);

/* 3 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Asus TUF F15 FX506LI', 'Diseñado para juegos serios y durabilidad en el mundo real, el ASUS TUF Gaming F15 (FX506) es un portátil para juegos con Windows 10 completamente cargado que puede llevarte a la victoria. Con la última CPU Intel® Core ™ i5 de décima generación y la GPU GeForce® GTX hasta 1650 Ti, el juego lleno de acción es rápido, fluido y satura por completo las veloces pantallas de nivel IPS de hasta 144Hz.',95);

/* 4 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Apple Macbook Air MQD32CI/A', 'Haz que tus ideas brillen de sol a sombra. Disfruta de una larga duración de bataería para que puedas trabajar en tu rutina. Los procesadores Intel Core i5 de quinta de Intel están listos para realizar una gran variedad de tareas. Una increíble potencia que viene en un diseño unibody de sólo 1,7 cm de grosor y 1,35 kg de peso. Elegancia y rendimiento de primer nivel!', 77);

/* 5 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Kaspersky Internet Security', 'Mantente seguro, sin importar lo que hagas en el trabajo y en casa. Para cualquier cosa que hagas en línea, ya sea en tu PC, Mac o en dispositivos Android, Internet Security de Kaspersky te protege de malware, cámaras web espías, estafas financieras y mucho más.', 17);

/* 6 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Sony PlayStation PS4 Slim', 'La consola de juegos Sony PlayStation 4 es más pequeña, más liviana y más eficiente en energía que la PS4 original. A pesar de su diseño más pequeño, todavía proporciona el mismo rendimiento que se encuentra en los modelos anteriores de PS4, y lo hace de forma más silenciosa. También es compatible con juegos y contenido High Dynamic Range (HDR), que aprovecha la mayor profundidad de color y contraste en pantallas compatibles.', 38);

/* 7 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('WD Unidad SSD 500GB SN850', 'Con velocidades de lectura / escritura secuenciales y la innovadora arquitectura de almacenamiento Western Digital NVMe SSD, es donde se combinan la velocidad vertiginosa, el rendimiento de primer nivel y la tecnología Western Digital ™ 3D NAND.', 16);

/* 8 */INSERT INTO productos(nombre,descripcion,valor) VALUES ('Canon Cámara Reflex EOS 80D','Si quieres una cámara versátil llena de caractéristicas profesionales y funciones avanzadas, la Canon 80D es el producto ideal para mejorar tu nivel en fotografía. Con impresionante sistema de 45 puntos de enfoques cruzados y un sistema de autofoco prácticamente capaz de enfocar en cualquier condición, esta cámara fue diseñada para el fotógrafo que busca una sola cosa: precisión.', 14);


-- 3 categorias 

/* Categoria 1 */INSERT INTO categorias(nombre,descripcion) VALUES ('Telefonia', 'Celulares y accesorios');

/* Categoria 2 */INSERT INTO categorias(nombre,descripcion) VALUES ('Computación', 'Notebooks, PC de escritorios y accesorios');

/* Categoria 3 */INSERT INTO categorias(nombre,descripcion) VALUES ('Varios', 'Todo lo demás');



-- Tabla categoria y producto
/* Producto 1 pertenece a Categoria 1 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (1,1);
/* Producto 2 pertenece a Categoria 3 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (2,3);
/* Producto 3 pertenece a Categoria 2 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (3,2);
/* Producto 4 pertenece a Categoria 2 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (4,2);
/* Producto 5 pertenece a Categoria 3 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (5,3);
/* Producto 6 pertenece a Categoria 3 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (6,3);
/* Producto 7 pertenece a Categoria 2 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (7,2);
/* Producto 8 pertenece a Categoria 3 */INSERT INTO categoria_producto(producto_id, categoria_id) VALUES (8,3);

-- 10 facturas
/* 2 para el cliente 1, con 2 y 3 productos/  3 para el cliente 2, con 3, 2 y 3 productos / 1 para el cliente 3, con 1 producto / 4 para el cliente 4, con 2, 3, 4 y 1 producto */

INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-01-31',88,16,104,1);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-01-31',47,9,56,1);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-02-27',120,22,142,2);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-03-14',30,5,35,2);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-01-19',134,25,159,2);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-03-23',14,2,16,3);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-01-11',61,11,72,4);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-03-25',210,39,249,4);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-03-11',70,13,83,4);
INSERT INTO facturas(fecha,subtotal,impuesto,total,cliente_id) VALUES ('2021-04-08',77,14,91,4);


--- Ingreso tabla factura_producto

/* Factura 1 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,65,1,1);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,23,1,2);
/* Factura 2 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,14,2,8);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,16,2,7);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,17,2,5);
/* Factura 3 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,17,3,5);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,38,3,6);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,65,3,1);
/* Factura 4 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,16,4,7);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,14,4,8);
/* Factura 5 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,23,5,2);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,95,5,3);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,16,5,7);
/* Factura 6 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,14,6,8);
/* Factura 7 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,38,7,6);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,23,7,2);
/* Factura 8 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,38,8,6);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,77,8,4);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,95,8,3);
/* Factura 9 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,23,9,2);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,17,9,5);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,16,9,7);
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,14,9,8);
/* Factura 10 */
INSERT INTO factura_producto(cantidad,valor_total,factura_numero,producto_id) VALUES (1,77,10,4);

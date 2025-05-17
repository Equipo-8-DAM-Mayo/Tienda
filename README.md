# 🛍️ Tienda Care

Aplicación web desarrollada en Java utilizando Jakarta EE y Apache Tomcat, que permite la gestión de clientes y sus compras. Este proyecto forma parte del módulo de Desarrollo de Aplicaciones Web (DAW) del ciclo formativo de Grado Superior.

## 📋 Tabla de Contenidos

- [🚀 Características](#-características)
- [🛠️ Tecnologías Utilizadas](#️-tecnologías-utilizadas)
- [✅ Requisitos Previos](#-requisitos-previos)
- [⚙️ Instalación y Ejecución](#️-instalación-y-ejecución)
- [📁 Estructura del Proyecto](#-estructura-del-proyecto)
- [👥 Autores](#-autores)
- [📄 Licencia](#-licencia)

## 🚀 Características

- **Gestión de Clientes**: Alta, listado y eliminación de clientes.
- **Gestión de Compras**: Registro y asociación de compras a clientes.
- **Interfaz Web**: Interfaz sencilla para interactuar con el sistema.
- **Persistencia de Datos**: Uso de MySQL para almacenamiento de información.
- **Despliegue en Servidor**: Implementación en Apache Tomcat.

## 🛠️ Tecnologías Utilizadas

- **Lenguaje de Programación**: Java 17
- **Framework**: Jakarta EE 10
- **Servidor de Aplicaciones**: Apache Tomcat 10
- **Base de Datos**: MySQL 8
- **Gestor de Dependencias**: Apache Maven
- **Control de Versiones**: Git

## ✅ Requisitos Previos

Antes de ejecutar la aplicación, asegúrate de tener instalado:

- [Java JDK 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
- [Apache Maven](https://maven.apache.org/download.cgi)
- [Apache Tomcat 10](https://tomcat.apache.org/download-10.cgi)
- [MySQL Server 8](https://dev.mysql.com/downloads/mysql/)

## ⚙️ Instalación y Ejecución

### 1. Clonar el repositorio

git clone https://github.com/Equipo-8-DAM-Mayo/tienda_care.git
cd tienda_care

### 2. Configurar la base de datos

- Crear una base de datos llamada tienda_care.

- Ejecutar el script schema.sql ubicado en la carpeta sql/ para crear las tablas necesarias.

### 3. Configurar las credenciales de la base de datos

Editar el archivo src/main/java/com/tienda/utils/DBConnection.java con los datos correctos de tu base de datos:
- private static final String URL = "jdbc:mysql://localhost:3306/tienda_care?useSSL=false&serverTimezone=UTC";
- private static final String USER = "root";
- private static final String PASSWORD = "admin";

### 4. Compilar el proyecto

- mvn clean package

### 5. Desplegar en Tomcat

- Copiar el archivo target/tienda_care.war al directorio webapps/ de Tomcat.

- Iniciar el servidor Tomcat.

### 6. Acceder a la aplicación

Abre el navegador y accede a:

- http://localhost:8080/tienda_care/

### 👥 Autores
- **David Garcia**
- **Ibone Aguirre**
- **Jordi Morell**

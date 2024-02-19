-- Script para crear la tabla de Usuarios
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(50) UNIQUE NOT NULL,
    Contraseña VARCHAR(100) NOT NULL,
    Rol ENUM('Administrador', 'Usuario común') NOT NULL
);

-- Script para crear la tabla de Productos
CREATE TABLE Productos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CodigoRepuesto VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Existencias INT NOT NULL,
    PrecioCosto DECIMAL(10, 2) NOT NULL,
    PrecioVenta DECIMAL(10, 2) NOT NULL,
    Descripcion VARCHAR(255),
    ModeloVehiculo VARCHAR(100)
);

-- Script para crear la tabla de Facturas de Compra
CREATE TABLE FacturasCompra (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    IDProveedor INT, -- si es aplicable
    FechaCompra DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL
);

-- Script para crear la tabla de Detalle de la Factura de Compra
CREATE TABLE DetalleFacturaCompra (
    IDFactura INT,
    IDProducto INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (IDFactura, IDProducto),
    FOREIGN KEY (IDFactura) REFERENCES FacturasCompra(ID),
    FOREIGN KEY (IDProducto) REFERENCES Productos(ID)
);

-- Script para crear la tabla de Servicios
CREATE TABLE Servicios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    DescripcionServicio VARCHAR(255) NOT NULL,
    FechaServicio DATE NOT NULL,
    UsuarioAtendio INT, -- si es aplicable
    FOREIGN KEY (UsuarioAtendio) REFERENCES Usuarios(ID)
);

-- Script para crear la tabla de Clientes
CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCliente VARCHAR(100) NOT NULL,
    InformacionContacto VARCHAR(255)
);

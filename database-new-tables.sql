-- 1. Desactivar revisión de llaves foráneas temporalmente para evitar errores al eliminar
SET FOREIGN_KEY_CHECKS = 0;

-- 2. Eliminar las tablas si ya existen (en orden inverso a sus dependencias)
DROP TABLE IF EXISTS Foto_Restauracion;
DROP TABLE IF EXISTS Historial_Restauracion;
DROP TABLE IF EXISTS Restauracion_guia;
DROP TABLE IF EXISTS Restauracion;
DROP TABLE IF EXISTS Guia_Restauracion;
DROP TABLE IF EXISTS Estado_Restauracion;
DROP TABLE IF EXISTS Tipo_Restauracion;

-- 3. Activar nuevamente la revisión de llaves foráneas
SET FOREIGN_KEY_CHECKS = 1;

-- ==========================================
-- CREACIÓN DE TABLAS
-- ==========================================

-- Catálogo: TipoRestauracion (REST1, REST2, ...)
CREATE TABLE IF NOT EXISTS Tipo_Restauracion (
    id_tipo_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL UNIQUE,
    descripcion VARCHAR(200) NOT NULL
);

-- Catálogo: Estado_Restauracion
CREATE TABLE IF NOT EXISTS Estado_Restauracion (
    id_estado_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(300),
    orden INT NOT NULL,
    es_final TINYINT(1) NOT NULL DEFAULT 0
);

-- Catálogo: Guia_Restauracion
CREATE TABLE IF NOT EXISTS Guia_Restauracion (
    id_guia_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    numero_guia VARCHAR(50) NOT NULL UNIQUE,
    transportadora VARCHAR(100),
    observaciones TEXT,
    fecha_creacion DATETIME NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario)
);

-- Entidad principal: Restauracion
CREATE TABLE IF NOT EXISTS Restauracion (
    id_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    numero_spv VARCHAR(50) NOT NULL UNIQUE,
    cliente_id BIGINT NOT NULL,
    usuario_registra_id BIGINT NOT NULL,
    usuario_entrega_id BIGINT,
    tipo_restauracion_id BIGINT NOT NULL,
    estado_actual_id BIGINT NOT NULL,
    articulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    telefono_contacto VARCHAR(30),
    correo_contacto VARCHAR(120),
    fecha_creacion DATETIME NOT NULL,
    fecha_llegada_tienda DATETIME,
    fecha_entrega DATETIME,
    fecha_devolucion DATETIME,
    observaciones TEXT,
    activo TINYINT(1) DEFAULT 1,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (usuario_registra_id) REFERENCES usuario(id_usuario),
    FOREIGN KEY (usuario_entrega_id) REFERENCES usuario(id_usuario),
    FOREIGN KEY (tipo_restauracion_id) REFERENCES Tipo_Restauracion(id_tipo_restauracion),
    FOREIGN KEY (estado_actual_id) REFERENCES Estado_Restauracion(id_estado_restauracion)
);

-- Intermedia: Restauracion_Guia (N:M)
CREATE TABLE IF NOT EXISTS Restauracion_guia (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    restauracion_id BIGINT NOT NULL,
    guia_id BIGINT NOT NULL,
    fecha_asignacion DATETIME NOT NULL,
    UNIQUE KEY uk_rest_guia (restauracion_id, guia_id),
    FOREIGN KEY (restauracion_id) REFERENCES Restauracion(id_restauracion) ON DELETE CASCADE,
    FOREIGN KEY (guia_id) REFERENCES Guia_Restauracion(id_guia_restauracion)
);

-- Historial de estados (timeline)
CREATE TABLE IF NOT EXISTS Historial_Restauracion (
    id_historial_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    restauracion_id BIGINT NOT NULL,
    estado_anterior_id BIGINT,
    estado_nuevo_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    comentario TEXT,
    es_automatico TINYINT(1) NOT NULL DEFAULT 0,
    fecha DATETIME NOT NULL,
    FOREIGN KEY (restauracion_id) REFERENCES Restauracion(id_restauracion) ON DELETE CASCADE,
    FOREIGN KEY (estado_anterior_id) REFERENCES Estado_Restauracion(id_estado_restauracion),
    FOREIGN KEY (estado_nuevo_id) REFERENCES Estado_Restauracion(id_estado_restauracion),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id_usuario)
);

-- Fotos (siempre colgando del historial)
CREATE TABLE IF NOT EXISTS Foto_Restauracion (
    id_foto_restauracion BIGINT AUTO_INCREMENT PRIMARY KEY,
    historial_id BIGINT NOT NULL,
    url_foto VARCHAR(255) NOT NULL,
    tipo VARCHAR(30),
    fecha DATETIME NOT NULL,
    FOREIGN KEY (historial_id) REFERENCES Historial_Restauracion(id_historial_restauracion) ON DELETE CASCADE
);

-- ==========================================
-- DATOS INICIALES
-- ==========================================

-- Datos iniciales: estados
INSERT INTO Estado_Restauracion (nombre, descripcion, orden, es_final) VALUES
('Borrador',         'Producto registrado, aún en tienda sin despachar', 1, 0),
('Garantía',         'Producto despachado al área de restauración',      2, 0),
('Tienda',           'Producto llegó a tienda, cliente notificado',      3, 0),
('Entregado',        'Producto entregado al cliente satisfactoriamente', 4, 0),
('Devuelto Taller',  'Producto rechazado o con defecto, devuelto a taller', 5, 0),
('Finalizado',       'Proceso cerrado tras 7 días sin reclamación',      6, 1);
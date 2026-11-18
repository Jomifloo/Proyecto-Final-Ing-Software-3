-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2026 a las 03:22:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distrimax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `documento` varchar(25) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `correo`, `fecha_creacion`) VALUES
(1, 'Cliente Demo Uno', 'DEMO-001', 'cliente1@example.com', '2026-11-11 23:52:14'),
(2, 'Cliente Demo Dos', 'DEMO-002', 'cliente2@example.com', '2026-11-11 23:52:14'),
(3, 'Cliente Demo Tres', 'DEMO-003', 'cliente3@example.com', '2026-11-11 23:52:14'),
(4, 'Cliente 4', '123', 'obfofa@mail.com', '2026-11-12 00:11:08'),
(5, 'Carlos', '12345', 'carlosandres.m97@gmail.com', '2026-11-12 00:13:05'),
(6, 'Mateo', '1224', 'prueba@mail.com', '2026-11-12 00:33:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` bigint(20) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `evento` enum('REGISTRADO','DESPACHADO','FACTURADO','PAGADO') NOT NULL,
  `destinatario` varchar(150) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `cuerpo` text NOT NULL,
  `estado` enum('SIMULADO','PENDIENTE','ENVIADO','ERROR') NOT NULL DEFAULT 'SIMULADO',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_envio` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `pedido_id`, `evento`, `destinatario`, `asunto`, `cuerpo`, `estado`, `fecha_creacion`, `fecha_envio`) VALUES
(1, 1, 'REGISTRADO', 'cliente1@example.com', 'Distrimax - Pedido de venta registrado (Pedido #1)', 'Hola Cliente Demo Uno,\nPedido #1: Pedido de venta registrado\nProducto: Nevera No Frost 300 L x1\nTotal: 1899000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:11:48', NULL),
(2, 1, 'DESPACHADO', 'cliente1@example.com', 'Distrimax - Mercancía despachada (Pedido #1)', 'Hola Cliente Demo Uno,\nPedido #1: Mercancía despachada\nProducto: Nevera No Frost 300 L x1\nTotal: 1899000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:12:25', NULL),
(3, 2, 'REGISTRADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pedido de venta registrado (Pedido #2)', 'Hola Carlos,\nPedido #2: Pedido de venta registrado\nProducto: Televisor LED 55 pulgadas x2\nTotal: 4398000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:13:32', NULL),
(4, 2, 'DESPACHADO', 'carlosandres.m97@gmail.com', 'Distrimax - Mercancía despachada (Pedido #2)', 'Hola Carlos,\nPedido #2: Mercancía despachada\nProducto: Televisor LED 55 pulgadas x2\nTotal: 4398000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:13:35', NULL),
(5, 2, 'FACTURADO', 'carlosandres.m97@gmail.com', 'Distrimax - Factura emitida (Pedido #2)', 'Hola Carlos,\nPedido #2: Factura emitida\nProducto: Televisor LED 55 pulgadas x2\nTotal: 4398000.00 COP\nFactura demo: DEMO-00000002\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:13:38', NULL),
(6, 2, 'PAGADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pago registrado (Pedido #2)', 'Hola Carlos,\nPedido #2: Pago registrado\nProducto: Televisor LED 55 pulgadas x2\nTotal: 4398000.00 COP\nFactura demo: DEMO-00000002\nMedio: Transferencia', 'SIMULADO', '2026-11-12 00:13:45', NULL),
(7, 1, 'FACTURADO', 'cliente1@example.com', 'Distrimax - Factura emitida (Pedido #1)', 'Hola Cliente Demo Uno,\nPedido #1: Factura emitida\nProducto: Nevera No Frost 300 L x1\nTotal: 1899000.00 COP\nFactura demo: DEMO-00000001\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:15:10', NULL),
(8, 1, 'PAGADO', 'cliente1@example.com', 'Distrimax - Pago registrado (Pedido #1)', 'Hola Cliente Demo Uno,\nPedido #1: Pago registrado\nProducto: Nevera No Frost 300 L x1\nTotal: 1899000.00 COP\nFactura demo: DEMO-00000001\nMedio: Efectivo', 'SIMULADO', '2026-11-12 00:15:11', NULL),
(9, 3, 'REGISTRADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pedido de venta registrado (Pedido #3)', 'Hola Carlos,\nPedido #3: Pedido de venta registrado\nProducto: Lavadora 18 kg x1\nTotal: 1549000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:50:14', NULL),
(10, 4, 'REGISTRADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pedido de venta registrado (Pedido #4)', 'Hola Carlos,\nPedido #4: Pedido de venta registrado\nProducto: Horno microondas x1\nTotal: 429000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:50:14', NULL),
(11, 5, 'REGISTRADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pedido de venta registrado (Pedido #5)', 'Hola Carlos,\nPedido #5: Pedido de venta registrado\nProducto: Estufa 4 puestos a gas x1\nTotal: 899000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:50:14', NULL),
(12, 5, 'DESPACHADO', 'carlosandres.m97@gmail.com', 'Distrimax - Mercancía despachada (Pedido #5)', 'Hola Carlos,\nPedido #5: Mercancía despachada\nProducto: Estufa 4 puestos a gas x1\nTotal: 899000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:50:28', NULL),
(13, 5, 'FACTURADO', 'carlosandres.m97@gmail.com', 'Distrimax - Factura emitida (Pedido #5)', 'Hola Carlos,\nPedido #5: Factura emitida\nProducto: Estufa 4 puestos a gas x1\nTotal: 899000.00 COP\nFactura demo: DEMO-00000005\nMedio: Pendiente', 'SIMULADO', '2026-11-12 00:51:10', NULL),
(14, 5, 'PAGADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pago registrado (Pedido #5)', 'Hola Carlos,\nPedido #5: Pago registrado\nProducto: Estufa 4 puestos a gas x1\nTotal: 899000.00 COP\nFactura demo: DEMO-00000005\nMedio: Tarjeta débito', 'SIMULADO', '2026-11-12 00:51:13', NULL),
(15, 4, 'DESPACHADO', 'carlosandres.m97@gmail.com', 'Distrimax - Mercancía despachada (Pedido #4)', 'Hola Carlos,\nPedido #4: Mercancía despachada\nProducto: Horno microondas x1\nTotal: 429000.00 COP\nFactura demo: Pendiente\nMedio: Pendiente', 'SIMULADO', '2026-11-14 01:33:39', NULL),
(16, 4, 'FACTURADO', 'carlosandres.m97@gmail.com', 'Distrimax - Factura emitida (Pedido #4)', 'Hola Carlos,\nPedido #4: Factura emitida\nProducto: Horno microondas x1\nTotal: 429000.00 COP\nFactura demo: DEMO-00000004\nMedio: Pendiente', 'SIMULADO', '2026-11-14 01:33:43', NULL),
(17, 4, 'PAGADO', 'carlosandres.m97@gmail.com', 'Distrimax - Pago registrado (Pedido #4)', 'Hola Carlos,\nPedido #4: Pago registrado\nProducto: Horno microondas x1\nTotal: 429000.00 COP\nFactura demo: DEMO-00000004\nMedio: PSE', 'SIMULADO', '2026-11-14 01:33:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `precio_unitario` decimal(14,2) NOT NULL,
  `total` decimal(18,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED,
  `estado` enum('REGISTRADO','DESPACHADO','FACTURADO','PAGADO') NOT NULL DEFAULT 'REGISTRADO',
  `numero_factura` varchar(40) DEFAULT NULL,
  `medio_pago` enum('Efectivo','Tarjeta débito','Tarjeta crédito','Transferencia','PSE') DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `producto_id`, `cantidad`, `precio_unitario`, `estado`, `numero_factura`, `medio_pago`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 1, 1, 1899000.00, 'PAGADO', 'DEMO-00000001', 'Efectivo', '2026-11-12 00:11:48', '2026-11-12 00:15:11'),
(2, 5, 3, 2, 2199000.00, 'PAGADO', 'DEMO-00000002', 'Transferencia', '2026-11-12 00:13:32', '2026-11-12 00:13:45'),
(3, 5, 2, 1, 1549000.00, 'REGISTRADO', NULL, NULL, '2026-11-12 00:50:14', '2026-11-12 00:50:14'),
(4, 5, 4, 1, 429000.00, 'PAGADO', 'DEMO-00000004', 'PSE', '2026-11-12 00:50:14', '2026-11-14 01:33:46'),
(5, 5, 6, 1, 899000.00, 'PAGADO', 'DEMO-00000005', 'Tarjeta débito', '2026-11-12 00:50:14', '2026-11-12 00:51:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` decimal(14,2) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `fecha_creacion`) VALUES
(1, 'Nevera No Frost 300 L', 1899000.00, '2026-11-11 23:52:14'),
(2, 'Lavadora 18 kg', 1549000.00, '2026-11-11 23:52:14'),
(3, 'Televisor LED 55 pulgadas', 2199000.00, '2026-11-11 23:52:14'),
(4, 'Horno microondas', 429000.00, '2026-11-11 23:52:14'),
(5, 'Licuadora 3 velocidades', 189000.00, '2026-11-11 23:52:15'),
(6, 'Estufa 4 puestos a gas', 899000.00, '2026-11-11 23:52:15'),
(7, 'prueba', 20.00, '2026-11-12 00:48:09'),
(8, 'Lapicero', 2000.00, '2026-11-14 00:10:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_clientes_documento` (`documento`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_notificaciones_evento` (`pedido_id`,`evento`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_pedidos_factura` (`numero_factura`),
  ADD KEY `idx_pedidos_cliente` (`cliente_id`),
  ADD KEY `idx_pedidos_producto` (`producto_id`),
  ADD KEY `idx_pedidos_estado` (`estado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD CONSTRAINT `fk_notificaciones_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_pedidos_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

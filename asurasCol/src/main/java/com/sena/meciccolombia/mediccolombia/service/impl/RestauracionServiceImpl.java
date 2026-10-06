package com.sena.meciccolombia.mediccolombia.service.impl;

import java.io.File;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sena.meciccolombia.mediccolombia.component.GuiaRestauracionMapper;
import com.sena.meciccolombia.mediccolombia.component.HistorialRestauracionMapper;
import com.sena.meciccolombia.mediccolombia.component.RestauracionMapper;
import com.sena.meciccolombia.mediccolombia.dao.ClienteDAO;
import com.sena.meciccolombia.mediccolombia.dao.EstadoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.FotoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.GuiaRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.HistorialRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.RestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.RestauracionGuiaDAO;
import com.sena.meciccolombia.mediccolombia.dao.TipoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.UsuarioDAO;
import com.sena.meciccolombia.mediccolombia.dao.CorreoDAO;
import com.sena.meciccolombia.mediccolombia.dao.TelefonoDAO;
import com.sena.meciccolombia.mediccolombia.dao.TipoCorreoDAO;
import com.sena.meciccolombia.mediccolombia.dao.TipoTelefonoDAO;
import com.sena.meciccolombia.mediccolombia.domain.Correo;
import com.sena.meciccolombia.mediccolombia.domain.Telefono;
import com.sena.meciccolombia.mediccolombia.domain.TipoCorreo;
import com.sena.meciccolombia.mediccolombia.domain.TipoTelefono;
import com.sena.meciccolombia.mediccolombia.domain.Cliente;
import com.sena.meciccolombia.mediccolombia.domain.EstadoRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.FotoRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.GuiaRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.HistorialRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.Restauracion;
import com.sena.meciccolombia.mediccolombia.domain.RestauracionGuia;
import com.sena.meciccolombia.mediccolombia.domain.TipoRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.Usuario;
import com.sena.meciccolombia.mediccolombia.service.IRestauracionService;
import com.sena.meciccolombia.mediccolombia.service.ConfiguracionSistemaService;
import com.sena.meciccolombia.mediccolombia.web.dto.request.CambiarEstadoRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.request.RestauracionRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.EventoRestauracionDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.GuiaRestauracionResponseDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.HistorialResponseDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionDetalleDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionResumenDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.UltimaRestauracionDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RestauracionServiceImpl implements IRestauracionService {

        private final RestauracionDAO restauracionDAO;
        private final ClienteDAO clienteDAO;
        private final UsuarioDAO usuarioDAO;
        private final TipoRestauracionDAO tipoRestauracionDAO;
        private final EstadoRestauracionDAO estadoRestauracionDAO;
        private final GuiaRestauracionDAO guiaRestauracionDAO;
        private final RestauracionGuiaDAO restauracionGuiaDAO;
        private final HistorialRestauracionDAO historialRestauracionDAO;
        private final FotoRestauracionDAO fotoRestauracionDAO;
        private final CorreoDAO correoDAO;
        private final TelefonoDAO telefonoDAO;
        private final TipoCorreoDAO tipoCorreoDAO;
        private final TipoTelefonoDAO tipoTelefonoDAO;
        private final RestauracionMapper restauracionMapper;
        private final HistorialRestauracionMapper historialMapper;
        private final GuiaRestauracionMapper guiaMapper;

        private final ConfiguracionSistemaService configuracionService;

        private static final String TRANSPORTADORA_FIJA = "COORDINADORA";
        private static final Long ID_TIPO_CORREO_PERSONAL = 2L;
        private static final Long ID_TIPO_TELEFONO_MOVIL_PERSONAL = 1L;

        @Value("${app.upload.dir}")
        private String uploadDir;

        private static final String CARPETA_RESTAURACION = "restauracion/";

        // ─────────────────────────────────────────────
        // CREAR
        // ─────────────────────────────────────────────
        @Override
        @Transactional
        public RestauracionResumenDTO crear(RestauracionRequestDTO dto, Long idUsuario, List<MultipartFile> fotos) {
                if (dto.getNumeroSpv() == null || dto.getNumeroSpv().isBlank())
                        throw new IllegalArgumentException("El código de restauración es obligatorio");

                String codTienda = configuracionService.obtenerValor("TIENDA_CODIGO");
                if (codTienda == null || codTienda.isBlank()) {
                        throw new IllegalStateException(
                                        "Configure primero el código de tienda en Parámetros del Sistema (TIENDA_CODIGO)");
                }
                if (!codTienda.matches("\\d{1,4}")) {
                        throw new IllegalStateException("El código de tienda debe tener entre 1 y 4 dígitos");
                }

                String sufijo = dto.getNumeroSpv().trim();
                if (!sufijo.matches("\\d+")) {
                        throw new IllegalArgumentException("El código de restauración debe contener solo números");
                }

                String spvCompleto = codTienda + "00000" + sufijo;

                if (restauracionDAO.findByNumeroSpv(spvCompleto).isPresent())
                        throw new IllegalStateException("Ya existe una restauración con ese número SPV");

                dto.setNumeroSpv(spvCompleto);

                Usuario usuario = usuarioDAO.findById(idUsuario)
                                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

                TipoRestauracion tipo = tipoRestauracionDAO.findById(dto.getIdTipoRestauracion())
                                .orElseThrow(() -> new RuntimeException("Tipo de restauración no encontrado"));

                // Buscar cliente por identificación (si existe)
                Cliente cliente = clienteDAO.findByIdentificacion(dto.getIdentificacionCliente()).orElse(null);

                // Si no existe, se crea (y se persisten correo y teléfono si vienen)
                if (cliente == null) {
                        if (dto.getNombreCliente() == null || dto.getNombreCliente().isBlank())
                                throw new IllegalArgumentException("Debe indicar el nombre del cliente para crearlo");

                        cliente = Cliente.builder()
                                        .nombreCliente(dto.getNombreCliente())
                                        .identificacion(dto.getIdentificacionCliente())
                                        .activo(true)
                                        .build();
                        cliente = clienteDAO.save(cliente);

                        // Persistir correo (tipo: Personal, id=2)
                        if (dto.getCorreoContacto() != null && !dto.getCorreoContacto().isBlank()) {
                                TipoCorreo tipoCorreo = tipoCorreoDAO.findById(ID_TIPO_CORREO_PERSONAL)
                                                .orElseThrow(() -> new RuntimeException(
                                                                "Tipo de correo 'Personal' no configurado"));
                                correoDAO.save(Correo.builder()
                                                .correoElectronico(dto.getCorreoContacto())
                                                .tipoCorreo(tipoCorreo)
                                                .cliente(cliente)
                                                .build());
                        }

                        // Persistir teléfono (tipo: Móvil personal, id=1)
                        if (dto.getTelefonoContacto() != null && !dto.getTelefonoContacto().isBlank()) {
                                TipoTelefono tipoTelefono = tipoTelefonoDAO.findById(ID_TIPO_TELEFONO_MOVIL_PERSONAL)
                                                .orElseThrow(() -> new RuntimeException(
                                                                "Tipo de teléfono 'Móvil personal' no configurado"));
                                telefonoDAO.save(Telefono.builder()
                                                .numero(dto.getTelefonoContacto())
                                                .tipoTelefono(tipoTelefono)
                                                .cliente(cliente)
                                                .build());
                        }
                }

                EstadoRestauracion estadoBorrador = estadoRestauracionDAO.findByNombre("Borrador")
                                .orElseThrow(() -> new RuntimeException("Estado Borrador no configurado"));

                Restauracion restauracion = Restauracion.builder()
                                .numeroSpv(dto.getNumeroSpv())
                                .cliente(cliente)
                                .usuarioRegistra(usuario)
                                .tipoRestauracion(tipo)
                                .estadoActual(estadoBorrador)
                                .articulo(dto.getArticulo())
                                .descripcion(dto.getDescripcion())
                                .telefonoContacto(dto.getTelefonoContacto())
                                .correoContacto(dto.getCorreoContacto())
                                .observaciones(dto.getObservaciones())
                                .activo(true)
                                .build();
                restauracion = restauracionDAO.save(restauracion);

                // Crear evento inicial en el historial
                HistorialRestauracion historialInicial = HistorialRestauracion.builder()
                                .restauracion(restauracion)
                                .estadoAnterior(null)
                                .estadoNuevo(estadoBorrador)
                                .usuario(usuario)
                                .comentario("Restauración creada. Producto en tienda con SPV: " + dto.getNumeroSpv())
                                .esAutomatico(false)
                                .build();
                historialInicial = historialRestauracionDAO.save(historialInicial);

                // Guardar fotos (máx 4)
                guardarFotos(historialInicial, fotos, "ARTICULO");

                // Si se pasa guía al crear, se asigna
                if (dto.getNumeroGuia() != null && !dto.getNumeroGuia().isBlank()) {
                        asignarGuia(List.of(restauracion.getId()),
                                        dto.getNumeroGuia(), dto.getTransportadora(), idUsuario);
                }

                return restauracionMapper.toResumenDTO(restauracion);
        }

        // ─────────────────────────────────────────────
        // DETALLE
        // ─────────────────────────────────────────────
        @Override
        @Transactional(readOnly = true)
        public RestauracionDetalleDTO obtenerDetalle(Long id) {
                Restauracion r = restauracionDAO.findById(id)
                                .orElseThrow(() -> new RuntimeException("Restauración no encontrada"));

                List<HistorialResponseDTO> historial = historialRestauracionDAO
                                .findByRestauracionIdOrderByFechaAsc(id)
                                .stream().map(historialMapper::toResponseDTO).toList();

                List<GuiaRestauracionResponseDTO> guias = restauracionGuiaDAO.findByRestauracionId(id)
                                .stream()
                                .map(rg -> guiaMapper.toResponseDTO(rg.getGuia()))
                                .toList();

                RestauracionDetalleDTO dto = restauracionMapper.toDetalleDTO(r, historial, guias);

                // Poblar correos y teléfonos del cliente
                List<String> correos = correoDAO.findByClienteId(r.getCliente().getId())
                                .stream().map(Correo::getCorreoElectronico).toList();
                List<String> telefonos = telefonoDAO.findByClienteId(r.getCliente().getId())
                                .stream().map(Telefono::getNumero).toList();

                if (dto.getCliente() != null) {
                        dto.getCliente().setCorreos(correos);
                        dto.getCliente().setTelefonos(telefonos);
                }

                return dto;
        }

        // ─────────────────────────────────────────────
        // LISTAR
        // ─────────────────────────────────────────────
        @Override
        @Transactional(readOnly = true)
        public List<RestauracionResumenDTO> listar() {
                List<Restauracion> restauraciones = restauracionDAO.findAll();
                Map<Long, String> ultimaGuia = obtenerUltimaGuiaPorRestauracion();
                return restauraciones.stream()
                                .map(r -> {
                                        RestauracionResumenDTO dto = restauracionMapper.toResumenDTO(r);
                                        dto.setUltimaGuia(ultimaGuia.get(r.getId()));
                                        return dto;
                                }).toList();
        }

        @Override
        @Transactional(readOnly = true)
        public List<RestauracionResumenDTO> listarPorCliente(Long idCliente) {
                List<Restauracion> restauraciones = restauracionDAO.findByClienteId(idCliente);
                Map<Long, String> ultimaGuia = obtenerUltimaGuiaPorRestauracion();
                return restauraciones.stream()
                                .map(r -> {
                                        RestauracionResumenDTO dto = restauracionMapper.toResumenDTO(r);
                                        dto.setUltimaGuia(ultimaGuia.get(r.getId()));
                                        return dto;
                                }).toList();
        }

        // ─────────────────────────────────────────────
        // CAMBIAR ESTADO
        // ─────────────────────────────────────────────
        @Override
        @Transactional
        public RestauracionDetalleDTO cambiarEstado(Long idRestauracion, CambiarEstadoRequestDTO dto,
                        Long idUsuario, List<MultipartFile> fotos) {

                Restauracion r = restauracionDAO.findById(idRestauracion)
                                .orElseThrow(() -> new RuntimeException("Restauración no encontrada"));

                Usuario usuario = usuarioDAO.findById(idUsuario)
                                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

                EstadoRestauracion estadoNuevo = estadoRestauracionDAO.findById(dto.getIdEstadoNuevo())
                                .orElseThrow(() -> new RuntimeException("Estado no encontrado"));

                EstadoRestauracion estadoAnterior = r.getEstadoActual();

                if (estadoAnterior.getId().equals(estadoNuevo.getId())) {
                        throw new IllegalStateException("La restauración ya se encuentra en ese estado");
                }

                // Validación: no se puede pasar de Borrador a Garantía sin guía asignada
                if ("Garantía".equals(estadoNuevo.getNombre())) {
                        boolean tieneGuia = !restauracionGuiaDAO.findByRestauracionId(idRestauracion).isEmpty();
                        if (!tieneGuia && (dto.getNumeroGuia() == null || dto.getNumeroGuia().isBlank())) {
                                throw new IllegalStateException(
                                                "Debe asignar un número de guía antes de cambiar a estado Garantía");
                        }
                        if (!tieneGuia) {
                                asignarGuia(List.of(idRestauracion), dto.getNumeroGuia(),
                                                dto.getTransportadora(), idUsuario);
                        }
                }

                // Actualizar campos caché según el estado
                switch (estadoNuevo.getNombre()) {
                        case "Tienda" -> r.setFechaLlegadaTienda(LocalDateTime.now());
                        case "Entregado" -> {
                                r.setFechaEntrega(LocalDateTime.now());
                                r.setUsuarioEntrega(usuario);
                        }
                        case "Devuelto Taller" -> r.setFechaDevolucion(LocalDateTime.now());
                }

                r.setEstadoActual(estadoNuevo);
                restauracionDAO.save(r);

                // Registrar evento
                HistorialRestauracion historial = HistorialRestauracion.builder()
                                .restauracion(r)
                                .estadoAnterior(estadoAnterior)
                                .estadoNuevo(estadoNuevo)
                                .usuario(usuario)
                                .comentario(dto.getComentario())
                                .esAutomatico(false)
                                .build();
                historial = historialRestauracionDAO.save(historial);
                guardarFotos(historial, fotos, "PROCESO");

                return obtenerDetalle(idRestauracion);
        }

        // ─────────────────────────────────────────────
        // AGREGAR COMENTARIO / FOTO A UN EVENTO EXISTENTE
        // ─────────────────────────────────────────────
        @Override
        @Transactional
        public RestauracionDetalleDTO agregarComentario(Long idRestauracion, String comentario,
                        Long idUsuario, List<MultipartFile> fotos) {

                Restauracion r = restauracionDAO.findById(idRestauracion)
                                .orElseThrow(() -> new RuntimeException("Restauración no encontrada"));

                Usuario usuario = usuarioDAO.findById(idUsuario)
                                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

                HistorialRestauracion historial = HistorialRestauracion.builder()
                                .restauracion(r)
                                .estadoAnterior(r.getEstadoActual())
                                .estadoNuevo(r.getEstadoActual())
                                .usuario(usuario)
                                .comentario(comentario)
                                .esAutomatico(false)
                                .build();
                historial = historialRestauracionDAO.save(historial);
                guardarFotos(historial, fotos, "COMENTARIO");

                return obtenerDetalle(idRestauracion);
        }

        // ─────────────────────────────────────────────
        // ASIGNAR GUÍA
        // ─────────────────────────────────────────────
        @Override
        @Transactional
        public void asignarGuia(List<Long> idsRestauraciones, String numeroGuia,
                        String transportadora, Long idUsuario) {

                if (numeroGuia == null || numeroGuia.isBlank())
                        throw new IllegalArgumentException("El número de guía es obligatorio");

                Usuario usuario = usuarioDAO.findById(idUsuario)
                                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

                GuiaRestauracion guia = guiaRestauracionDAO.findByNumeroGuia(numeroGuia)
                                .orElseGet(() -> guiaRestauracionDAO.save(
                                                GuiaRestauracion.builder()
                                                                .numeroGuia(numeroGuia)
                                                                .transportadora(TRANSPORTADORA_FIJA)
                                                                .usuario(usuario)
                                                                .build()));

                for (Long idRest : idsRestauraciones) {
                        Restauracion r = restauracionDAO.findById(idRest).orElseThrow();
                        boolean yaAsociada = restauracionGuiaDAO.findByRestauracionId(idRest).stream()
                                        .anyMatch(rg -> rg.getGuia().getId().equals(guia.getId()));
                        if (yaAsociada)
                                continue;

                        restauracionGuiaDAO.save(RestauracionGuia.builder()
                                        .restauracion(r)
                                        .guia(guia)
                                        .fechaAsignacion(LocalDateTime.now())
                                        .build());
                }
        }

        // ─────────────────────────────────────────────
        // SCHEDULER — Finaliza a los 7 días de "Entregado"
        // ─────────────────────────────────────────────
        @Override
        @Transactional
        public void finalizarAutomaticamente() {
                EstadoRestauracion estadoEntregado = estadoRestauracionDAO.findByNombre("Entregado").orElse(null);
                EstadoRestauracion estadoFinalizado = estadoRestauracionDAO.findByNombre("Finalizado").orElse(null);
                if (estadoEntregado == null || estadoFinalizado == null)
                        return;

                LocalDateTime limite = LocalDateTime.now().minusDays(7);

                List<Restauracion> candidatas = restauracionDAO.findByEstadoActualId(estadoEntregado.getId());
                for (Restauracion r : candidatas) {
                        if (r.getFechaEntrega() == null)
                                continue;
                        if (r.getFechaEntrega().isBefore(limite)) {
                                HistorialRestauracion h = HistorialRestauracion.builder()
                                                .restauracion(r)
                                                .estadoAnterior(estadoEntregado)
                                                .estadoNuevo(estadoFinalizado)
                                                .usuario(r.getUsuarioEntrega() != null ? r.getUsuarioEntrega()
                                                                : r.getUsuarioRegistra())
                                                .comentario("Producto restaurado satisfactoriamente (cierre automático a los 7 días).")
                                                .esAutomatico(true)
                                                .build();
                                historialRestauracionDAO.save(h);
                                r.setEstadoActual(estadoFinalizado);
                                restauracionDAO.save(r);
                        }
                }
        }

        // ─────────────────────────────────────────────
        // CONSTRUIR RESUMEN DE ULTIMA RESTAURACION
        // ─────────────────────────────────────────────

        @Override
        @Transactional(readOnly = true)
        public UltimaRestauracionDTO obtenerUltimaPorCliente(Long idCliente) {
                List<Restauracion> rs = restauracionDAO.findByClienteId(idCliente);
                if (rs.isEmpty())
                        return null;

                Restauracion ultima = rs.stream()
                                .filter(r -> r.getFechaCreacion() != null)
                                .max(Comparator.comparing(Restauracion::getFechaCreacion))
                                .orElse(null);
                if (ultima == null)
                        return null;

                String guia = restauracionGuiaDAO.findByRestauracionId(ultima.getId()).stream()
                                .max(Comparator.comparing(RestauracionGuia::getFechaAsignacion))
                                .map(rg -> rg.getGuia().getNumeroGuia())
                                .orElse(null);

                String obs = historialRestauracionDAO.findByRestauracionIdOrderByFechaDesc(ultima.getId())
                                .stream()
                                .map(HistorialRestauracion::getComentario)
                                .filter(c -> c != null && !c.isBlank())
                                .findFirst()
                                .orElse(ultima.getObservaciones());

                return UltimaRestauracionDTO.builder()
                                .id(ultima.getId())
                                .numeroSpv(ultima.getNumeroSpv())
                                .tipoRestauracion(ultima.getTipoRestauracion().getTipo())
                                .descripcionTipo(ultima.getTipoRestauracion().getDescripcion())
                                .estadoActual(ultima.getEstadoActual().getNombre())
                                .ultimaObservacion(obs)
                                .fechaCreacion(ultima.getFechaCreacion())
                                .ultimaGuia(guia)
                                .build();
        }

        // ─────────────────────────────────────────────
        // METODOS PARA HISTORIA DE USUARIO
        // ─────────────────────────────────────────────

        @Override
        @Transactional(readOnly = true)
        public long contarRegistradasPorUsuario(Long idUsuario) {
                return restauracionDAO.findByUsuarioRegistraId(idUsuario).size();
        }

        @Override
        @Transactional(readOnly = true)
        public long contarEntregadasPorUsuario(Long idUsuario) {
                return restauracionDAO.findByUsuarioEntregaId(idUsuario).size();
        }

        @Override
        @Transactional(readOnly = true)
        public long contarActivasPorUsuario(Long idUsuario) {
                return restauracionDAO.findByUsuarioRegistraId(idUsuario).stream()
                                .filter(r -> !"Finalizado".equals(r.getEstadoActual().getNombre()))
                                .count();
        }

        @Override
        @Transactional(readOnly = true)
        public List<EventoRestauracionDTO> ultimosEventosPorUsuario(Long idUsuario, int limite) {
                return historialRestauracionDAO.findByUsuarioIdOrderByFechaDesc(idUsuario).stream()
                                .limit(limite)
                                .map(h -> EventoRestauracionDTO.builder()
                                                .idRestauracion(h.getRestauracion().getId())
                                                .numeroSpv(h.getRestauracion().getNumeroSpv())
                                                .tipoRestauracion(h.getRestauracion().getTipoRestauracion().getTipo())
                                                .estadoAnterior(h.getEstadoAnterior() != null
                                                                ? h.getEstadoAnterior().getNombre()
                                                                : null)
                                                .estadoNuevo(h.getEstadoNuevo() != null ? h.getEstadoNuevo().getNombre()
                                                                : null)
                                                .fecha(h.getFecha())
                                                .comentario(h.getComentario())
                                                .esAutomatico(h.getEsAutomatico())
                                                .build())
                                .toList();
        }

        // ─────────────────────────────────────────────
        // HELPER — GUARDAR FOTOS
        // ─────────────────────────────────────────────
        private void guardarFotos(HistorialRestauracion historial, List<MultipartFile> fotos, String tipo) {
                if (fotos == null || fotos.isEmpty())
                        return;

                int max = Math.min(fotos.size(), 4);
                for (int i = 0; i < max; i++) {
                        MultipartFile archivo = fotos.get(i);
                        if (archivo.isEmpty())
                                continue;
                        try {
                                String extension = archivo.getOriginalFilename()
                                                .substring(archivo.getOriginalFilename().lastIndexOf("."));
                                String nombre = "rest_" + historial.getRestauracion().getId()
                                                + "_" + System.currentTimeMillis() + "_" + i + extension;

                                String carpeta = uploadDir + CARPETA_RESTAURACION;
                                File dir = new File(carpeta);
                                if (!dir.exists())
                                        dir.mkdirs();

                                archivo.transferTo(new File(carpeta + nombre));

                                fotoRestauracionDAO.save(FotoRestauracion.builder()
                                                .historial(historial)
                                                .urlFoto("/uploads/restauracion/" + nombre)
                                                .tipo(tipo)
                                                .build());

                        } catch (Exception e) {
                                throw new RuntimeException("Error al guardar foto: " + e.getMessage());
                        }
                }
        }

        private Map<Long, String> obtenerUltimaGuiaPorRestauracion() {
                return restauracionGuiaDAO.findAll().stream()
                                .collect(Collectors.groupingBy(
                                                rg -> rg.getRestauracion().getId(),
                                                Collectors.collectingAndThen(
                                                                Collectors.maxBy(Comparator.comparing(
                                                                                RestauracionGuia::getFechaAsignacion)),
                                                                opt -> opt.map(rg -> rg.getGuia().getNumeroGuia())
                                                                                .orElse(null))));
        }
}
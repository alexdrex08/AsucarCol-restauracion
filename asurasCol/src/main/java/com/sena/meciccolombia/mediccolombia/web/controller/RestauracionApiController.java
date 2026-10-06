package com.sena.meciccolombia.mediccolombia.web.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sena.meciccolombia.mediccolombia.dao.ClienteDAO;
import com.sena.meciccolombia.mediccolombia.domain.Cliente;
import com.sena.meciccolombia.mediccolombia.security.MyUserDetails;
import com.sena.meciccolombia.mediccolombia.service.IRestauracionService;
import com.sena.meciccolombia.mediccolombia.service.ITipoRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.request.CambiarEstadoRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.request.RestauracionRequestDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionDetalleDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionResumenDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/restauraciones")
@RequiredArgsConstructor
public class RestauracionApiController {

    private final IRestauracionService restauracionService;
    private final ITipoRestauracionService tipoRestauracionService;
    private final ClienteDAO clienteDAO;

    // ─────────────────────────────────────────────
    // Buscar cliente por CC
    // ─────────────────────────────────────────────
    @GetMapping("/cliente/buscar")
    public ResponseEntity<?> buscarCliente(@RequestParam String identificacion) {
        return clienteDAO.findByIdentificacion(identificacion)
                .map(c -> ResponseEntity.ok(Map.of(
                        "encontrado", true,
                        "cliente", Map.of(
                                "id", c.getId(),
                                "nombre", c.getNombreCliente(),
                                "identificacion", c.getIdentificacion(),
                                "correos", c.getCorreos() != null
                                        ? c.getCorreos().stream().map(co -> co.getCorreoElectronico()).toList()
                                        : List.of(),
                                "telefonos", c.getTelefonos() != null
                                        ? c.getTelefonos().stream().map(t -> t.getNumero()).toList()
                                        : List.of()
                        )
                )))
                .orElse(ResponseEntity.ok(Map.of("encontrado", false)));
    }

    // ─────────────────────────────────────────────
    // Buscar tipo REST
    // ─────────────────────────────────────────────
    @GetMapping("/tipo/buscar")
    public ResponseEntity<?> buscarTipo(@RequestParam String texto) {
        return ResponseEntity.ok(tipoRestauracionService.buscarPorDescripcion(texto));
    }

    // ─────────────────────────────────────────────
    // Crear restauración
    // ─────────────────────────────────────────────
    @PostMapping(value = "/crear", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> crear(
            @RequestParam String numeroSpv,
            @RequestParam String identificacionCliente,
            @RequestParam(required = false) String nombreCliente,
            @RequestParam(required = false) String telefonoContacto,
            @RequestParam(required = false) String correoContacto,
            @RequestParam Long idTipoRestauracion,
            @RequestParam String articulo,
            @RequestParam(required = false) String descripcion,
            @RequestParam(required = false) String observaciones,
            @RequestParam(required = false) String numeroGuia,
            @RequestParam(required = false) String transportadora,
            @RequestParam(required = false) List<MultipartFile> fotos,
            Authentication auth) {

        try {
            MyUserDetails user = (MyUserDetails) auth.getPrincipal();

            RestauracionRequestDTO dto = RestauracionRequestDTO.builder()
                    .numeroSpv(numeroSpv)
                    .identificacionCliente(identificacionCliente)
                    .nombreCliente(nombreCliente)
                    .telefonoContacto(telefonoContacto)
                    .correoContacto(correoContacto)
                    .idTipoRestauracion(idTipoRestauracion)
                    .articulo(articulo)
                    .descripcion(descripcion)
                    .observaciones(observaciones)
                    .numeroGuia(numeroGuia)
                    .transportadora(transportadora)
                    .build();

            RestauracionResumenDTO creada = restauracionService.crear(dto, user.getId(), fotos);
            return ResponseEntity.status(HttpStatus.CREATED).body(creada);

        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", e.getMessage()));
        }
    }

    // ─────────────────────────────────────────────
    // Cambiar estado
    // ─────────────────────────────────────────────
    @PostMapping(value = "/{id}/estado", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> cambiarEstado(
            @PathVariable Long id,
            @RequestParam Long idEstadoNuevo,
            @RequestParam(required = false) String comentario,
            @RequestParam(required = false) String numeroGuia,
            @RequestParam(required = false) String transportadora,
            @RequestParam(required = false) List<MultipartFile> fotos,
            Authentication auth) {

        try {
            MyUserDetails user = (MyUserDetails) auth.getPrincipal();
            CambiarEstadoRequestDTO dto = CambiarEstadoRequestDTO.builder()
                    .idEstadoNuevo(idEstadoNuevo)
                    .comentario(comentario)
                    .numeroGuia(numeroGuia)
                    .transportadora(transportadora)
                    .build();

            RestauracionDetalleDTO actualizada = restauracionService.cambiarEstado(id, dto, user.getId(), fotos);
            return ResponseEntity.ok(actualizada);

        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", e.getMessage()));
        }
    }

    // ─────────────────────────────────────────────
    // Agregar comentario (sin cambio de estado)
    // ─────────────────────────────────────────────
    @PostMapping(value = "/{id}/comentario", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<?> agregarComentario(
            @PathVariable Long id,
            @RequestParam String comentario,
            @RequestParam(required = false) List<MultipartFile> fotos,
            Authentication auth) {

        try {
            MyUserDetails user = (MyUserDetails) auth.getPrincipal();
            RestauracionDetalleDTO actualizada = restauracionService.agregarComentario(id, comentario, user.getId(), fotos);
            return ResponseEntity.ok(actualizada);

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", e.getMessage()));
        }
    }

    // ─────────────────────────────────────────────
    // Asignar guía a varias restauraciones
    // ─────────────────────────────────────────────
    @PostMapping("/asignar-guia")
    public ResponseEntity<?> asignarGuia(
            @RequestBody Map<String, Object> payload,
            Authentication auth) {

        try {
            MyUserDetails user = (MyUserDetails) auth.getPrincipal();

            @SuppressWarnings("unchecked")
            List<Integer> idsRaw = (List<Integer>) payload.get("ids");
            List<Long> ids = idsRaw.stream().map(Integer::longValue).collect(Collectors.toList());

            String numeroGuia = (String) payload.get("numeroGuia");
            String transportadora = (String) payload.get("transportadora");

            restauracionService.asignarGuia(ids, numeroGuia, transportadora, user.getId());
            return ResponseEntity.ok(Map.of("mensaje", "Guía asignada correctamente"));

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(Map.of("error", e.getMessage()));
        }
    }
}
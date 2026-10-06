package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import java.util.List;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class RestauracionDetalleDTO {
    private Long id;
    private String numeroSpv;
    private ClienteInfo cliente;
    private String telefonoContacto;
    private String correoContacto;
    private String tipoRestauracionTipo;
    private String tipoRestauracionDescripcion;
    private String articulo;
    private String descripcion;
    private String estadoActual;
    private Integer estadoOrden;
    private Boolean estadoEsFinal;
    private String usuarioRegistra;
    private String usuarioEntrega;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaLlegadaTienda;
    private LocalDateTime fechaEntrega;
    private LocalDateTime fechaDevolucion;
    private String observaciones;
    private List<HistorialResponseDTO> historial;
    private List<GuiaRestauracionResponseDTO> guias;

    @Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
    public static class ClienteInfo {
        private Long id;
        private String nombre;
        private String identificacion;
        private List<String> correos;
        private List<String> telefonos;
    }
}
package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class RestauracionResumenDTO {
    private Long id;
    private String numeroSpv;
    private String nombreCliente;
    private String identificacionCliente;
    private String tipoRestauracion;
    private String descripcionTipo;
    private String articulo;
    private String estadoActual;
    private Integer estadoOrden;
    private String ultimaGuia;
    private LocalDateTime fechaCreacion;
    private LocalDateTime fechaEntrega;
    private Boolean activo;
}
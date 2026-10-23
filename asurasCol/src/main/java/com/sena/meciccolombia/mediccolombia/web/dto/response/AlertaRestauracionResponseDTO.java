package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AlertaRestauracionResponseDTO {
    private Long id;
    private Long idRestauracion;
    private String numeroSpv;
    private String nombreCliente;
    private String identificacionCliente;
    private String estadoActual;
    private LocalDateTime fechaLlegadaTienda;
    private Integer mesAlerta;
    private LocalDateTime fechaGeneracion;
    private String observacion;
    private Boolean resuelta;
    private LocalDateTime fechaResolucion;
    private String usuarioResolucion;
}
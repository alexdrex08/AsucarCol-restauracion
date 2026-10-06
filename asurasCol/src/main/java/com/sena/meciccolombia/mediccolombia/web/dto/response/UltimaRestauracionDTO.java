package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class UltimaRestauracionDTO {
    private Long id;
    private String numeroSpv;
    private String tipoRestauracion;
    private String descripcionTipo;
    private String estadoActual;
    private String ultimaObservacion;
    private LocalDateTime fechaCreacion;
    private String ultimaGuia;
}
package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class EventoRestauracionDTO {
    private Long idRestauracion;
    private String numeroSpv;
    private String tipoRestauracion;
    private String estadoAnterior;
    private String estadoNuevo;
    private LocalDateTime fecha;
    private String comentario;
    private Boolean esAutomatico;
}
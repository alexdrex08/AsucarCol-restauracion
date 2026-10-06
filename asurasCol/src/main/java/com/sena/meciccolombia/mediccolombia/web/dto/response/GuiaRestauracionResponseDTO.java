package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class GuiaRestauracionResponseDTO {
    private Long id;
    private String numeroGuia;
    private String transportadora;
    private String observaciones;
    private LocalDateTime fechaCreacion;
    private String usuarioNombre;
    private Integer cantidadRestauraciones;
}
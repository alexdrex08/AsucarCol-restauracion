package com.sena.meciccolombia.mediccolombia.web.dto.response;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class TipoRestauracionResponseDTO {
    private Long id;
    private String tipo;
    private String descripcion;
}
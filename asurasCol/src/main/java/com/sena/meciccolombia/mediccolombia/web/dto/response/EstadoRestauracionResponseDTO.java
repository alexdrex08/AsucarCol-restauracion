package com.sena.meciccolombia.mediccolombia.web.dto.response;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class EstadoRestauracionResponseDTO {
    private Long id;
    private String nombre;
    private String descripcion;
    private Integer orden;
    private Boolean esFinal;
}
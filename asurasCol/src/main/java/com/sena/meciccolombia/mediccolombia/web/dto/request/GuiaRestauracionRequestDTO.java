package com.sena.meciccolombia.mediccolombia.web.dto.request;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class GuiaRestauracionRequestDTO {
    private String numeroGuia;
    private String transportadora;
    private String observaciones;
}
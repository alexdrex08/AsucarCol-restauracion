package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class FotoResponseDTO {
    private Long id;
    private String urlFoto;
    private String tipo;
    private LocalDateTime fecha;
}
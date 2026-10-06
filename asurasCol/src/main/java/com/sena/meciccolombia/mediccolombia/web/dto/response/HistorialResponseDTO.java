package com.sena.meciccolombia.mediccolombia.web.dto.response;

import java.time.LocalDateTime;
import java.util.List;
import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class HistorialResponseDTO {
    private Long id;
    private String estadoAnterior;
    private String estadoNuevo;
    private String usuarioNombre;
    private String comentario;
    private Boolean esAutomatico;
    private LocalDateTime fecha;
    private List<FotoResponseDTO> fotos;
}
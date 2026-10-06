package com.sena.meciccolombia.mediccolombia.web.dto.request;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class CambiarEstadoRequestDTO {
    private Long idEstadoNuevo;
    private String comentario;
    // Si el cambio es a "Garantía" y no tiene guía aún, se puede pasar aquí
    private String numeroGuia;
    private String transportadora;
}
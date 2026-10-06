package com.sena.meciccolombia.mediccolombia.web.dto.request;

import lombok.*;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class RestauracionRequestDTO {
    private String numeroSpv;
    private String identificacionCliente; 
    private String nombreCliente;         
    private String telefonoContacto;
    private String correoContacto;
    private Long idTipoRestauracion;
    private String articulo;
    private String descripcion;
    private String observaciones;
    private String numeroGuia;
    private String transportadora;
}
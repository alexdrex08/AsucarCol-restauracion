package com.sena.meciccolombia.mediccolombia.component;

import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.domain.GuiaRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.Usuario;
import com.sena.meciccolombia.mediccolombia.web.dto.response.GuiaRestauracionResponseDTO;

@Component 
public class GuiaRestauracionMapper {
    public GuiaRestauracion toEntity(String numeroGuia, String transportadora, String observaciones, Usuario usuario) {
        return GuiaRestauracion.builder()
                .numeroGuia(numeroGuia)
                .transportadora(transportadora)
                .observaciones(observaciones)
                .usuario(usuario)
                .build();
    }

    public GuiaRestauracionResponseDTO toResponseDTO(GuiaRestauracion g) {
        if (g == null) return null;
        return GuiaRestauracionResponseDTO.builder()
                .id(g.getId())
                .numeroGuia(g.getNumeroGuia())
                .transportadora(g.getTransportadora())
                .observaciones(g.getObservaciones())
                .fechaCreacion(g.getFechaCreacion())
                .usuarioNombre(g.getUsuario() != null ? g.getUsuario().getNombre() : null)
                .build();
    }
}
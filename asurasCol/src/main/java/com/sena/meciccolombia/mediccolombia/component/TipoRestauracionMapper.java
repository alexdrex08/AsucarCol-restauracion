package com.sena.meciccolombia.mediccolombia.component;

import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.domain.TipoRestauracion;
import com.sena.meciccolombia.mediccolombia.web.dto.response.TipoRestauracionResponseDTO;

@Component 
public class TipoRestauracionMapper {
    public TipoRestauracionResponseDTO toResponseDTO(TipoRestauracion t) {
        if (t == null) return null;
        return TipoRestauracionResponseDTO.builder()
                .id(t.getId())
                .tipo(t.getTipo())
                .descripcion(t.getDescripcion())
                .build();
    }
}
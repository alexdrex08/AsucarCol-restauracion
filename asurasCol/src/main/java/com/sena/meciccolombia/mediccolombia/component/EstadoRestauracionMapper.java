package com.sena.meciccolombia.mediccolombia.component;

import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.domain.EstadoRestauracion;
import com.sena.meciccolombia.mediccolombia.web.dto.response.EstadoRestauracionResponseDTO;

@Component 
public class EstadoRestauracionMapper {
    public EstadoRestauracionResponseDTO toResponseDTO(EstadoRestauracion e) {
        if (e == null) return null;
        return EstadoRestauracionResponseDTO.builder()
                .id(e.getId())
                .nombre(e.getNombre())
                .descripcion(e.getDescripcion())
                .orden(e.getOrden())
                .esFinal(e.getEsFinal())
                .build();
    }
}
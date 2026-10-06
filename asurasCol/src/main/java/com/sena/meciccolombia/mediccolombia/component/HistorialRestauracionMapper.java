package com.sena.meciccolombia.mediccolombia.component;

import java.util.List;

import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.domain.FotoRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.HistorialRestauracion;
import com.sena.meciccolombia.mediccolombia.web.dto.response.FotoResponseDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.HistorialResponseDTO;

@Component
public class HistorialRestauracionMapper {

    public HistorialResponseDTO toResponseDTO(HistorialRestauracion h) {
        if (h == null) return null;

        List<FotoResponseDTO> fotos = h.getFotos() != null
                ? h.getFotos().stream().map(this::toFotoDTO).toList()
                : List.of();

        return HistorialResponseDTO.builder()
                .id(h.getId())
                .estadoAnterior(h.getEstadoAnterior() != null ? h.getEstadoAnterior().getNombre() : null)
                .estadoNuevo(h.getEstadoNuevo() != null ? h.getEstadoNuevo().getNombre() : null)
                .usuarioNombre(h.getUsuario() != null ? h.getUsuario().getNombre() : "Sistema")
                .comentario(h.getComentario())
                .esAutomatico(h.getEsAutomatico())
                .fecha(h.getFecha())
                .fotos(fotos)
                .build();
    }

    private FotoResponseDTO toFotoDTO(FotoRestauracion f) {
        if (f == null) return null;
        return FotoResponseDTO.builder()
                .id(f.getId())
                .urlFoto(f.getUrlFoto())
                .tipo(f.getTipo())
                .fecha(f.getFecha())
                .build();
    }
}
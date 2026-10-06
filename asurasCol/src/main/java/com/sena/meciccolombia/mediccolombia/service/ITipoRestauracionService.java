package com.sena.meciccolombia.mediccolombia.service;

import java.util.List;
import com.sena.meciccolombia.mediccolombia.web.dto.response.TipoRestauracionResponseDTO;

public interface ITipoRestauracionService {
    List<TipoRestauracionResponseDTO> listar();
    List<TipoRestauracionResponseDTO> buscarPorDescripcion(String texto);
    TipoRestauracionResponseDTO obtenerPorId(Long id);
}
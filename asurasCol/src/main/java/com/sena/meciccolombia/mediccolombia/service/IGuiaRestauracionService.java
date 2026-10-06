package com.sena.meciccolombia.mediccolombia.service;

import java.util.List;
import com.sena.meciccolombia.mediccolombia.web.dto.response.GuiaRestauracionResponseDTO;

public interface IGuiaRestauracionService {
    List<GuiaRestauracionResponseDTO> listar();
    GuiaRestauracionResponseDTO obtenerPorId(Long id);
}
package com.sena.meciccolombia.mediccolombia.service;

import java.util.List;
import com.sena.meciccolombia.mediccolombia.web.dto.response.EstadoRestauracionResponseDTO;

public interface IEstadoRestauracionService {
    List<EstadoRestauracionResponseDTO> listar();
    EstadoRestauracionResponseDTO obtenerPorId(Long id);
    EstadoRestauracionResponseDTO obtenerPorNombre(String nombre);
}
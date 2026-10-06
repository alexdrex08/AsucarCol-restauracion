package com.sena.meciccolombia.mediccolombia.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sena.meciccolombia.mediccolombia.component.EstadoRestauracionMapper;
import com.sena.meciccolombia.mediccolombia.dao.EstadoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.service.IEstadoRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.response.EstadoRestauracionResponseDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EstadoRestauracionServiceImpl implements IEstadoRestauracionService {

    private final EstadoRestauracionDAO estadoRestauracionDAO;
    private final EstadoRestauracionMapper mapper;

    @Override
    @Transactional(readOnly = true)
    public List<EstadoRestauracionResponseDTO> listar() {
        return estadoRestauracionDAO.findAllByOrderByOrdenAsc().stream()
                .map(mapper::toResponseDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public EstadoRestauracionResponseDTO obtenerPorId(Long id) {
        return estadoRestauracionDAO.findById(id)
                .map(mapper::toResponseDTO)
                .orElseThrow(() -> new RuntimeException("Estado no encontrado"));
    }

    @Override
    @Transactional(readOnly = true)
    public EstadoRestauracionResponseDTO obtenerPorNombre(String nombre) {
        return estadoRestauracionDAO.findByNombre(nombre)
                .map(mapper::toResponseDTO)
                .orElseThrow(() -> new RuntimeException("Estado no encontrado"));
    }
}
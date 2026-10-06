package com.sena.meciccolombia.mediccolombia.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sena.meciccolombia.mediccolombia.component.GuiaRestauracionMapper;
import com.sena.meciccolombia.mediccolombia.dao.GuiaRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.service.IGuiaRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.response.GuiaRestauracionResponseDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuiaRestauracionServiceImpl implements IGuiaRestauracionService {

    private final GuiaRestauracionDAO guiaRestauracionDAO;
    private final GuiaRestauracionMapper mapper;

    @Override
    @Transactional(readOnly = true)
    public List<GuiaRestauracionResponseDTO> listar() {
        return guiaRestauracionDAO.findAll().stream()
                .map(mapper::toResponseDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public GuiaRestauracionResponseDTO obtenerPorId(Long id) {
        return guiaRestauracionDAO.findById(id)
                .map(mapper::toResponseDTO)
                .orElseThrow(() -> new RuntimeException("Guía no encontrada"));
    }
}
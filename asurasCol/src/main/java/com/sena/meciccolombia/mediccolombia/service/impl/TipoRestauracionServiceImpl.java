package com.sena.meciccolombia.mediccolombia.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.sena.meciccolombia.mediccolombia.component.TipoRestauracionMapper;
import com.sena.meciccolombia.mediccolombia.dao.TipoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.service.ITipoRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.response.TipoRestauracionResponseDTO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TipoRestauracionServiceImpl implements ITipoRestauracionService {

    private final TipoRestauracionDAO tipoRestauracionDAO;
    private final TipoRestauracionMapper mapper;

    @Override
    @Transactional(readOnly = true)
    public List<TipoRestauracionResponseDTO> listar() {
        return tipoRestauracionDAO.findAll().stream()
                .map(mapper::toResponseDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public List<TipoRestauracionResponseDTO> buscarPorDescripcion(String texto) {
        if (texto == null || texto.isBlank()) return listar();
        return tipoRestauracionDAO.findByDescripcionContainingIgnoreCase(texto).stream()
                .map(mapper::toResponseDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public TipoRestauracionResponseDTO obtenerPorId(Long id) {
        return tipoRestauracionDAO.findById(id)
                .map(mapper::toResponseDTO)
                .orElseThrow(() -> new RuntimeException("Tipo de restauración no encontrado"));
    }
}
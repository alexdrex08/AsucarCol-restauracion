package com.sena.meciccolombia.mediccolombia.service;

import java.util.List;
import com.sena.meciccolombia.mediccolombia.web.dto.response.AlertaRestauracionResponseDTO;

public interface IAlertaRestauracionService {
    void generarAlertasMensuales();

    long contarPendientes();

    List<AlertaRestauracionResponseDTO> listarPendientes();

    List<AlertaRestauracionResponseDTO> listarPendientesRecientes(int limite);

    AlertaRestauracionResponseDTO resolver(Long idAlerta, String observacion, Long idUsuario);

    List<AlertaRestauracionResponseDTO> listarPorRestauracion(Long idRestauracion);

    long contarPendientesPorCliente(Long idCliente);
}
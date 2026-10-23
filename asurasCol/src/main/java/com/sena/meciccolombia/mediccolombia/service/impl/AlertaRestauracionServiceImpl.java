package com.sena.meciccolombia.mediccolombia.service.impl;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sena.meciccolombia.mediccolombia.dao.AlertaRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.EstadoRestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.RestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.UsuarioDAO;
import com.sena.meciccolombia.mediccolombia.domain.AlertaRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.EstadoRestauracion;
import com.sena.meciccolombia.mediccolombia.domain.Restauracion;
import com.sena.meciccolombia.mediccolombia.domain.Usuario;
import com.sena.meciccolombia.mediccolombia.service.IAlertaRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.response.AlertaRestauracionResponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlertaRestauracionServiceImpl implements IAlertaRestauracionService {

    private final AlertaRestauracionDAO alertaDAO;
    private final RestauracionDAO restauracionDAO;
    private final EstadoRestauracionDAO estadoRestauracionDAO;
    private final UsuarioDAO usuarioDAO;

    private static final int MESES_MAXIMOS_ALERTA = 3;

    @Override
    @Transactional
    public void generarAlertasMensuales() {
        EstadoRestauracion estadoTienda = estadoRestauracionDAO.findByNombre("Tienda").orElse(null);
        if (estadoTienda == null)
            return;

        LocalDateTime ahora = LocalDateTime.now();
        List<Restauracion> enTienda = restauracionDAO.findByEstadoActualId(estadoTienda.getId());

        for (Restauracion r : enTienda) {
            if (r.getFechaLlegadaTienda() == null)
                continue;

            long meses = ChronoUnit.MONTHS.between(r.getFechaLlegadaTienda(), ahora);
            if (meses < 1 || meses > MESES_MAXIMOS_ALERTA)
                continue;

            Set<Integer> mesesExistentes = alertaDAO.findByRestauracionId(r.getId()).stream()
                    .map(AlertaRestauracion::getMesAlerta)
                    .collect(Collectors.toSet());

            for (int mes = 1; mes <= meses; mes++) {
                if (mesesExistentes.contains(mes))
                    continue;

                AlertaRestauracion alerta = AlertaRestauracion.builder()
                        .restauracion(r)
                        .mesAlerta(mes)
                        .fechaGeneracion(ahora)
                        .resuelta(false)
                        .build();
                alertaDAO.save(alerta);
            }
        }
    }

    @Override
    @Transactional(readOnly = true)
    public long contarPendientes() {
        return alertaDAO.countByResueltaFalse();
    }

    @Override
    @Transactional(readOnly = true)
    public List<AlertaRestauracionResponseDTO> listarPendientes() {
        return alertaDAO.findByResueltaFalseOrderByFechaGeneracionAsc()
                .stream().map(this::toDTO).toList();
    }

    @Override
    @Transactional(readOnly = true)
    public List<AlertaRestauracionResponseDTO> listarPendientesRecientes(int limite) {
        return alertaDAO.findByResueltaFalseOrderByFechaGeneracionAsc()
                .stream().limit(limite).map(this::toDTO).toList();
    }

    @Override
    @Transactional
    public AlertaRestauracionResponseDTO resolver(Long idAlerta, String observacion, Long idUsuario) {
        AlertaRestauracion alerta = alertaDAO.findById(idAlerta)
                .orElseThrow(() -> new RuntimeException("Alerta no encontrada"));

        if (Boolean.TRUE.equals(alerta.getResuelta())) {
            throw new IllegalStateException("Esta alerta ya fue atendida");
        }

        Usuario usuario = usuarioDAO.findById(idUsuario)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));

        alerta.setObservacion(observacion);
        alerta.setResuelta(true);
        alerta.setFechaResolucion(LocalDateTime.now());
        alerta.setUsuarioResolucion(usuario);
        alertaDAO.save(alerta);

        return toDTO(alerta);
    }

    @Override
    @Transactional(readOnly = true)
    public List<AlertaRestauracionResponseDTO> listarPorRestauracion(Long idRestauracion) {
        return alertaDAO.findByRestauracionId(idRestauracion).stream()
                .sorted(java.util.Comparator.comparing(AlertaRestauracion::getMesAlerta))
                .map(this::toDTO)
                .toList();
    }

    private AlertaRestauracionResponseDTO toDTO(AlertaRestauracion a) {
        return AlertaRestauracionResponseDTO.builder()
                .id(a.getId())
                .idRestauracion(a.getRestauracion().getId())
                .numeroSpv(a.getRestauracion().getNumeroSpv())
                .nombreCliente(a.getRestauracion().getCliente().getNombreCliente())
                .identificacionCliente(a.getRestauracion().getCliente().getIdentificacion())
                .estadoActual(a.getRestauracion().getEstadoActual().getNombre())
                .fechaLlegadaTienda(a.getRestauracion().getFechaLlegadaTienda())
                .mesAlerta(a.getMesAlerta())
                .fechaGeneracion(a.getFechaGeneracion())
                .observacion(a.getObservacion())
                .resuelta(a.getResuelta())
                .fechaResolucion(a.getFechaResolucion())
                .usuarioResolucion(a.getUsuarioResolucion() != null
                        ? a.getUsuarioResolucion().getNombre()
                        : null)
                .build();
    }
}
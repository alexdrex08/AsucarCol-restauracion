package com.sena.meciccolombia.mediccolombia.web.controller.rest;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sena.meciccolombia.mediccolombia.dao.RestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.RestauracionGuiaDAO;
import com.sena.meciccolombia.mediccolombia.domain.Cliente;
import com.sena.meciccolombia.mediccolombia.domain.Restauracion;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/dashboard-restauraciones")
@RequiredArgsConstructor
public class DashboardRestauracionRestController {

    private final RestauracionDAO restauracionDAO;
    private final RestauracionGuiaDAO restauracionGuiaDAO;

    @GetMapping("/conteos")
    public Map<String, Object> conteos() {
        List<Restauracion> todas = restauracionDAO.findAll();
        long total = todas.size();
        long enProceso = todas.stream()
                .filter(r -> !"Finalizado".equals(r.getEstadoActual().getNombre()))
                .count();
        long devueltas = todas.stream()
                .filter(r -> "Devuelto Taller".equals(r.getEstadoActual().getNombre()))
                .count();
        long finalizadas = todas.stream()
                .filter(r -> "Finalizado".equals(r.getEstadoActual().getNombre()))
                .count();
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("total", total);
        m.put("enProceso", enProceso);
        m.put("devueltas", devueltas);
        m.put("finalizadas", finalizadas);
        return m;
    }

    @GetMapping("/por-estado")
    public List<Map<String, Object>> porEstado() {
        return restauracionDAO.findAll().stream()
                .collect(Collectors.groupingBy(
                        r -> r.getEstadoActual().getNombre(),
                        Collectors.counting()))
                .entrySet().stream()
                .sorted(Map.Entry.<String, Long>comparingByValue().reversed())
                .map(e -> Map.<String, Object>of("estado", e.getKey(), "cantidad", e.getValue()))
                .toList();
    }

    @GetMapping("/por-tipo")
    public List<Map<String, Object>> porTipo() {
        return restauracionDAO.findAll().stream()
                .collect(Collectors.groupingBy(
                        r -> r.getTipoRestauracion().getTipo() + " - "
                                + r.getTipoRestauracion().getDescripcion(),
                        Collectors.counting()))
                .entrySet().stream()
                .sorted(Map.Entry.<String, Long>comparingByValue().reversed())
                .map(e -> Map.<String, Object>of("tipo", e.getKey(), "cantidad", e.getValue()))
                .toList();
    }

    @GetMapping("/por-dia")
    public List<Map<String, Object>> porDia(@RequestParam(defaultValue = "30") int dias) {
        LocalDate hoy = LocalDate.now();
        LocalDate inicio = hoy.minusDays(dias - 1);

        Map<String, long[]> porDia = new LinkedHashMap<>();
        for (int i = 0; i < dias; i++) {
            porDia.put(inicio.plusDays(i).toString(), new long[] { 0, 0 });
        }

        for (Restauracion r : restauracionDAO.findAll()) {
            if (r.getFechaCreacion() != null) {
                LocalDate f = r.getFechaCreacion().toLocalDate();
                if (!f.isBefore(inicio) && !f.isAfter(hoy) && porDia.containsKey(f.toString())) {
                    porDia.get(f.toString())[0]++;
                }
            }
            if (r.getFechaEntrega() != null) {
                LocalDate f = r.getFechaEntrega().toLocalDate();
                if (!f.isBefore(inicio) && !f.isAfter(hoy) && porDia.containsKey(f.toString())) {
                    porDia.get(f.toString())[1]++;
                }
            }
        }

        return porDia.entrySet().stream()
                .map(e -> Map.<String, Object>of(
                        "fecha", e.getKey(),
                        "creadas", e.getValue()[0],
                        "entregadas", e.getValue()[1]))
                .toList();
    }

    @GetMapping("/top-clientes")
    public List<Map<String, Object>> topClientes(@RequestParam(defaultValue = "5") int limite) {
        return restauracionDAO.findAll().stream()
                .collect(Collectors.groupingBy(Restauracion::getCliente, Collectors.counting()))
                .entrySet().stream()
                .sorted(Map.Entry.<Cliente, Long>comparingByValue().reversed())
                .limit(limite)
                .map(e -> Map.<String, Object>of(
                        "nombre", e.getKey().getNombreCliente(),
                        "identificacion", e.getKey().getIdentificacion(),
                        "cantidad", e.getValue()))
                .toList();
    }

    @GetMapping("/con-guia")
    public Map<String, Object> conGuia() {
        Set<Long> idsConGuia = restauracionGuiaDAO.findAll().stream()
                .map(rg -> rg.getRestauracion().getId())
                .collect(Collectors.toSet());
        long total = restauracionDAO.count();
        long conGuia = idsConGuia.size();
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("conGuia", conGuia);
        m.put("sinGuia", total - conGuia);
        return m;
    }

    @GetMapping("/ultimas")
    public List<Map<String, Object>> ultimas(@RequestParam(defaultValue = "5") int limite) {
        return restauracionDAO.findAll().stream()
                .filter(r -> r.getFechaCreacion() != null)
                .sorted(Comparator.comparing(Restauracion::getFechaCreacion).reversed())
                .limit(limite)
                .map(r -> {
                    Map<String, Object> m = new LinkedHashMap<>();
                    m.put("id", r.getId());
                    m.put("numeroSpv", r.getNumeroSpv());
                    m.put("cliente", r.getCliente().getNombreCliente());
                    m.put("tipo", r.getTipoRestauracion().getDescripcion());
                    m.put("estado", r.getEstadoActual().getNombre());
                    m.put("fecha", r.getFechaCreacion().toString());
                    m.put("usuario", r.getUsuarioRegistra().getNombre());
                    return m;
                })
                .toList();
    }
}
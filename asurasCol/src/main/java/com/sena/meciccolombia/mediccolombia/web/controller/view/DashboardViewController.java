package com.sena.meciccolombia.mediccolombia.web.controller.view;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Stream;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sena.meciccolombia.mediccolombia.dao.RestauracionDAO;
import com.sena.meciccolombia.mediccolombia.domain.Restauracion;
import com.sena.meciccolombia.mediccolombia.security.MyUserDetails;
import com.sena.meciccolombia.mediccolombia.service.AlertaInvService;
import com.sena.meciccolombia.mediccolombia.service.ConfiguracionSistemaService;
import com.sena.meciccolombia.mediccolombia.service.MovimientoProdService;
import com.sena.meciccolombia.mediccolombia.service.ProductoService;
import com.sena.meciccolombia.mediccolombia.service.ProveedorService;
import com.sena.meciccolombia.mediccolombia.web.controller.rest.DashboardRestauracionRestController;
import com.sena.meciccolombia.mediccolombia.web.controller.view.DashboardViewController.MovimientoDashboardItem;
import com.sena.meciccolombia.mediccolombia.web.dto.response.MovimientoProdResponseDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/dashboard")
@RequiredArgsConstructor
public class DashboardViewController {

    private final ConfiguracionSistemaService configuracionService;
    private final DashboardRestauracionRestController dashboardRest;
    private final RestauracionDAO restauracionDAO;

    @GetMapping
    public String dashboard(Model modelo, Authentication auth) {
        MyUserDetails user = (MyUserDetails) auth.getPrincipal();

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

        int limite = leerConfigInt("filas_dashboard", 5);
        List<Restauracion> ultimas = todas.stream()
                .filter(r -> r.getFechaCreacion() != null)
                .sorted(Comparator.comparing(Restauracion::getFechaCreacion).reversed())
                .limit(limite)
                .toList();

        modelo.addAttribute("vistaActiva", "dashboard");
        modelo.addAttribute("esAdmin", "ADMIN".equals(user.getRol()));
        modelo.addAttribute("fechaActualizacion", LocalDateTime.now());
        modelo.addAttribute("totalRestauraciones", total);
        modelo.addAttribute("enProceso", enProceso);
        modelo.addAttribute("devueltas", devueltas);
        modelo.addAttribute("finalizadas", finalizadas);
        modelo.addAttribute("ultimasRestauraciones", ultimas);

        if (devueltas > 0) {
            modelo.addAttribute("recomendacion",
                    "Hay " + devueltas + " restauración(es) devuelta(s) al taller. Revisa su seguimiento.");
            modelo.addAttribute("recomendacionEstilo", "danger");
        } else if (enProceso > 0) {
            modelo.addAttribute("recomendacion",
                    "Hay " + enProceso + " restauración(es) en proceso. Da seguimiento a los clientes.");
            modelo.addAttribute("recomendacionEstilo", "warning");
        } else {
            modelo.addAttribute("recomendacion",
                    "No hay restauraciones pendientes. Todo al día.");
            modelo.addAttribute("recomendacionEstilo", "success");
        }

        return "dashboard/dashboard";
    }

    @Getter
    @AllArgsConstructor
    public static class MovimientoDashboardItem {
        private final MovimientoProdResponseDTO movimiento;
        private final boolean entrada;
    }

    private int leerConfigInt(String clave, int fallback) {
        try {
            String valor = configuracionService.obtenerValor(clave);
            return (valor != null && !valor.isBlank()) ? Integer.parseInt(valor.trim()) : fallback;
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
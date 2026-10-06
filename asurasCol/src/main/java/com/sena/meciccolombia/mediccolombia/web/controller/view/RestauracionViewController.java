package com.sena.meciccolombia.mediccolombia.web.controller.view;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sena.meciccolombia.mediccolombia.security.MyUserDetails;
import com.sena.meciccolombia.mediccolombia.service.ConfiguracionSistemaService;
import com.sena.meciccolombia.mediccolombia.service.IEstadoRestauracionService;
import com.sena.meciccolombia.mediccolombia.service.IRestauracionService;
import com.sena.meciccolombia.mediccolombia.service.ITipoRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionDetalleDTO;
import com.sena.meciccolombia.mediccolombia.web.dto.response.RestauracionResumenDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/restauraciones")
@RequiredArgsConstructor
public class RestauracionViewController {

    private final IRestauracionService restauracionService;
    private final ITipoRestauracionService tipoRestauracionService;
    private final IEstadoRestauracionService estadoRestauracionService;
    private final ConfiguracionSistemaService configuracionService;

    // ─────────────────────────────────────────────
    // GET /restauraciones — lista
    // ─────────────────────────────────────────────
    @GetMapping
    public String listar(Model model, Authentication auth) {
        MyUserDetails user = (MyUserDetails) auth.getPrincipal();
        List<RestauracionResumenDTO> restauraciones = restauracionService.listar();

        model.addAttribute("restauraciones", restauraciones);
        model.addAttribute("totalRestauraciones", restauraciones.size());
        model.addAttribute("estados", estadoRestauracionService.listar());
        model.addAttribute("tiposRestauracion", tipoRestauracionService.listar());
        model.addAttribute("esAdmin", "ADMIN".equals(user.getRol()));
        model.addAttribute("vistaActiva", "restauraciones-lista");
        return "restauraciones/lista-restauraciones";
    }

    // ─────────────────────────────────────────────
    // GET /restauraciones/nueva — formulario
    // ─────────────────────────────────────────────
    @GetMapping("/nueva")
    public String nueva(Model model) {
        model.addAttribute("tiposRestauracion", tipoRestauracionService.listar());

        String codTienda = configuracionService.obtenerValor("TIENDA_CODIGO");
        String prefijo = (codTienda != null ? codTienda : "----") + "00000";
        model.addAttribute("prefijoSpv", prefijo);

        model.addAttribute("vistaActiva", "restauraciones-nueva");
        return "restauraciones/crear-restauracion";
    }

    // ─────────────────────────────────────────────
    // GET /restauraciones/{id} — detalle
    // ─────────────────────────────────────────────
    @GetMapping("/{id}")
    public String detalle(@PathVariable Long id, Model model) {
        RestauracionDetalleDTO restauracion = restauracionService.obtenerDetalle(id);
        model.addAttribute("restauracion", restauracion);
        model.addAttribute("vistaActiva", "restauraciones-detalle");
        return "restauraciones/detalle-restauracion";
    }

    // ─────────────────────────────────────────────
    // GET /restauraciones/{id}/gestion — vista de gestión de estados
    // ─────────────────────────────────────────────
    @GetMapping("/{id}/gestion")
    public String gestion(@PathVariable Long id, Model model) {
        RestauracionDetalleDTO restauracion = restauracionService.obtenerDetalle(id);
        model.addAttribute("restauracion", restauracion);
        model.addAttribute("estados", estadoRestauracionService.listar());
        model.addAttribute("vistaActiva", "restauraciones-gestion");
        return "restauraciones/gestion-estado";
    }
}
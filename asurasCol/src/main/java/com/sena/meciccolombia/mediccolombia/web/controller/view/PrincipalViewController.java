package com.sena.meciccolombia.mediccolombia.web.controller.view;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sena.meciccolombia.mediccolombia.dao.ClienteDAO;
import com.sena.meciccolombia.mediccolombia.dao.ConfiguracionSistemaDAO;
import com.sena.meciccolombia.mediccolombia.dao.RestauracionDAO;
import com.sena.meciccolombia.mediccolombia.dao.UsuarioDAO;
import com.sena.meciccolombia.mediccolombia.security.MyUserDetails;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PrincipalViewController {

    private final RestauracionDAO restauracionDAO;
    private final ClienteDAO clienteDAO;
    private final UsuarioDAO usuarioDAO;
    private final ConfiguracionSistemaDAO configuracionSistemaDAO;

    @GetMapping("/principal")
    public String principal(Model modelo, Authentication auth) {
        MyUserDetails user = (MyUserDetails) auth.getPrincipal();
        boolean esAdmin = "ADMIN".equals(user.getRol());

        modelo.addAttribute("vistaActiva", "principal");
        modelo.addAttribute("usuario", user.getNombre());
        modelo.addAttribute("esAdmin", esAdmin);

        modelo.addAttribute("totalRestauraciones", restauracionDAO.count());
        modelo.addAttribute("totalClientes", clienteDAO.findByActivoTrue().size());

        if (esAdmin) {
            modelo.addAttribute("totalUsuarios", usuarioDAO.count());
            modelo.addAttribute("totalParametros", configuracionSistemaDAO.count());
        }

        return "principal/principal";
    }

    @GetMapping("/nosotros")
    public String nosotros(Model modelo, Authentication auth) {
        MyUserDetails user = (MyUserDetails) auth.getPrincipal();
        modelo.addAttribute("esAdmin", "ADMIN".equals(user.getRol()));
        return "principal/nosotros";
    }
}
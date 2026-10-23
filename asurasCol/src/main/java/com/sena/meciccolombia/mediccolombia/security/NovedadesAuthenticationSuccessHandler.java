package com.sena.meciccolombia.mediccolombia.security;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.sena.meciccolombia.mediccolombia.service.ConfiguracionSistemaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NovedadesAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private ConfiguracionSistemaService configuracionService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        String valor = configuracionService.obtenerValor("NOVEDADES_AL_INICIAR");
        boolean activo = valor == null || "true".equalsIgnoreCase(valor.trim());

        if (activo) {
            request.getSession().setAttribute("novedadesMostrar", true);
        }

        response.sendRedirect("/principal");
    }
}
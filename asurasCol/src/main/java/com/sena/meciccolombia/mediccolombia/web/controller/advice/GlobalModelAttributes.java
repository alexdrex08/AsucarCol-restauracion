package com.sena.meciccolombia.mediccolombia.web.controller.advice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import lombok.extern.slf4j.Slf4j;

import com.sena.meciccolombia.mediccolombia.service.ConfiguracionSistemaService;

import jakarta.servlet.http.HttpSession;

@Slf4j
@ControllerAdvice(basePackages = "com.sena.meciccolombia.mediccolombia.web.controller")
public class GlobalModelAttributes {

    @Autowired
    private ConfiguracionSistemaService configuracionService;

    @Value("${app.version:2.2}")
    private String appVersionProperty;

    @ModelAttribute("nombreEmpresa")
    public String nombreEmpresa() {
        return leer("nombre_empresa", "Asuras Col");
    }

    @ModelAttribute("nombreSistema")
    public String nombreSistema() {
        return leer("nombre_sistema", "Asuras Col");
    }

    @ModelAttribute("sloganEmpresa")
    public String sloganEmpresa() {
        return leer("slogan_empresa", "Control y confianza en cada registro");
    }

    @ModelAttribute("versionSistema")
    public String versionSistema() {
        return leer("version_sistema", "1.0.0");
    }

    @ModelAttribute("itemsPorPagina")
    public int itemsPorPagina() {
        return leerInt("items_por_pagina", 5);
    }

    @ModelAttribute("filasDashboard")
    public int filasDashboard() {
        return leerInt("filas_dashboard", 5);
    }

    // ── Novedades / versión de la app ────────────────────────────────

    @ModelAttribute("appVersion")
    public String appVersion() {
        return appVersionProperty;
    }

    @ModelAttribute("mostrarNovedadesAhora")
    public boolean mostrarNovedadesAhora(HttpSession session) {
        Object flag = session.getAttribute("novedadesMostrar");
        if (Boolean.TRUE.equals(flag)) {
            session.removeAttribute("novedadesMostrar");
            return true;
        }
        return false;
    }

    // ── helpers privados ──────────────────────────────────────────────

    private String leer(String clave, String fallback) {
        try {
            String valor = configuracionService.obtenerValor(clave);
            return (valor != null && !valor.isBlank()) ? valor.trim() : fallback;
        } catch (Exception e) {
            return fallback;
        }
    }

    private int leerInt(String clave, int fallback) {
        try {
            String valor = configuracionService.obtenerValor(clave);
            return (valor != null && !valor.isBlank()) ? Integer.parseInt(valor.trim()) : fallback;
        } catch (Exception e) {
            return fallback;
        }
    }
}
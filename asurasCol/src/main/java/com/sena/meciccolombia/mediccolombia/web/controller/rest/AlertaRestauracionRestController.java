package com.sena.meciccolombia.mediccolombia.web.controller.rest;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import com.sena.meciccolombia.mediccolombia.security.MyUserDetails;
import com.sena.meciccolombia.mediccolombia.service.IAlertaRestauracionService;
import com.sena.meciccolombia.mediccolombia.web.dto.request.ResolucionAlertaRequestDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/alertas-restauracion")
@RequiredArgsConstructor
public class AlertaRestauracionRestController {

    private final IAlertaRestauracionService alertaService;

    @PostMapping("/{id}/resolver")
    public ResponseEntity<?> resolver(@PathVariable Long id,
            @RequestBody ResolucionAlertaRequestDTO dto,
            Authentication auth) {
        try {
            MyUserDetails user = (MyUserDetails) auth.getPrincipal();
            return ResponseEntity.ok(alertaService.resolver(id, dto.getObservacion(), user.getId()));
        } catch (IllegalStateException e) {
            return ResponseEntity.badRequest().body(Map.of("error", e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.status(500).body(Map.of("error", "Error: " + e.getMessage()));
        }
    }
}
package com.sena.meciccolombia.mediccolombia.scheduler;

import java.time.LocalDateTime;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sena.meciccolombia.mediccolombia.service.IRestauracionService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RestauracionScheduler {

    private final IRestauracionService restauracionService;

    @Scheduled(cron = "0 0 1 * * *") // cada día a la 1:00 AM
    @Transactional
    public void finalizarRestauracionesAntiguas() {
        log.info("Iniciando cierre automático de restauraciones: {}", LocalDateTime.now());
        try {
            restauracionService.finalizarAutomaticamente();
            log.info("Cierre automático completado");
        } catch (Exception e) {
            log.error("Error en el cierre automático de restauraciones", e);
        }
    }
}
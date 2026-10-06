(function () {

    const COLORES = {
        estado: ['#0d6efd', '#ffc107', '#198754', '#dc3545', '#6c757d', '#0dcaf0', '#fd7e14'],
        creadas: '#0d6efd',
        entregadas: '#198754',
        linea: '#0dcaf0',
        lineaRelleno: 'rgba(13, 202, 240, 0.12)',
        tipos: 'rgba(255, 193, 7, 0.7)',
        tiposBorde: '#ffc107',
        clientes: 'rgba(13, 110, 253, 0.7)',
        clientesBorde: '#0d6efd',
        conGuia: '#198754',
        sinGuia: '#dc3545',
    };

    function ocultarSpinner(id) { const el = document.getElementById(id); if (el) el.style.display = 'none'; }
    function mostrarError(id) { const el = document.getElementById(id); if (el) el.style.display = ''; }
    function nombreMesActual() { return new Date().toLocaleDateString('es-CO', { month: 'long', year: 'numeric' }); }

    let loadedRest = false;
    let loadedTipos = false;
    let loadedClientes = false;

    let chartEstado = null, chartDia = null, chartLinea = null, chartTipos = null, chartGuia = null, chartClientes = null;

    // ═══════════════════ TAB 1: RESTAURACIONES ═══════════════════
    function loadRestauraciones() {
        if (loadedRest) return;
        loadedRest = true;

        // Doughnut por estado
        fetch('/api/dashboard-restauraciones/por-estado')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerEstado');
                if (!data.length) { document.getElementById('graficoEstado').style.display = 'none'; return; }
                const ctx = document.getElementById('graficoEstado').getContext('2d');
                chartEstado = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: data.map(d => d.estado),
                        datasets: [{
                            data: data.map(d => d.cantidad),
                            backgroundColor: COLORES.estado,
                            borderWidth: 2, borderColor: '#fff',
                        }]
                    },
                    options: { responsive: true, cutout: '68%', plugins: { legend: { display: false } } }
                });
                document.getElementById('leyendaEstado').innerHTML = data.map((d, i) =>
                    `<span>
                        <span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:${COLORES.estado[i % COLORES.estado.length]};margin-right:4px;"></span>
                        ${d.estado}: <strong>${d.cantidad}</strong>
                    </span>`).join('');
            })
            .catch(() => { ocultarSpinner('spinnerEstado'); mostrarError('errorEstado'); });

        // Bar creadas vs entregadas por día
        document.getElementById('labelMesRest').textContent = nombreMesActual();
        fetch('/api/dashboard-restauraciones/por-dia?dias=30')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerDia');
                const labels = data.map(d => {
                    const [y, m, dd] = d.fecha.split('-');
                    return `${dd}/${m}`;
                });
                const ctx = document.getElementById('graficoDia').getContext('2d');
                chartDia = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels,
                        datasets: [
                            {
                                label: 'Creadas', data: data.map(d => d.creadas),
                                backgroundColor: 'rgba(13, 110, 253, 0.7)',
                                borderColor: COLORES.creadas, borderWidth: 1, borderRadius: 3,
                            },
                            {
                                label: 'Entregadas', data: data.map(d => d.entregadas),
                                backgroundColor: 'rgba(25, 135, 84, 0.7)',
                                borderColor: COLORES.entregadas, borderWidth: 1, borderRadius: 3,
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        plugins: { legend: { position: 'top' } },
                        scales: {
                            x: { grid: { display: false }, ticks: { maxTicksLimit: 15, font: { size: 10 } } },
                            y: { beginAtZero: true, ticks: { precision: 0 } }
                        }
                    }
                });
            })
            .catch(() => { ocultarSpinner('spinnerDia'); mostrarError('errorDia'); });
    }

    // ═══════════════════ TAB 2: TIPOS ═══════════════════
    function loadTipos() {
        if (loadedTipos) return;
        loadedTipos = true;

        // Line: creadas últimos 30 días
        fetch('/api/dashboard-restauraciones/por-dia?dias=30')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerLinea');
                const labels = data.map(d => { const [y, m, dd] = d.fecha.split('-'); return `${dd}/${m}`; });
                const ctx = document.getElementById('graficoLinea').getContext('2d');
                chartLinea = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels,
                        datasets: [{
                            label: 'Restauraciones creadas',
                            data: data.map(d => d.creadas),
                            borderColor: COLORES.linea,
                            backgroundColor: COLORES.lineaRelleno,
                            borderWidth: 2, fill: true, tension: 0.3,
                            pointRadius: 3, pointHoverRadius: 6,
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: { legend: { display: false } },
                        scales: {
                            x: { grid: { display: false }, ticks: { maxTicksLimit: 10, font: { size: 10 } } },
                            y: { beginAtZero: true, ticks: { precision: 0 } }
                        }
                    }
                });
            })
            .catch(() => { ocultarSpinner('spinnerLinea'); mostrarError('errorLinea'); });

        // Bar top tipos
        fetch('/api/dashboard-restauraciones/por-tipo')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerTipos');
                const top = data.slice(0, 5);
                if (!top.length) { document.getElementById('sinTipos').style.display = ''; return; }
                const ctx = document.getElementById('graficoTopTipos').getContext('2d');
                chartTipos = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: top.map(t => t.tipo),
                        datasets: [{
                            label: 'Cantidad', data: top.map(t => t.cantidad),
                            backgroundColor: COLORES.tipos, borderColor: COLORES.tiposBorde, borderWidth: 1,
                        }]
                    },
                    options: {
                        indexAxis: 'y',
                        responsive: true,
                        plugins: {
                            legend: { display: false },
                            tooltip: { callbacks: { label: ctx => ` ${ctx.raw}` } }
                        },
                        scales: {
                            x: { beginAtZero: true, ticks: { precision: 0 } },
                            y: { grid: { display: false } }
                        }
                    }
                });
            })
            .catch(() => { ocultarSpinner('spinnerTipos'); mostrarError('errorTipos'); });
    }

    // ═══════════════════ TAB 3: CLIENTES ═══════════════════
    function loadClientes() {
        if (loadedClientes) return;
        loadedClientes = true;

        // Doughnut con/sin guía
        fetch('/api/dashboard-restauraciones/con-guia')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerGuia');
                const ctx = document.getElementById('graficoGuia').getContext('2d');
                chartGuia = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ['Con guía', 'Sin guía'],
                        datasets: [{
                            data: [data.conGuia, data.sinGuia],
                            backgroundColor: [COLORES.conGuia, COLORES.sinGuia],
                            borderWidth: 2, borderColor: '#fff',
                        }]
                    },
                    options: { responsive: true, cutout: '65%', plugins: { legend: { display: false } } }
                });
                document.getElementById('leyendaGuia').innerHTML = `
                    <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:${COLORES.conGuia};margin-right:4px;"></span>Con guía: <strong>${data.conGuia}</strong></span>
                    <span><span style="display:inline-block;width:10px;height:10px;border-radius:50%;background:${COLORES.sinGuia};margin-right:4px;"></span>Sin guía: <strong>${data.sinGuia}</strong></span>`;
            })
            .catch(() => { ocultarSpinner('spinnerGuia'); mostrarError('errorGuia'); });

        // Bar top clientes
        fetch('/api/dashboard-restauraciones/top-clientes?limite=5')
            .then(r => r.ok ? r.json() : Promise.reject())
            .then(data => {
                ocultarSpinner('spinnerClientes');
                if (!data.length) { document.getElementById('sinClientes').style.display = ''; return; }
                const ctx = document.getElementById('graficoTopClientes').getContext('2d');
                chartClientes = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: data.map(c => c.nombre),
                        datasets: [{
                            label: 'Restauraciones', data: data.map(c => c.cantidad),
                            backgroundColor: COLORES.clientes, borderColor: COLORES.clientesBorde, borderWidth: 1,
                        }]
                    },
                    options: {
                        indexAxis: 'y',
                        responsive: true,
                        plugins: {
                            legend: { display: false },
                            tooltip: { callbacks: { label: ctx => ` ${ctx.raw} restauración(es)` } }
                        },
                        scales: {
                            x: { beginAtZero: true, ticks: { precision: 0 } },
                            y: { grid: { display: false } }
                        }
                    }
                });
            })
            .catch(() => { ocultarSpinner('spinnerClientes'); mostrarError('errorClientes'); });
    }

    // ═══════════════════ LAZY LOADING ═══════════════════
    document.addEventListener('DOMContentLoaded', function () {
        loadRestauraciones();
        document.querySelectorAll('[data-bs-toggle="tab"]').forEach(tab => {
            tab.addEventListener('shown.bs.tab', function () {
                const target = this.getAttribute('data-bs-target');
                if (target === '#content-restauraciones') loadRestauraciones();
                else if (target === '#content-tipos') loadTipos();
                else if (target === '#content-clientes') loadClientes();
            });
        });
    });

})();
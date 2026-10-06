document.addEventListener('DOMContentLoaded', function () {

    // ── Paginación + filtros ──
    inicializarPaginacionYBusqueda({
        tablaId: 'tablaRestauraciones',
        paginacionId: 'paginacion',
        inputId: 'buscarRestauracion',
        filtrosSelect: [
            { id: 'filtroEstado', attr: 'estado' },
            { id: 'filtroTipo', attr: 'tipo' }
        ],
        btnLimpiarId: 'limpiarFiltros',
        inputsAdicional: ['filtroFecha'],
        inputsLimpiar: ['filtroFecha'],
        filasPorPagina: getFilasPorPagina ? getFilasPorPagina() : 5,
        filtroAdicional: function (fila) {
            const fecha = document.getElementById('filtroFecha').value;
            const fechaFila = fila.dataset.fecha;
            if (fecha && fechaFila && fechaFila !== fecha) return false;
            return true;
        }
    });

    actualizarContadores();

    const checkAll = document.getElementById('checkAll');
    if (checkAll) {
        checkAll.addEventListener('change', function () {
            document.querySelectorAll('.check-restauracion').forEach(c => c.checked = this.checked);
            actualizarContadorSeleccionadas();
        });
    }

    document.querySelectorAll('.check-restauracion').forEach(c => {
        c.addEventListener('change', actualizarContadorSeleccionadas);
    });

    const agruparSwitch = document.getElementById('agruparPorGuia');
    if (agruparSwitch) {
        agruparSwitch.addEventListener('change', function () {
            if (this.checked) agruparPorGuia();
            else location.reload();
        });
    }
});

function actualizarContadores() {
    let proceso = 0, entregados = 0, devueltos = 0;
    document.querySelectorAll('#tablaRestauraciones tr[data-estado]').forEach(tr => {
        const estado = tr.dataset.estado;
        if (estado === 'Entregado') entregados++;
        else if (estado === 'Devuelto Taller') devueltos++;
        else if (estado !== 'Finalizado') proceso++;
    });
    document.getElementById('contadorProceso').textContent = proceso;
    document.getElementById('contadorEntregados').textContent = entregados;
    document.getElementById('contadorDevueltos').textContent = devueltos;
}

function actualizarContadorSeleccionadas() {
    const total = document.querySelectorAll('.check-restauracion:checked').length;
    document.getElementById('contadorSeleccionadas').textContent = total + ' seleccionadas';
}

function agruparPorGuia() {
    const tbody = document.getElementById('tablaRestauraciones');
    const filas = Array.from(tbody.querySelectorAll('tr[data-guia]'));

    filas.sort((a, b) => {
        const ga = a.dataset.guia || 'SIN_GUIA';
        const gb = b.dataset.guia || 'SIN_GUIA';
        return ga.localeCompare(gb);
    });

    // Limpiar marcas previas
    filas.forEach(f => f.classList.remove('guia-group-start'));

    let prevGuia = null;
    filas.forEach((f, i) => {
        const guia = f.dataset.guia || 'SIN_GUIA';
        if (i > 0 && guia !== prevGuia) {
            f.classList.add('guia-group-start');
        }
        prevGuia = guia;
        tbody.appendChild(f);
    });
}

function asignarGuiaSeleccionadas() {
    const ids = Array.from(document.querySelectorAll('.check-restauracion:checked'))
        .map(c => parseInt(c.value));
    const numeroGuia = document.getElementById('inputNumeroGuia').value.trim();

    if (ids.length === 0) {
        mostrarMensajeSistema('Sin selección', 'Debes seleccionar al menos una restauración para asignar la guía.', 'warning');
        return;
    }
    if (!numeroGuia) {
        mostrarMensajeSistema('Falta el número de guía', 'Ingresa el número de guía antes de continuar.', 'warning');
        return;
    }

    mostrarModalConfirmacion(
        'Asignar guía',
        `¿Asignar la guía <strong>${numeroGuia}</strong> a las <strong>${ids.length}</strong> restauraciones seleccionadas?`,
        'info',
        async function () {
            try {
                const res = await fetch('/api/restauraciones/asignar-guia', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ ids, numeroGuia })
                });
                if (!res.ok) throw new Error('Error al asignar guía');
                location.reload();
            } catch (e) {
                mostrarMensajeSistema('Error', e.message, 'danger');
            }
        },
        'Sí, asignar'
    );
}
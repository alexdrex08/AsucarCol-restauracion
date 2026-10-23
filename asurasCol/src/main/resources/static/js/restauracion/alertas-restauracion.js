function abrirModalContacto(btn) {
    const id = btn.dataset.id;
    const spv = btn.dataset.spv;

    document.getElementById('alertaIdContacto').value = id;
    document.getElementById('modalContactoSpv').textContent = spv;
    document.getElementById('inputObservacionContacto').value = '';

    new bootstrap.Modal(document.getElementById('modalContacto')).show();
}

async function confirmarContacto() {
    const id = document.getElementById('alertaIdContacto').value;
    const observacion = document.getElementById('inputObservacionContacto').value.trim();

    if (!observacion) {
        mostrarMensajeSistema('Falta observación',
            'Escribe una breve nota del contacto con el cliente.', 'warning');
        return;
    }

    try {
        const res = await fetch(`/api/alertas-restauracion/${id}/resolver`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ observacion })
        });
        if (!res.ok) {
            const data = await res.json();
            throw new Error(data.error || 'Error al registrar');
        }
        bootstrap.Modal.getInstance(document.getElementById('modalContacto')).hide();
        location.reload();
    } catch (e) {
        mostrarMensajeSistema('Error', e.message, 'danger');
    }
}
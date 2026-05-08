<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    if (session.getAttribute("rol") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String ctx = request.getContextPath();
    String nombre = (String) session.getAttribute("nombre");
    String apellido = (String) session.getAttribute("apellido");
    String rol = (String) session.getAttribute("rol");
    String sector = (String) session.getAttribute("sector");
    String iniciales = "";
    if (nombre != null && nombre.length() > 0) {
        iniciales += nombre.substring(0, 1).toUpperCase();
    }
    if (apellido != null && apellido.length() > 0)
        iniciales += apellido.substring(0, 1).toUpperCase();
%>
<!doctype html>
<html lang="es-AR">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Dientitos — Dashboard</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= ctx%>/css/dientitos.css">
    </head>
    <body>
        <div class="app">

            <aside class="sidebar">
                <div class="brand">
                    <div class="brand-mark">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M7 3.5C5 3.5 3.5 5 3.5 7c0 1.5.5 3 1 5 .5 2 .5 4 1 6 .3 1.5 1 2.5 2 2.5s1.5-1 1.8-2.5c.3-1.7.7-3 1.7-3s1.4 1.3 1.7 3c.3 1.5.8 2.5 1.8 2.5s1.7-1 2-2.5c.5-2 .5-4 1-6 .5-2 1-3.5 1-5 0-2-1.5-3.5-3.5-3.5-1.3 0-2.3.6-3 1.5-.7-.9-1.7-1.5-3-1.5z"/>
                        </svg>
                    </div>
                    <div class="brand-name">Dientitos</div>
                </div>

                <div class="nav-section-label">Clínica Odontológica</div>

                <div class="nav-item active">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M3 11l9-8 9 8"/><path d="M5 9.5V21h14V9.5"/><path d="M10 21v-6h4v6"/>
                    </svg>
                    <span>Dashboard</span>
                </div>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 9h18"/><path d="M8 3v4M16 3v4"/>
                    </svg>
                    <span>Agenda</span>
                </a>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/>
                    </svg>
                    <span>Turnos</span>
                    <span class="badge badge-accent" style="margin-left:auto;">4</span>
                </a>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="8" r="3.2"/><path d="M3 20c0-3.3 2.7-6 6-6s6 2.7 6 6"/><path d="M16 4.5a3 3 0 010 6"/><path d="M21 20c0-2.6-1.5-4.7-4-5.5"/>
                    </svg>
                    <span>Pacientes</span>
                </a>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none" /><path d="M6 4h-1a2 2 0 0 0 -2 2v3.5a5.5 5.5 0 0 0 11 0v-3.5a2 2 0 0 0 -2 -2h-1" /><path d="M8 15a6 6 0 1 0 12 0v-3" /><path d="M11 3v2" /><path d="M6 3v2" /><path d="M18 10a2 2 0 1 0 4 0a2 2 0 1 0 -4 0" />
                    </svg>
                    <span>Odontólogos</span>
                </a>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.7 1.7 0 00.3 1.8l.1.1a2 2 0 11-2.8 2.8l-.1-.1a1.7 1.7 0 00-1.8-.3 1.7 1.7 0 00-1 1.5V21a2 2 0 11-4 0v-.1a1.7 1.7 0 00-1-1.5 1.7 1.7 0 00-1.8.3l-.1.1a2 2 0 11-2.8-2.8l.1-.1a1.7 1.7 0 00.3-1.8 1.7 1.7 0 00-1.5-1H3a2 2 0 110-4h.1a1.7 1.7 0 001.5-1 1.7 1.7 0 00-.3-1.8l-.1-.1a2 2 0 112.8-2.8l.1.1a1.7 1.7 0 001.8.3h.1a1.7 1.7 0 001-1.5V3a2 2 0 114 0v.1a1.7 1.7 0 001 1.5 1.7 1.7 0 001.8-.3l.1-.1a2 2 0 112.8 2.8l-.1.1a1.7 1.7 0 00-.3 1.8v.1a1.7 1.7 0 001.5 1H21a2 2 0 110 4h-.1a1.7 1.7 0 00-1.5 1z"/>
                    </svg>
                    <span>Horarios</span>
                </a>
                <a class="nav-item" href="#">
                    <svg class="ic" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2l8 4v6c0 5-3.5 9-8 10-4.5-1-8-5-8-10V6l8-4z"/>
                    </svg>
                    <span>Equipo y usuarios</span>
                </a>

                <div class="nav-spacer"></div>

                <button class="btn btn-ghost" data-theme-toggle style="justify-content:flex-start;padding:8px 10px;margin-bottom:8px;">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 12.8A9 9 0 1111.2 3a7 7 0 009.8 9.8z"/>
                    </svg>
                    <span data-theme-label>Tema oscuro</span>
                </button>

                <div class="user-card">
                    <div class="avatar" style="background:var(--brand);color:var(--brand-ink);"><%= iniciales%></div>
                    <div style="flex:1;min-width:0;">
                        <div style="font-size:12.5px;font-weight:500;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><%= nombre%> <%= apellido%></div>
                        <div class="dim" style="font-size:11px;text-transform:capitalize;"><%= rol%><%= sector != null ? " · " + sector : ""%></div>
                    </div>
                    <a class="btn btn-icon btn-ghost" title="Cerrar sesión" href="<%= ctx%>/dashboard.jsp?logout=1">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 01-2-2V5a2 2 0 012-2h4"/><path d="M16 17l5-5-5-5"/><path d="M21 12H9"/>
                        </svg>
                    </a>
                </div>
            </aside>

            <div>
                <div class="topbar">
                    <button class="btn btn-icon btn-ghost menu-btn" data-menu-toggle aria-label="Menú">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 6h18M3 12h18M3 18h18"/>
                        </svg>
                    </button>
                    <div class="breadcrumb">
                        <span>Inicio</span>
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
                        <span style="color:var(--ink);font-weight:500;">Dashboard</span>
                    </div>
                    <div style="flex:1;"></div>
                    <div class="search">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/>
                        </svg>
                        <input class="input" placeholder="Buscar paciente, DNI, turno…" />
                    </div>
                    <button class="btn btn-icon btn-ghost" title="Notificaciones">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M6 8a6 6 0 0112 0c0 7 3 7 3 9H3c0-2 3-2 3-9z"/><path d="M10 21a2 2 0 004 0"/>
                        </svg>
                    </button>
                </div>

                <main class="main anim-in">

                    <div class="page-head">
                        <div>
                            <div class="page-title">Buen día, <%= nombre%> <span style="color:var(--accent);font-style:italic;">·</span></div>
                            <div class="page-sub">Jueves 7 de mayo, 2026 — 2 turnos agendados para hoy</div>
                        </div>
                        <div class="row" style="gap:8px;">
                            <button class="btn">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M3 4h18l-7 9v6l-4-2v-4L3 4z"/></svg>
                                Filtros
                            </button>
                            <button class="btn btn-primary">
                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14M5 12h14"/></svg>
                                Nuevo turno
                            </button>
                        </div>
                    </div>

                    <div class="stat-grid">
                        <div class="card stat">
                            <div class="stat-label">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" style="color:var(--ink-3);"><rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 9h18"/><path d="M8 3v4M16 3v4"/></svg>
                                Turnos hoy
                            </div>
                            <div class="stat-value">2</div>
                            <div class="stat-delta up">+2 vs. ayer</div>
                        </div>
                        <div class="card stat">
                            <div class="stat-label">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" style="color:var(--ink-3);"><path d="M12 9v4M12 17h.01"/><path d="M10.3 3.9L1.8 18a2 2 0 001.7 3h17a2 2 0 001.7-3L13.7 3.9a2 2 0 00-3.4 0z"/></svg>
                                Pendientes de confirmar
                            </div>
                            <div class="stat-value">4</div>
                            <div class="stat-delta warn">4 requieren llamado</div>
                        </div>
                        <div class="card stat">
                            <div class="stat-label">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" style="color:var(--ink-3);"><circle cx="9" cy="8" r="3.2"/><path d="M3 20c0-3.3 2.7-6 6-6s6 2.7 6 6"/><path d="M16 4.5a3 3 0 010 6"/><path d="M21 20c0-2.6-1.5-4.7-4-5.5"/></svg>
                                Pacientes activos
                            </div>
                            <div class="stat-value">8</div>
                            <div class="stat-delta up">+3 este mes</div>
                        </div>
                        <div class="card stat">
                            <div class="stat-label">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" style="color:var(--ink-3);"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>
                                Turnos esta semana
                            </div>
                            <div class="stat-value">11</div>
                            <div class="stat-delta">92% confirmación</div>
                        </div>
                    </div>

                    <div class="dash-grid">

                        <div class="card">
                            <div class="card-header">
                                <div>
                                    <div class="card-title">Agenda de hoy</div>
                                    <div class="dim" style="font-size:12px;margin-top:2px;">Turnos del consultorio · todos los odontólogos</div>
                                </div>
                                <button class="btn btn-sm btn-ghost">Ver todos
                                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
                                </button>
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th style="width:70px;">Hora</th>
                                        <th>Paciente</th>
                                        <th>Odontólogo</th>
                                        <th>Motivo</th>
                                        <th>Estado</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="mono" style="font-weight:600;">10:00</td>
                                        <td>
                                            <div class="row">
                                                <div class="avatar">AM</div>
                                                <div>
                                                    <div style="font-weight:500;">Antonella Marín
                                                        <span class="badge badge-accent" style="margin-left:6px;font-size:10px;">menor · 8a</span>
                                                    </div>
                                                    <div class="dim mono" style="font-size:11px;">DNI 47.005.220</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div style="font-weight:500;">Dra. Camila Roldán</div>
                                            <div class="dim" style="font-size:11.5px;">Odontopediatría</div>
                                        </td>
                                        <td>Sellantes molares</td>
                                        <td><span class="badge badge-warn">Pendiente</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-ghost">
                                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mono" style="font-weight:600;">16:00</td>
                                        <td>
                                            <div class="row">
                                                <div class="avatar">LV</div>
                                                <div>
                                                    <div style="font-weight:500;">Lucía Vázquez</div>
                                                    <div class="dim mono" style="font-size:11px;">DNI 38.420.715</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div style="font-weight:500;">Dra. María Bravo</div>
                                            <div class="dim" style="font-size:11.5px;">Ortodoncia</div>
                                        </td>
                                        <td>Ajuste arco</td>
                                        <td><span class="badge badge-ok">Confirmado</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-ghost">
                                                <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="dash-side">

                            <div class="card card-pad">
                                <div class="card-title" style="font-size:15px;">Mañana</div>
                                <div class="dim" style="font-size:12px;margin-top:2px;">Vie 8 may · 2 turnos</div>
                                <div class="col" style="gap:8px;margin-top:14px;">
                                    <div class="row" style="gap:10px;">
                                        <div class="mono" style="font-weight:600;font-size:12px;width:44px;color:var(--brand);">09:00</div>
                                        <div style="flex:1;min-width:0;">
                                            <div style="font-size:13px;font-weight:500;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">Felipe Núñez</div>
                                            <div class="dim" style="font-size:11.5px;">Primera consulta</div>
                                        </div>
                                        <span class="badge badge-warn">Pendiente</span>
                                    </div>
                                    <div class="row" style="gap:10px;">
                                        <div class="mono" style="font-weight:600;font-size:12px;width:44px;color:var(--brand);">11:30</div>
                                        <div style="flex:1;min-width:0;">
                                            <div style="font-size:13px;font-weight:500;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">Mateo Gómez</div>
                                            <div class="dim" style="font-size:11.5px;">Control mensual</div>
                                        </div>
                                        <span class="badge badge-ok">Confirmado</span>
                                    </div>
                                </div>
                            </div>

                            <div class="card card-pad">
                                <div class="card-title" style="font-size:15px;">Carga por odontólogo</div>
                                <div class="dim" style="font-size:12px;margin-top:2px;">Esta semana</div>
                                <div class="col" style="gap:12px;margin-top:14px;">
                                    <div>
                                        <div class="row" style="justify-content:space-between;margin-bottom:4px;">
                                            <div style="font-size:12.5px;">Dra. María Bravo</div>
                                            <div class="mono" style="font-size:11.5px;color:var(--ink-3);">4 turnos</div>
                                        </div>
                                        <div class="bar-track"><div class="bar-fill" style="width:67%;background:#1f3a2e;"></div></div>
                                    </div>
                                    <div>
                                        <div class="row" style="justify-content:space-between;margin-bottom:4px;">
                                            <div style="font-size:12.5px;">Dr. Lucas Fernández</div>
                                            <div class="mono" style="font-size:11.5px;color:var(--ink-3);">2 turnos</div>
                                        </div>
                                        <div class="bar-track"><div class="bar-fill" style="width:33%;background:#4a6b8a;"></div></div>
                                    </div>
                                    <div>
                                        <div class="row" style="justify-content:space-between;margin-bottom:4px;">
                                            <div style="font-size:12.5px;">Dra. Camila Roldán</div>
                                            <div class="mono" style="font-size:11.5px;color:var(--ink-3);">3 turnos</div>
                                        </div>
                                        <div class="bar-track"><div class="bar-fill" style="width:50%;background:#c9a86b;"></div></div>
                                    </div>
                                    <div>
                                        <div class="row" style="justify-content:space-between;margin-bottom:4px;">
                                            <div style="font-size:12.5px;">Dr. Javier Soto</div>
                                            <div class="mono" style="font-size:11.5px;color:var(--ink-3);">2 turnos</div>
                                        </div>
                                        <div class="bar-track"><div class="bar-fill" style="width:33%;background:#b04a3c;"></div></div>
                                    </div>
                                </div>
                            </div>

                            <div class="card card-pad callout-accent">
                                <div class="row" style="gap:8px;margin-bottom:6px;">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" style="color:var(--accent);">
                                    <circle cx="12" cy="12" r="9"/><path d="M12 8h.01M11 12h1v5h1"/>
                                    </svg>
                                    <div style="font-weight:600;font-size:13px;">Llamados pendientes</div>
                                </div>
                                <div class="dim" style="font-size:12.5px;margin-bottom:12px;">
                                    4 pacientes esperan confirmación de su turno.
                                </div>
                                <button class="btn btn-sm" style="width:100%;justify-content:center;">
                                    Ver lista
                                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
                                </button>
                            </div>
                        </div>
                    </div>

                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="<%= ctx%>/js/ui.js"></script>
    </body>
</html>

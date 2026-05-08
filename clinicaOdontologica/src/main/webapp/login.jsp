<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    boolean hayError = request.getParameter("error") != null;
    String ctx = request.getContextPath();
%>
<!doctype html>
<html lang="es-AR">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dientitos — Iniciar sesión</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:opsz,wght@9..144,400;9..144,500;9..144,600;9..144,700&family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%= ctx %>/css/dientitos.css">
</head>
<body>
<div class="login-shell">

    <div class="login-art">
        <div style="position: relative; z-index: 1;">
            <div class="brand">
                <div class="brand-mark" style="width:40px;height:40px;">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M7 3.5C5 3.5 3.5 5 3.5 7c0 1.5.5 3 1 5 .5 2 .5 4 1 6 .3 1.5 1 2.5 2 2.5s1.5-1 1.8-2.5c.3-1.7.7-3 1.7-3s1.4 1.3 1.7 3c.3 1.5.8 2.5 1.8 2.5s1.7-1 2-2.5c.5-2 .5-4 1-6 .5-2 1-3.5 1-5 0-2-1.5-3.5-3.5-3.5-1.3 0-2.3.6-3 1.5-.7-.9-1.7-1.5-3-1.5z"/>
                    </svg>
                </div>
                <div class="brand-name" style="font-size:26px;">Dientitos</div>
            </div>
        </div>

        <div class="login-art-content">
            <div class="login-pill"><span class="dot"></span> Sistema de gestión clínica</div>
            <h1 class="login-headline">Cada turno, <em>en su lugar.</em></h1>
            <p class="login-tagline">
                Gestioná pacientes, agenda y horarios del consultorio desde un solo lugar.
                Pensado para odontólogos y personal administrativo.
            </p>
        </div>

        <div class="login-foot" style="position: relative; z-index: 1;">v1.0 · 2026 · Consultorio Dientitos</div>
    </div>

    <div class="login-form">
        <form class="login-card anim-in" method="post" action="<%= ctx %>/login" autocomplete="on">
            <h2 style="font-size:26px;margin-bottom:4px;">Iniciar sesión</h2>
            <p class="muted" style="font-size:13.5px;margin-bottom:22px;">Ingresá con tu usuario del consultorio.</p>

            <% if (hayError) { %>
                <div class="login-error">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M12 9v4M12 17h.01"/><path d="M10.3 3.9L1.8 18a2 2 0 001.7 3h17a2 2 0 001.7-3L13.7 3.9a2 2 0 00-3.4 0z"/>
                    </svg>
                    Credenciales inválidas. Probá con usuario <strong>paula.ramos</strong> y contraseña <strong>1234</strong>.
                </div>
            <% } %>

            <input type="hidden" name="rol" value="secretario" />

            <div class="col" style="gap:14px;">

                <div class="field">
                    <label class="field-label">Rol</label>
                    <div class="role-grid">
                        <button type="button" class="role-btn active" data-role-btn="secretario">
                            <div class="role-head">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="9" cy="8" r="3.2"/><path d="M3 20c0-3.3 2.7-6 6-6s6 2.7 6 6"/><path d="M16 4.5a3 3 0 010 6"/><path d="M21 20c0-2.6-1.5-4.7-4-5.5"/>
                                </svg>
                                <strong>Secretario/a</strong>
                            </div>
                            <div class="role-sub">Recepción · turnos</div>
                        </button>
                        <button type="button" class="role-btn" data-role-btn="odontologo">
                            <div class="role-head">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M7 3.5C5 3.5 3.5 5 3.5 7c0 1.5.5 3 1 5 .5 2 .5 4 1 6 .3 1.5 1 2.5 2 2.5s1.5-1 1.8-2.5c.3-1.7.7-3 1.7-3s1.4 1.3 1.7 3c.3 1.5.8 2.5 1.8 2.5s1.7-1 2-2.5c.5-2 .5-4 1-6 .5-2 1-3.5 1-5 0-2-1.5-3.5-3.5-3.5-1.3 0-2.3.6-3 1.5-.7-.9-1.7-1.5-3-1.5z"/>
                                </svg>
                                <strong>Odontólogo/a</strong>
                            </div>
                            <div class="role-sub">Mi agenda</div>
                        </button>
                    </div>
                </div>

                <div class="field">
                    <label class="field-label" for="usuario">Usuario</label>
                    <input id="usuario" class="input" name="usuario" value="paula.ramos" autocomplete="username" />
                </div>

                <div class="field">
                    <label class="field-label" for="contrasena">Contraseña</label>
                    <input id="contrasena" class="input" type="password" name="contrasena" placeholder="••••••••••••" autocomplete="current-password" />
                    <span class="field-hint">¿Olvidaste tu clave? Contactá a administración.</span>
                </div>

                <button type="submit" class="btn btn-primary" style="margin-top:6px;padding:11px 14px;justify-content:center;">
                    Entrar
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M5 12h14M13 6l6 6-6 6"/>
                    </svg>
                </button>
            </div>

            <div class="login-foot-form">
                <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M12 2l8 4v6c0 5-3.5 9-8 10-4.5-1-8-5-8-10V6l8-4z"/>
                </svg>
                Conexión cifrada · sesión válida 8 hs
            </div>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="<%= ctx %>/js/ui.js"></script>
</body>
</html>

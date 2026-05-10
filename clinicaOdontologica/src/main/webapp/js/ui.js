// ============================================================
// ui.js — comportamiento del cliente con jQuery 3.x
// ============================================================
// Patrón "IIFE" (Immediately Invoked Function Expression):
// envolvemos todo en una función que se ejecuta sola pasándole jQuery.
// Esto crea un alcance privado y nos asegura que dentro siempre podamos
// usar el alias `$` aunque alguien afuera haya hecho `jQuery.noConflict()`.
(function ($) {
    'use strict';

    var THEME_KEY = 'dientitos-theme';

    // 1) Aplicar el tema guardado ANTES del DOM ready.
    //    Esto no toca elementos del documento todavía: solo el atributo `data-theme`
    //    sobre <html>, así que es seguro hacerlo lo antes posible para evitar el
    //    "flash" de tema claro cuando el usuario tenía el oscuro guardado.
    try {
        var saved = localStorage.getItem(THEME_KEY);
        if (saved === 'dark' || saved === 'light') {
            // Vanilla aquí porque <html> existe siempre y es una sola línea:
            // jQuery sería `$('html').attr('data-theme', saved)` — equivalente.
            document.documentElement.setAttribute('data-theme', saved);
        }
    } catch (e) {
        // localStorage puede tirar en modo privado de algunos browsers; lo ignoramos.
    }

    // 2) `$(function () { ... })` es el atajo de jQuery para "esperar a que el DOM
    //    esté listo". Es lo mismo que `document.addEventListener('DOMContentLoaded', …)`.
    //    Todo el código que toque elementos de la página va acá adentro.
    $(function () {

        // ---------- Theme toggle (botón "Tema oscuro/claro" del sidebar) ----------
        // `$('[data-theme-toggle]')` devuelve un "objeto jQuery" — una colección
        // (posiblemente vacía) de elementos que coinciden con el selector CSS.
        // `.on('click', handler)` engancha el evento. Es el reemplazo moderno de
        // `.click(handler)` y permite también delegación (lo vemos abajo).
        $('[data-theme-toggle]').on('click', function () {
            // `$('html')` selecciona el <html>. `.attr('data-theme')` lee el atributo;
            // pasándole un segundo argumento, lo escribe.
            var $html = $('html');
            var actual = $html.attr('data-theme') === 'dark' ? 'dark' : 'light';
            var nuevo = actual === 'dark' ? 'light' : 'dark';
            $html.attr('data-theme', nuevo);

            // `.text(...)` reemplaza el texto del elemento (escapa HTML, así que
            // es más seguro que `.html(...)` cuando sólo hay strings).
            $('[data-theme-label]').text(nuevo === 'dark' ? 'Tema claro' : 'Tema oscuro');

            try { localStorage.setItem(THEME_KEY, nuevo); } catch (e) {}
        });

        // ---------- Mobile sidebar (botón hamburguesa de la topbar) ----------
        // `.toggleClass('open')` agrega la clase si no está y la saca si está.
        // Más limpio que el clásico `if (el.classList.contains(...)) { remove } else { add }`.
        $('[data-menu-toggle]').on('click', function () {
            $('.sidebar').toggleClass('open');
        });

        // ---------- Modales (apertura desde botones, cierre por scrim/Esc/X) ----------
        // Delegación con `$(document).on('click', selector, handler)`: el handler se engancha
        // en `document` pero solo dispara cuando el click viene de un elemento que matchea
        // el selector. Sirve incluso para elementos agregados después.
        $(document).on('click', '[data-modal-open]', function () {
            var id = $(this).attr('data-modal-open');
            $('#' + id).addClass('show');
            $('[data-modal-scrim="' + id + '"]').addClass('show');
        });
        $(document).on('click', '[data-modal-close], [data-modal-scrim]', function () {
            $('.modal.show').removeClass('show');
            $('.scrim.show').removeClass('show');
        });
        $(document).on('keydown', function (e) {
            if (e.key === 'Escape') {
                $('.modal.show').removeClass('show');
                $('.scrim.show').removeClass('show');
            }
        });

        // ---------- Color picker del form de odontólogo ----------
        // `[data-color-picker] > button` matchea cualquier botón directo dentro del wrapper.
        // El handler limpia el borde de los hermanos y resalta el clickeado.
        $(document).on('click', '[data-color-picker] > button', function () {
            $(this).siblings().css('border-color', 'transparent');
            $(this).css('border-color', 'var(--ink)');
        });

        // ---------- Selector de rol del login ----------
        // `$('[data-role-btn]')` es la colección de los dos botones (Secretario/Odontólogo).
        // jQuery deja encadenar: `.length` devuelve cuántos hay (como en un array).
        var $roleBtns = $('[data-role-btn]');
        if ($roleBtns.length) {
            var presets = { secretario: 'paula.ramos', odontologo: 'mbravo' };

            // `.on('click', ...)` sobre la colección engancha el handler en cada uno.
            // Dentro del handler, `this` es el elemento DOM que disparó el evento;
            // lo envolvemos con `$(this)` para volver a tener API de jQuery sobre él.
            $roleBtns.on('click', function () {
                var $btn = $(this);

                // `$btn.data('roleBtn')` lee `data-role-btn` (jQuery convierte
                // kebab-case a camelCase automáticamente). Devuelve el string
                // "secretario" u "odontologo".
                var rol = $btn.data('roleBtn');

                // Encadenamiento: limpia .active de TODOS los botones y agrégalo
                // sólo en el clickeado. `.removeClass()` y `.addClass()` actúan
                // sobre toda la colección (acá los dos) o sobre uno solo.
                $roleBtns.removeClass('active');
                $btn.addClass('active');

                // `.val()` sin argumento lee el value de un input; con argumento, lo escribe.
                // `input[name="rol"]` es selector CSS estándar — funciona igual que en JS.
                $('input[name="rol"]').val(rol);
                if (presets[rol]) {
                    $('input[name="usuario"]').val(presets[rol]);
                }
            });
        }
    });

})(jQuery);

/***
 * Params: 
 *  - el: Must be a div with css class 'round-progress-bar'
 *  
 * Usage:
 *  <div class="round-progress-bar" data-percent="100"></div>
 */
const drawRoundProgressBar = (el) => {
    var options = {
        percent: el.getAttribute('data-percent') || 25,
        size: el.getAttribute('data-size') || 220,
        lineWidth: el.getAttribute('data-line') || 15,
        rotate: el.getAttribute('data-rotate') || 0
    }

    var canvas = document.createElement('canvas');
    var span = document.createElement('span');
    span.textContent = options.percent + '%';

    if (typeof (G_vmlCanvasManager) !== 'undefined') {
        G_vmlCanvasManager.initElement(canvas);
    }

    var ctx = canvas.getContext('2d');
    canvas.width = canvas.height = options.size;

    el.appendChild(span);
    el.appendChild(canvas);

    ctx.translate(options.size / 2, options.size / 2); // change center
    ctx.rotate((-1 / 2 + options.rotate / 180) * Math.PI); // rotate -90 deg

    //imd = ctx.getImageData(0, 0, 240, 240);
    var radius = (options.size - options.lineWidth) / 2;

    var drawCircle = function (color, lineWidth, percent) {
        percent = Math.min(Math.max(0, percent || 1), 1);
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, Math.PI * 2 * percent, false);
        ctx.strokeStyle = color;
        ctx.lineCap = 'round'; // butt, round or square
        ctx.lineWidth = lineWidth
        ctx.stroke();
    };

    let color = '#555555';

    if (options.percent <= 40) {
        color = '#d50000'
    }

    if (options.percent > 40 && options.percent <= 65) {
        color = '#d55e00'
    }

    if (options.percent > 65 && options.percent <= 85) {
        color = '#d5d400'
    }

    if (options.percent > 85) {
        color = '#00d520'
    }

    drawCircle('#efefef', options.lineWidth, 100 / 100);
    drawCircle(color, options.lineWidth, options.percent / 100);
}
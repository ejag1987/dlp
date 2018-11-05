var _slicedToArray = function () {
    function sliceIterator(arr, i) {
        var _arr = [];
        var _n = true;
        var _d = false;
        var _e = undefined;

        try {
            for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) {
                _arr.push(_s.value); if (i && _arr.length === i) break;
            }
        } catch (err) {
            _d = true; _e = err;
        } finally {
            try {
                if (!_n && _i["return"]) _i["return"]();
            } finally { if (_d) throw _e; }
        }

        return _arr;
    }

    return function (arr, i) {
        if (Array.isArray(arr)) {
            return arr;
        } else if (Symbol.iterator in Object(arr)) {
            return sliceIterator(arr, i);
        } else {
            throw new TypeError("Invalid attempt to destructure non-iterable instance");
        }
    };
}();

var _createClass = function () {
    function defineProperties(target, props) {
        for (var i = 0; i < props.length; i++) {
            var descriptor = props[i];
            descriptor.enumerable = descriptor.enumerable || false;
            descriptor.configurable = true;
            if ("value" in descriptor) descriptor.writable = true;
            Object.defineProperty(target, descriptor.key, descriptor);
        }
    }

    return function (Constructor, protoProps, staticProps) {
        if (protoProps) defineProperties(Constructor.prototype, protoProps);
        if (staticProps) defineProperties(Constructor, staticProps);
        return Constructor;
    };
}();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var ancho = 800,
    alto = 500;

/*if (isMobile) {
    ancho = 360;
    alto = 200;
}*/

var defaults = {
    width: ancho,
    height: alto,
    margin: {
        top: 35,
        right: 150,
        bottom: 55,
        left: 150
    },
    axis: true,
    axisPadding: 35,
    axisPaddingBottom: 10,
    tickSize: 10,
    barPadding: 10,
    ease: d3.easeLinear,
    nice: true,
    type: 'rounded'
};

var BarChart = function () {
    function BarChart(element, options) {
        _classCallCheck(this, BarChart);

        Object.assign(this, defaults, options);

        this.element = element;
        this.init();
    }

    _createClass(BarChart, [{
        key: 'dimensions',
        value: function dimensions() {
            var margin = this.margin;

            return [this.width - margin.left - margin.right, this.height - margin.top - margin.bottom];
        }
    }, {
        key: 'init',
        value: function init() {
            var margin = this.margin,
                tickSize = this.tickSize,
                axisPadding = this.axisPadding,
                axisPaddingBottom = this.axisPaddingBottom;

            var _dimensions = this.dimensions(),
                _dimensions2 = _slicedToArray(_dimensions, 2),
                innerWidth = _dimensions2[0],
                innerHeight = _dimensions2[1];

            this.graph = d3.select(this.element);

            var svg = this.svg = this.graph.append('svg')
                .attr('width', this.width)
                .attr('height', this.height)
                .attr('viewBox', '0 0 '+this.width+' '+this.height)
                .append('g')
                    .attr('transform', 'translate(' + margin.left + ', ' + margin.top + ')');

            var scaleX = this.scaleX = d3.scaleLinear().range([0, innerWidth]);
            var scaleY = this.scaleY = d3.scaleLinear().range([innerHeight, 0]);

            var xAxis = this.xAxis = d3.axisBottom(scaleX)
                .ticks(10, "g")
                .tickPadding(8)
                .tickSize(tickSize);

            var yAxis = this.yAxis = d3.axisLeft(scaleY)
                .ticks(5)
                .tickPadding(8)
                .tickSize(tickSize);

            svg.append('g').attr('class', 'chart__axis chart__axis--x')
                .attr('transform', 'translate(0, ' + (innerHeight + axisPaddingBottom) + ')').call(xAxis);

            svg.append('g').attr('class', 'chart__axis chart__axis--y')
                .attr('transform', 'translate(' + -axisPadding + ', 0)').call(yAxis);
        }
    }, {
        key: 'renderAxis',
        value: function renderAxis(data, options) {
            var svg = this.svg;
            svg = options.animate ? svg.transition() : svg;
            svg.select('.chart__axis--x').call(this.xAxis);
            svg.select('.chart__axis--y').call(this.yAxis);
        }
    }, {
        key: 'renderBars',
        value: function renderBars(data, options) {
            var svg = this.svg,
                scaleX = this.scaleX,
                scaleY = this.scaleY,
                barPadding = this.barPadding,
                type = this.type,
                ease = this.ease;

            var _dimensions3 = this.dimensions(),
                _dimensions4 = _slicedToArray(_dimensions3, 2),
                innerWidth = _dimensions4[0],
                innerHeight = _dimensions4[1];

            var barWidth = innerWidth / data.length - barPadding;

            var column = svg.selectAll('.chart__column').data(data);

            column.enter().append('rect').attr('class', 'chart__column');

            (options.animate ? svg.selectAll('.chart__column')
                .transition().ease(ease) : svg.selectAll('.chart__column')).attr('x', function (data) {
                return scaleX(data.label) - barWidth / 2;
            }).attr('rx', type === 'rounded' ? barWidth / 2 : 0)
                .attr('ry', type === 'rounded' ? barWidth / 2 : 0).attr('width', barWidth).attr('height', innerHeight);

            column.exit().remove();

            var bar = svg.selectAll('.chart__bar').data(data);

            bar.enter().append('rect').attr('class', 'chart__bar');

            (options.animate ? svg.selectAll('.chart__bar')
                .transition().ease(ease) : svg.selectAll('.chart__bar')).attr('x', function (data) {
                return scaleX(data.label) - barWidth / 2;
            }).attr('y', function (data) {
                return scaleY(data.value);
            }).attr('rx', type === 'rounded' ? barWidth / 2 : 0)
                .attr('ry', type === 'rounded' ? barWidth / 2 : 0).attr('width', barWidth).attr('height', function (data) {
                return innerHeight - scaleY(data.value);
            });

            bar.exit().remove();
        }
    }, {
        key: 'render',
        value: function render(data) {
            var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
            var scaleX = this.scaleX,
                scaleY = this.scaleY;

            var domainX = scaleX.domain(d3.extent(data, function (data) {
                return data.label;
            }));
            var domainY = scaleY.domain([0, d3.max(data, function (data) {
                return data.value;
            })]);

            if (this.nice) {
                domainX.nice();
                domainY.nice();
            }

            if (this.axis) {
                this.renderAxis(data, options);
            }

            this.renderBars(data, options);
        }
    }, {
        key: 'update',
        value: function update(data, options) {
            this.render(data, {
                animate: true
            });
        }
    }]);

    return BarChart;
}();


function generateData(idGrafico, id) {
    var datos = [];

    var idioma = $('#idioma').val();

    $.post(
        urlSitio + idioma + '/pagina',
        {
            ajax: true,
            accion: 'cargarDatos',
            controller: 'Grafico',
            idGrafico: idGrafico,
            idioma: idioma
        }, function (data) {
            if (!data.success) {

            }

            datos = data.datos;

            var barChart = new BarChart('#'+id);
            barChart.render(datos);
        }, 'json'
    );
}

function generateRandomInteger(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

$(function() {
    $.each($('.js-bar-chart'), function () {
        var idGrafico = $(this).data('id');

        generateData(idGrafico, $(this).attr('id'));

        window.addEventListener('resize', function() {

        });


    });
});




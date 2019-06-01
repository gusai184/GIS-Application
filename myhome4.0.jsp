<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- <link rel="shortcut icon" href="lord-jagannath-12a.jpg"> -->
<link rel="stylesheet"
	href="http://localhost:8080/geoserver/openlayers3/ol.css"
	type="text/css">
<style>
.tooltip {
	position: relative;
	background: rgba(0, 0, 0, 0.5);
	border-radius: 4px;
	color: white;
	padding: 4px 8px;
	opacity: 0.7;
	white-space: nowrap;
}

.tooltip-measure {
	opacity: 1;
	font-weight: bold;
}

.tooltip-static {
	background-color: #ffcc33;
	color: black;
	border: 1px solid white;
}

.tooltip-measure:before, .tooltip-static:before {
	border-top: 6px solid rgba(0, 0, 0, 0.5);
	border-right: 6px solid transparent;
	border-left: 6px solid transparent;
	content: "";
	position: absolute;
	bottom: -6px;
	margin-left: -7px;
	left: 50%;
}

.tooltip-static:before {
	border-top-color: #ffcc33;
}

.ol-popup {
	position: absolute;
	background-color: white;
	-webkit-filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
	filter: drop-shadow(0 1px 4px rgba(0, 0, 0, 0.2));
	padding: 15px;
	border-radius: 10px;
	border: 1px solid #cccccc;
	bottom: 12px;
	left: -50px;
	min-width: 280px;
}

.ol-popup:after, .ol-popup:before {
	top: 100%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.ol-popup:after {
	border-top-color: white;
	border-width: 10px;
	left: 48px;
	margin-left: -10px;
}

.ol-popup:before {
	border-top-color: #cccccc;
	border-width: 11px;
	left: 48px;
	margin-left: -11px;
}

.ol-popup-closer {
	text-decoration: none;
	position: absolute;
	top: 2px;
	right: 8px;
}

.ol-popup-closer:after {
	content: "X";
}

.ol-zoom {
	top: 52px;
}

.ol-toggle-options {
	z-index: 1000;
	background: rgba(255, 255, 255, 0.4);
	border-radius: 4px;
	padding: 2px;
	position: absolute;
	left: 8px;
	top: 8px;
}

#updateFilterButton, #resetFilterButton {
	height: 22px;
	width: 22px;
	text-align: center;
	text-decoration: none !important;
	line-height: 22px;
	margin: 1px;
	font-family: 'Lucida Grande', Verdana, Geneva, Lucida, Arial, Helvetica,
		sans-serif;
	font-weight: bold !important;
	background: rgba(0, 60, 136, 0.5);
	color: white !important;
	padding: 2px;
}

.ol-toggle-options a {
	background: rgba(0, 60, 136, 0.5);
	color: white;
	display: block;
	font-family: 'Lucida Grande', Verdana, Geneva, Lucida, Arial, Helvetica,
		sans-serif;
	font-size: 19px;
	font-weight: bold;
	height: 22px;
	line-height: 11px;
	margin: 1px;
	padding: 0;
	text-align: center;
	text-decoration: none;
	width: 22px;
	border-radius: 2px;
}

.ol-toggle-options a:hover {
	color: #fff;
	text-decoration: none;
	background: rgba(0, 60, 136, 0.7);
}

body {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: small;
}

iframe {
	width: 100%;
	height: 250px;
	border: none;
}
/* Toolbar styles */
#toolbar {
	position: relative;
	padding-bottom: 0.5em;
}

#toolbar ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

#toolbar ul li {
	float: left;
	padding-right: 1em;
	padding-bottom: 0.5em;
}

#toolbar ul li a {
	font-weight: bold;
	font-size: smaller;
	vertical-align: middle;
	color: black;
	text-decoration: none;
}

#toolbar ul li a:hover {
	text-decoration: underline;
}

#toolbar ul li * {
	vertical-align: middle;
}

#map {
	clear: both;
	position: relative;
	width: 768px;
	height: 622px;
	border: 1px solid black;
        margin-top: 25px;
}

#wrapper {
	width: 768px;
}

#location {
	float: right;
}
/* Styles used by the default GetFeatureInfo output, added to make IE happy */
table.featureInfo, table.featureInfo td, table.featureInfo th {
	border: 1px solid #ddd;
	border-collapse: collapse;
	margin: 0;
	padding: 0;
	font-size: 90%;
	padding: .2em .1em;
}

table.featureInfo th {
	padding: .2em .2em;
	font-weight: bold;
	background: #eee;
}

table.featureInfo td {
	background: #fff;
}

table.featureInfo tr.odd td {
	background: #eee;
}

table.featureInfo caption {
	text-align: left;
	font-size: 100%;
	font-weight: bold;
	padding: .2em .2em;
}
</style>
<script src="http://localhost:8080/geoserver/openlayers3/ol.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

<script src="js/jspdf.min.js"></script>
<script src="js/QueryBuilder.js"></script>

<title>Texas view</title>
</head>
<body style="background-color:#99ebff">
        <%@include  file="gui.html" %>
	
	<div id="toolbar" style="display: none;">
		<ul>
			<li><a>WMS version:</a> <select id="wmsVersionSelector"
				onchange="setWMSVersion(value)">
					<option value="1.1.1">1.1.1</option>
					<option value="1.3.0">1.3.0</option>
			</select></li>
			<li><a>Tiling:</a> <select id="tilingModeSelector"
				onchange="setTileMode(value)">
					<option value="untiled">Single tile</option>
					<option value="tiled">Tiled</option>
			</select></li>
			<li><a>Antialias:</a> <select id="antialiasSelector"
				onchange="setAntialiasMode(value)">
					<option value="full">Full</option>
					<option value="text">Text only</option>
					<option value="none">Disabled</option>
			</select></li>
			<li><a>Format:</a> <select id="imageFormatSelector"
				onchange="setImageFormat(value)">
					<option value="image/png">PNG 24bit</option>
					<option value="image/png8">PNG 8bit</option>
					<option value="image/gif">GIF</option>
					<option id="jpeg" value="image/jpeg">JPEG</option>
					<option id="jpeg-png" value="image/vnd.jpeg-png">JPEG-PNG</option>
			</select></li>
			<li><a>Styles:</a> <select id="imageFormatSelector"
				onchange="setStyle(value)">
					<option value="">Default</option>
			</select></li>
			<li><a>Width/Height:</a> <select id="widthSelector"
				onchange="setWidth(value)">
					<!--
             These values come from a statistics of the viewable area given a certain screen area
             (but have been adapted a litte, simplified numbers, added some resolutions for wide screen)
             You can find them here: http://www.evolt.org/article/Real_World_Browser_Size_Stats_Part_II/20/2297/
             -->
					<option value="auto">Auto</option>
					<option value="600">600</option>
					<option value="750">750</option>
					<option value="950">950</option>
					<option value="1000">1000</option>
					<option value="1200">1200</option>
					<option value="1400">1400</option>
					<option value="1600">1600</option>
					<option value="1900">1900</option>
			</select> <select id="heigthSelector" onchange="setHeight(value)">
					<option value="auto">Auto</option>
					<option value="300">300</option>
					<option value="400">400</option>
					<option value="500">500</option>
					<option value="600">600</option>
					<option value="700">700</option>
					<option value="800">800</option>
					<option value="900">900</option>
					<option value="1000">1000</option>
			</select></li>
			<li><a>Filter:</a> <select id="filterType">
					<option value="cql">CQL</option>
					<option value="ogc">OGC</option>
					<option value="fid">FeatureID</option>
			</select> <input type="text" size="80" id="filter" /> <a
				id="updateFilterButton" href="#" onClick="updateFilter()"
				title="Apply filter">Apply</a> <a id="resetFilterButton" href="#"
				onClick="resetFilter()" title="Reset filter">Reset</a></li>
		</ul>
	</div>
	<table>
            <tr style="width: 100%;">
                <td style="width:20%">
                     <div class="tab-content">
                        <div id="home" class="container tab-pane active"><br>
                      
                          	<form method="get">
                                    <input type="checkbox" id="AirportCheckbox" value="Airport">Airports<br>
                                    <input type="checkbox" id="RoadsCheckbox" value="Roads">Roads<br>                                    
                                    <input type="checkbox" id="RiverCheckbox">Rivers<br> <input
                                            type="button" onclick="checkBoxChanged()" class="btn btn-primary" value="View on Map" />
                                </form>
                        </div>
                        <div id="measure_menu" class="container tab-pane fade"><br>
                          <h3>Measurement type &nbsp;</h3>
                            <form class="form-inline">				
                                <select id="type" class="form-control">
					<option value="length">Length (LineString)</option>
					<option value="area">Area (Polygon)</option>
				</select>
                            </form>
                        </div>
                         <div id="navigation_menu"  class="container tab-pane fade"><br>                             
                             <jsp:include page="search.jsp"/>
                         </div>
                        <div id="print_menu" class="    container tab-pane fade"><br>
                          <h3>Print Map</h3>
                            <!--button type="button" onclick="print_map()">Print Map</button-->
                           <form class="form">
                                   <label>Page size </label> <select id="format">
                                           <option value="a0">A0 (slow)</option>
                                           <option value="a1">A1</option>
                                           <option value="a2">A2</option>
                                           <option value="a3">A3</option>
                                           <option value="a4" selected>A4</option>
                                           <option value="a5">A5 (fast)</option>
                                   </select> <label>Resolution </label> <select id="resolution" style="visibility:hidden">
                                           <option value="72">72 dpi (fast)</option>
                                           <option value="150">150 dpi</option>
                                           <option value="300">300 dpi (slow)</option>
                                   </select>
                           </form>
                           <button class ="btn btn-primary" id="export-pdf">Print Map</button>
                        </div>
                         <div id="querybuilder_menu" class="container tab-pane fade">
                             <jsp:include page="QueryBuilder.jsp"></jsp:include>
                         </div>
                         <div id="pop_menu" class="container tab-pane fade">
                             <input type="checkbox" id="popcheckbox" value="population" onchange="population_function()"/>Population<br>
                             <img src="http://localhost:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=texas:counties_texas_gcs&STYLE=texas:texas_population_style"/>
                         </div>
                         
                      </div>
                </td>
                
                <td style="width:70%;" rowspan="2">
                        <div id="map" class="map">
                                <div class="ol-toggle-options ol-unselectable">

                                </div>
                        </div>
                </td
                <td style="width:10%"></td>

            </tr>
            <tr>
                    <td style="vertical-align:top">
                    <div>
                        <table>
                                <tr>
                                        <th><img
                                                src="http://localhost:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=texas:airports_points_gcs">
                                        Airport</th>


                                </tr>
                                <tr>
                                        <th><img
                                                src="http://localhost:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=texas:texas_roads_gcs&STYLE=texas:texas_road_legend">
                                        Road </th>

                                </tr>changLatLong
                                <tr>
                                            <th><img
                                                src="http://localhost:8080/geoserver/wms?REQUEST=GetLegendGraphic&VERSION=1.0.0&FORMAT=image/png&WIDTH=20&HEIGHT=20&LAYER=texas:texas_river_layer">
                                        River</th>

                                </tr>
                        </table>
                    </div>
            </td>
            
            </tr>
            
            
            <tr>	<td>
				<div id="popup" class="ol-popup">
					<a href="#" id="popup-closer" class="ol-popup-closer"></a>
					<div id="popup-content"></div>
				</div>
			</td>

			<!-- DDDDDDDDDDDDDDDDDDiiiiiiiiiiiiiiiiiiiiiiSSSSSSSSSSSSSSSSSSSSSSSSSSStttttttttttttt  -->
		</tr>
	</table>
	
	<div id="wrapper">
		<div id="location"></div>
		<div id="scale"></div>
		<div id="nodelist">
			<em>Click on the map to get feature info</em>
		</div>
	</div>





	<script type="text/javascript">
		
		//########################################################################################
		
	  var vector_source=new ol.source.Vector();
		
	  var vector = new ol.layer.Vector({
          source: vector_source,
          crossOrigin : 'anonymous',
          style: new ol.style.Style({
            fill: new ol.style.Fill({
              color: 'rgba(255, 255, 255, 0.2)'
            }),
            stroke: new ol.style.Stroke({
              color: '#ffcc33',
              width: 2
            }),
            image: new ol.style.Circle({
              radius: 7,
              fill: ol.style.Fill({
                color: '#ffcc33'
              })
            })
          })
        });
		
	  /**
       * Currently drawn feature.
       * @type {module:ol/Feature~Feature}
       */
      var sketch;


      /**
       * The help tooltip element.
       * @type {Element}
       */
      var helpTooltipElement;


      /**
       * Overlay to show the help messages.
       * @type {module:ol/Overlay}
       */
      var helpTooltip;


      /**
       * The measure tooltip element.
       * @type {Element}
       */
      var measureTooltipElement;


      /**
       * Overlay to show the measurement.
       * @type {module:ol/Overlay}
       */
      var measureTooltip;


      /**
       * Message to show when the user is drawing a polygon.
       * @type {string}
       */
      var continuePolygonMsg = 'Click to continue drawing the polygon';


      /**
       * Message to show when the user is drawing a line.
       * @type {string}
       */
      var continueLineMsg = 'Click to continue drawing the line';

       /**
        * Handle pointer move.
        * @param {module:ol/MapBrowserEvent~MapBrowserEvent} evt The event.
        */
       var pointerMoveHandler = function(evt) {
         if (evt.dragging) {
           return;
         }
         /** @type {string} */
         var helpMsg = 'Click to start drawing';

         if (sketch) {
           var geom = (sketch.getGeometry());
           if (geom instanceof ol.geom.Polygon) {
             helpMsg = continuePolygonMsg;
           } else if (geom instanceof ol.geom.LineString) {
             helpMsg = continueLineMsg;
           }
         }

         helpTooltipElement.innerHTML = helpMsg;
         helpTooltip.setPosition(evt.coordinate);

         helpTooltipElement.classList.remove('hidden');
       };

		
		
		var container = document.getElementById('popup');
      var content = document.getElementById('popup-content');
      var closer = document.getElementById('popup-closer');


      /**
       * Create an overlay to anchor the popup to the map.
       */
      var overlay = new ol.Overlay({
        element: container,
        autoPan: true,
        autoPanAnimation: {
          duration: 250
        }
      });


      /**
       * Add a click handler to hide the popup.
       * @return {boolean} Don't follow the href.
       */
      closer.onclick = function() {
        overlay.setPosition(undefined);
        closer.blur();
        return false;
      };

		
		
		
  //  function checkBoxChanged()
    //{
    	
      var layernames="texas:counties_texas_gcs";
      var pureCoverage = false;
      // if this is just a coverage or a group of them, disable a few items,
      // and default to jpeg format
      var format = 'image/png';
      var bounds = [-106.715774536133, 25.7923145294189,
                    -93.4416732788086, 36.5471572875977];
      if (pureCoverage) {
        document.getElementById('antialiasSelector').disabled = true;
        document.getElementById('jpeg').selected = true;
        format = "image/jpeg";
      }
      
      //#############################################################################################

      var supportsFiltering = true;
      if (!supportsFiltering) {
        document.getElementById('filterType').disabled = true;
        document.getElementById('filter').disabled = true;
        document.getElementById('updateFilterButton').disabled = true;
        document.getElementById('resetFilterButton').disabled = true;
      }

      var mousePositionControl = new ol.control.MousePosition({
        className: 'custom-mouse-position',
        target: document.getElementById('location'),
        coordinateFormat: ol.coordinate.createStringXY(5),
        undefinedHTML: '&nbsp;'
      });
      <!------------------------------------LAYERS------------------------------------------------------------------------------------------------------->
      var untiled = new ol.layer.Image({
    	  
    	  crossOrigin : 'anonymous',
        source: new ol.source.ImageWMS({
          ratio: 1,
          url: 'http://localhost:8080/geoserver/texas/wms',
          crossOrigin : 'anonymous',
          params: {'FORMAT': format,
                   'VERSION': '1.1.1',  
                STYLES: '',
                LAYERS: 'texas:counties_texas_gcs',
          }
        }),
        
      });
      
    
     
     
      var road_layer = new ol.layer.Tile({
        visible: true,
        crossOrigin : 'anonymous',
        source: new ol.source.TileWMS({
          url: 'http://localhost:8080/geoserver/texas/wms',
          crossOrigin : 'anonymous',
          params: {'FORMAT': format, 
                   'VERSION': '1.1.1',
                   tiled: true,
                STYLES: '',
                LAYERS: 'texas:texas_roads_gcs',
             tilesOrigin: -106.715774536133 + "," + 25.7923145294189
          }
        })
      });
      var airport_layer = new ol.layer.Tile({
          visible: true,
          crossOrigin : 'anonymous',
          source: new ol.source.TileWMS({
            url: 'http://localhost:8080/geoserver/texas/wms',
            crossOrigin : 'anonymous',
            params: {'FORMAT': format, 
                     'VERSION': '1.1.1',
                     tiled: true,
                  STYLES: '',
                  LAYERS: 'texas:airports_points_gcs',
               tilesOrigin: -104.837738037109 + "," + 25.8537502288818
            }
          }),
          
        });
      var river_layer = new ol.layer.Tile({
          visible: true,
          crossOrigin : 'anonymous',
          source: new ol.source.TileWMS({
            url: 'http://localhost:8080/geoserver/texas/wms',
            crossOrigin : 'anonymous',
            params: {'FORMAT': format, 
                     'VERSION': '1.1.1',
                     tiled: true,
                  STYLES: '',
                  LAYERS: 'texas:texas_river_layer',
               tilesOrigin: -106.62978153842352 + "," + 25.83768060315076
            }
          })
        });
      
      var population_layer = new ol.layer.Image({
    	  
    	  crossOrigin : 'anonymous',
	        source: new ol.source.ImageWMS({
	          ratio: 1,
	          url: 'http://localhost:8080/geoserver/texas/wms',
	          crossOrigin : 'anonymous',
	          params: {'FORMAT': format,
	                   'VERSION': '1.1.1',  
	                STYLES: 'texas:texas_population_style',
	                LAYERS: 'texas:counties_texas_gcs',
	          }
	        })
	      });
      
      
             
       
       var x = [untiled]
      var tiled
      
      
      <!------------------------------------------------------------------------------------------------------------------------------------------->
      var projection = new ol.proj.Projection({
          code: 'EPSG:4326',
          units: 'degrees',
          axisOrientation: 'neu',
          global: true
      });
      
      
      var map = new ol.Map({
        controls: ol.control.defaults({
          attribution: false
        }).extend([mousePositionControl]),
        target: 'map',
        overlays:[overlay],
        layers:[untiled,vector],
        
        view: new ol.View({
           projection: projection
        })
      });
  	
      map.on('pointermove', pointerMoveHandler);
      
      map.getViewport().addEventListener('mouseout', function() {
          helpTooltipElement.classList.add('hidden');
        });

        var typeSelect = document.getElementById('type');

        var draw; // global so we can remove it later
        
        var formatLength = function(line) {
        	
        //alert("Asdf");
            //var length = ol.sphere.getLength(line);
            var length=line.getLength();
            //alert("begin")
            var output;
            if (length > 100) {
              output = (Math.round(length / 1000 * 100) / 100) +
                  ' ' + 'km';
            } else {
              output = (Math.round(length * 100)) +
                  ' ' + 'km';
            }
            //alert("end")
            return output;
          };
          
          var formatArea = function(polygon) {
              //var area = ol.sphere.getArea(polygon);
              var area=polygon.getArea();
              var output;
              if (area > 10000) {
                output = (Math.round(area / 1000000 * 100) / 100) +
                    ' ' + 'km<sup>2</sup>';
              } else {
                output = (Math.round(area * 100)) +
                    ' ' + 'km<sup>2</sup>';
              }
              return output;
            };

     
            function addInteraction() {
              var type = (typeSelect.value == 'area' ? 'Polygon' : 'LineString');
              draw = new ol.interaction.Draw({
                source: vector_source,
                type: type,
                style: new ol.style.Style({
                  fill: new ol.style.Fill({
                    color: 'rgba(255, 255, 255, 0.2)'
                  }),
                  stroke: new ol.style.Stroke({
                    color: 'rgba(0, 0, 0, 0.5)',
                    lineDash: [10, 10],
                    width: 2
                  }),
                  image: new ol.style.Circle({
                    radius: 5,
                    stroke: ol.style.Stroke({
                      color: 'rgba(0, 0, 0, 0.7)'
                    }),
                    fill: ol.style.Fill({
                      color: 'rgba(255, 255, 255, 0.2)'
                    })
                  })
                })
              });
              map.addInteraction(draw);

              createMeasureTooltip();
              createHelpTooltip();

              var listener;
              draw.on('drawstart',
                function(evt) {
                  // set sketch
                  sketch = evt.feature;

                  /** @type {module:ol/coordinate~Coordinate|undefined} */
                  var tooltipCoord = evt.coordinate;

                  listener = sketch.getGeometry().on('change', function(evt) {
                    var geom = evt.target;
                    var output;
                    if (geom instanceof ol.geom.Polygon) {
                      output = formatArea(geom);
                      tooltipCoord = geom.getInteriorPoint().getCoordinates();
                    } else if (geom instanceof ol.geom.LineString) {
                      output = formatLength(geom);
                      tooltipCoord = geom.getLastCoordinate();
                    }
                    measureTooltipElement.innerHTML = output;
                    measureTooltip.setPosition(tooltipCoord);
                  });
                }, this);

              draw.on('drawend',
                function() {
                  measureTooltipElement.className = 'tooltip tooltip-static';
                  measureTooltip.setOffset([0, -7]);
                  // unset sketch
                  sketch = null;
                  // unset tooltip so that a new one can be created
                  measureTooltipElement = null;
                  createMeasureTooltip();
                  //unByKey(listener);
                  ol.Observable.unByKey(listener);
                }, this);
            }	

            /**
             * Creates a new help tooltip
             */
            function createHelpTooltip() {
              if (helpTooltipElement) {
                helpTooltipElement.parentNode.removeChild(helpTooltipElement);
              }
              helpTooltipElement = document.createElement('div');
              helpTooltipElement.className = 'tooltip hidden';
              helpTooltip = new ol.Overlay({
                element: helpTooltipElement,
                offset: [15, 0],
                positioning: 'center-left'
              });
              map.addOverlay(helpTooltip);
            }
            
            /**
             * Creates a new measure tooltip
             */
            function createMeasureTooltip() {
              if (measureTooltipElement) {
                measureTooltipElement.parentNode.removeChild(measureTooltipElement);
              }
              measureTooltipElement = document.createElement('div');
              measureTooltipElement.className = 'tooltip tooltip-measure';
              measureTooltip = new ol.Overlay({
                element: measureTooltipElement,
                offset: [0, -15],
                positioning: 'bottom-center'
              });
              map.addOverlay(measureTooltip);
            }

            /**
             * Let user change the geometry type.
             */
            typeSelect.onchange = function() {
              map.removeInteraction(draw);
              addInteraction();
            };

            addInteraction();
      
      map.getView().on('change:resolution', function(evt) {
        var resolution = evt.target.get('resolution');
        var units = map.getView().getProjection().getUnits();
        var dpi = 25.4 / 0.28;
        var mpu = ol.proj.METERS_PER_UNIT[units];
        var scale = resolution * mpu * 39.37 * dpi;
        if (scale >= 9500 && scale <= 950000) {
          scale = Math.round(scale / 1000) + "K";
        } else if (scale >= 950000) {
          scale = Math.round(scale / 1000000) + "M";
        } else {
          scale = Math.round(scale);
        }
        document.getElementById('scale').innerHTML = "<b>Scale = 1 : " + scale;
      });
      map.getView().fit(bounds, map.getSize());
      
      
      //alert(layernames)
      /*var layername='texas:counties_texas_gcs,texas:airports_points_gcs'
      
      var wmsSource1 = new ol.source.TileWMS({
			url : 'http://localhost:8080/geoserver/texas/wms',
			//crossOrigin: 'anonymous',
			params : {
				LAYERS :layername,
				VERSION : '1.1.1',
				transparent : true
			},
		});*/
      
      
		
		
		
		
		
		
      map.on('singleclick', function(evt) {
    	  //alert(layernames)
    	  
    	  
          //var layername='texas:counties_texas_gcs,texas:airports_points_gcs'
          
          var wmsSource1 = new ol.source.TileWMS({
    			url : 'http://localhost:8080/geoserver/texas/wms',
    			crossOrigin : 'anonymous',
    			//crossOrigin: 'anonymous',
    			params : {
    				LAYERS :layernames,
    				VERSION : '1.1.1',
    				transparent : true
    			},
    		});
      
    	  //layernames='texas:counties_texas_gcs'
    	 //alert("jbsfjkw")
        document.getElementById('nodelist').innerHTML = "Loading... please wait...";
        var view = map.getView();
        var viewResolution = view.getResolution();
        //untiled.set('visible', false);
        var source = wmsSource1;//tiled.getSource();
        
        var url = source.getGetFeatureInfoUrl(
          evt.coordinate, viewResolution, view.getProjection(),
          {'INFO_FORMAT': 'text/html', 'FEATURE_COUNT': 5});
        if (url) {
          //document.getElementById('nodelist').innerHTML = '<iframe seamless src="' + url + '"></iframe>';
        }
        var coordinate = evt.coordinate;
  	  var coords = ol.proj.toLonLat(evt.coordinate);
  	  var ll=ol.coordinate.toStringHDMS(coords);
  	  
  	  
  	content.innerHTML = '<iframe seamless src="' + url + '"></iframe>';
  	  //content.innerHTML = '<p>You clicked here:</p><code>'+ll+
      //  '</code>';
        
        
        
    overlay.setPosition(coordinate);
   
      });

      // sets the chosen WMS version
      function setWMSVersion(wmsVersion) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'VERSION': wmsVersion});
        });
        if(wmsVersion == "1.3.0") {
            origin = bounds[1] + ',' + bounds[0];
        } else {
            origin = bounds[0] + ',' + bounds[1];
        }
        tiled.getSource().updateParams({'tilesOrigin': origin});
      }

      // Tiling mode, can be 'tiled' or 'untiled'
      function setTileMode(tilingMode) {
        if (tilingMode == 'tiled') {
          untiled.set('visible', false);
          tiled.set('visible', true);
        } else {
          tiled.set('visible', false);
          untiled.set('visible', true);
        }
      }

      function setAntialiasMode(mode) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'FORMAT_OPTIONS': 'antialias:' + mode});
        });
      }

      // changes the current tile format
      function setImageFormat(mime) {
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'FORMAT': mime});
        });
      }

      function setStyle(style){
        map.getLayers().forEach(function(lyr) {
          lyr.getSource().updateParams({'STYLES': style});
        });
      }

      function setWidth(size){
        var mapDiv = document.getElementById('map');
        var wrapper = document.getElementById('wrapper');

        if (size == "auto") {
          // reset back to the default value
          mapDiv.style.width = null;
          wrapper.style.width = null;
        }
        else {
          mapDiv.style.width = size + "px";
          wrapper.style.width = size + "px";
        }
        // notify OL that we changed the size of the map div
        map.updateSize();
      }

      function setHeight(size){
        var mapDiv = document.getElementById('map');
        if (size == "auto") {
          // reset back to the default value
          mapDiv.style.height = null;
        }
        else {
          mapDiv.style.height = size + "px";
        }
        // notify OL that we changed the size of the map div
        map.updateSize();
      }

      function updateFilter(){
        if (!supportsFiltering) {
          return;
        }
        var filterType = document.getElementById('filterType').value;
        var filter = document.getElementById('filter').value;
        // by default, reset all filters
        var filterParams = {
          'FILTER': null,
          'CQL_FILTER': null,
          'FEATUREID': null
        };
        if (filter.replace(/^\s\s*/, '').replace(/\s\s*$/, '') != "") {
          if (filterType == "cql") {
            filterParams["CQL_FILTER"] = filter;
          }
          if (filterType == "ogc") {
            filterParams["FILTER"] = filter;
          }
          if (filterType == "fid")
            filterParams["FEATUREID"] = filter;
          }
          // merge the new filter definitions
          map.getLayers().forEach(function(lyr) {
            lyr.getSource().updateParams(filterParams);
          });
        }

        function resetFilter() {
          if (!supportsFiltering) {
            return;
          }
          document.getElementById('filter').value = "";
          updateFilter();
        }

        // shows/hide the control panel
        function toggleControlPanel(){
          var toolbar = document.getElementById("toolbar");
          if (toolbar.style.display == "none") {
            toolbar.style.display = "block";
          }
          else {
            toolbar.style.display = "none";
          }
          map.updateSize()
        }

  	
        //---------------------------------------------------------------------------------------------------
        
        function print_map(){
   		 window.print();
   	}
        function checkBoxChanged()
        {
      	 
       //tiled
        	layernames='texas:counties_texas_gcs'
    		//alert(strUser);-
                var layers = map.getLayers().getArray();               
                    for(var i=layers.length-1;i>=0;i--)
                        map.removeLayer(layers[i]);
           		
                map.addLayer(untiled);
            
		
    		var road_checkbox = document.getElementById("RoadsCheckbox");
    		var airport_checkbox = document.getElementById("AirportCheckbox");
     		var river_checkbox = document.getElementById("RiverCheckbox");
    		
    		
    		
    		
    		if(river_checkbox.checked)
    		{
    			map.addLayer(river_layer)
    			tiled = 'texas:texas_rivers'
    			layernames=layernames.concat(","+tiled)
    		}
    		
    		if(road_checkbox.checked)
    		{
    			map.addLayer(road_layer)
    			tiled = 'texas:texas_roads_gcs'
    			layernames=layernames.concat(","+tiled)
    		}
    		if(airport_checkbox.checked)
    		{
    			map.addLayer(airport_layer)
    			tiled = 'texas:airports_points_gcs'
    			layernames=layernames.concat(","+tiled)
    		}
	        //map.addLayer(tiled)
	        
	        
	        map.renderSync()
          
       
        }
        
        function population_function()
        {        
            var population_ckbox = document.getElementById("popcheckbox");
            var layers = map.getLayers().getArray();                          
            for(var i=layers.length-1;i>=0;i--)
                map.removeLayer(layers[i]); 
           
            if(population_ckbox.checked)
            {                       
               map.addLayer(population_layer);
            }
            else
            {             
                map.addLayer(untiled);
            }
           
            map.renderSync()          
        }
                
   //------------------------------------------------------------------------------------------------------------------------
  var dims = {
			a0 : [ 1189, 841 ],
			a1 : [ 841, 594 ],
			a2 : [ 594, 420 ],
			a3 : [ 420, 297 ],
			a4 : [ 297, 210 ],
			a5 : [ 210, 148 ]
		};

		var exportButton = document.getElementById('export-pdf');

		exportButton.addEventListener('click', function() {

			exportButton.disabled = true;
			document.body.style.cursor = 'progress';

			var format = document.getElementById('format').value;
			var resolution = document.getElementById('resolution').value;
			var dim = dims[format];
			//var width = Math.round(dim[0] * resolution / 25.4);
			//var height = Math.round(dim[1] * resolution / 25.4);
			//var size = /** @type {module:ol/size~Size} */
			//(map.getSize());
			//var extent = map.getView().calculateExtent(size);
			

			map.once('postcompose', function(event) {
				//alert("render complete")
				var canvas = event.context.canvas;
				var data = canvas.toDataURL('image/png');
				var pdf = new jsPDF('landscape', undefined, format);
				pdf.addImage(data, 'PDF', 0, 0, dim[0], dim[1]);
				pdf.save('map.pdf');
				
				/*
				// Reset original map size
				map.setSize(size);
				map.getView().fit(extent, {
					size : size
				});
				*/
				
				exportButton.disabled = false;
				document.body.style.cursor = 'auto';
				//map.renderSync();
			});

			
			/*
			// Set print size
			var printSize = [ width, height ];
			map.setSize(printSize);
			map.getView().fit(extent, {
				size : printSize
			});
			*/
			
			map.renderSync();

		}, false);
		//map.renderSync();
   </script>
</body>
</html>

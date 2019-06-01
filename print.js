
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

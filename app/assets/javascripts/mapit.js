function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof(window.onload) != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

var map;
var markersArray = [];
var infoArray = [];
var correctZoom = false;

function buildMapIt(map_div, points, options) {
  var map_type = options['map_type'] || google.maps.MapTypeId.ROADMAP;
  var label = options['labels'] || false;
  var zoom_level = options['zoom_level'] || 10;
  var map_type_control = options['map_type_control'] || true
    var map_type_control_options_style = (options['map_type_control_options']) ? options['map_type_control_options']['style'] || google.maps.MapTypeControlStyle.DEFAULT : google.maps.MapTypeControlStyle.DEFAULT;
  var myOptions = {
    zoom: zoom_level,
    center: points[0]["latlng"],
    mapTypeId: map_type,
    mapTypeControl: map_type_control,
    mapTypeControlOptions: {
      style: map_type_control_options_style
    }
  };
  map = new google.maps.Map(document.getElementById(map_div), myOptions); 
  addMarkersAndCenter(points, label);
  if(options['zoom_level']) {
    setCustomZoomLevel(zoom_level);
  }
}

function setCustomZoomLevel(zoom_level) {
  correctZoom = true;
  google.maps.event.addListener(map, 'zoom_changed', function() { 
    if ( map.getZoom() > zoom_level ) {
      if ( correctZoom ) {
        correctZoom = false;
        map.setZoom(zoom_level);
      }
    }
  });
}

function addMarkersAndCenter(points, label) {
  buildLatLng(points);
  buildMarkers(points, label)
    var bounds = findCenterPoint(points)
    map.fitBounds(bounds);
}

function buildLatLng(map_points) {
  for(i = 0; i < map_points.length; i++) {
    map_points[i]["latlng"] = new google.maps.LatLng(map_points[i]["latitude"],map_points[i]["longitude"]);
  }
}

function findCenterPoint(map_points) {
  bounds = new google.maps.LatLngBounds();
  for(i = 0; i < map_points.length; i++) {
    bounds.extend(map_points[i]["latlng"]);
  }
  return bounds
}

function buildMarkers(map_points, label) {
  for(i = 0; i < map_points.length; i++) {
    name = map_points[i]["info"];
    options = {
      position: map_points[i]["latlng"], 
      map: map,
      title: name,
      icon: addLabels(map_points[i], label),
      shadow: addShadows(map_points[i], label)
    }
    marker = new google.maps.Marker(options);
    addInfoWindow(name, marker, map_points[i]["id"], map);
    markersArray.push(marker);
  }
}

function deleteMarkers() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }
}

// Removes the overlays from the map, but keeps them in the array
function clearMarkers() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(null);
    }
  }
}

// Shows any overlays currently in the array
function showMarkers() {
  if (markersArray) {
    for (i in markersArray) {
      markersArray[i].setMap(map);
    }
  }
}


function addLabels(map_point, label) {
  if (label == true) {
    url = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+ map_point["letter"] +"|f97569|000000",
        new google.maps.Size(20, 34),
        new google.maps.Point(0, 0),
        new google.maps.Point(10, 34)
        );
  } else {
    url = null
  }
  return url
}

function addShadows(map_point, label) {
  if (label == true) {
    url = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
        new google.maps.Size(40, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(10, 37)
        );
  } else {
    url = null
  }
  return url
}

function addInfoWindow(name, marker, id, map) {
  var infowindow_id = "infoWindow_" + id;
  eval(infowindow_id + "= function() { closeInfoWindows(); infowindow = new google.maps.InfoWindow({content: name}); infoArray.push(infowindow); infowindow.open(map, marker); }" );
  google.maps.event.addListener(marker, "click", infowindow_id );
}

function closeInfoWindows() {
  if (infoArray) {
    for (i in infoArray) {
      infoArray[i].close();
    }
  }
}

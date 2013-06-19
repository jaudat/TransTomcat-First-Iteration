// https://mathlab.utsc.utoronto.ca/courses/cscc09f12/syedjaud/

serviceURL_route="https://mathlab.utsc.utoronto.ca/courses/cscc09f12/syedjaud/A1/routes.cgi?term=";
serviceURL_run="http:www.utsc.utoronto.ca/~rosselet/cscc09f12/asn/services/getruns.php?id=";
serviceURL_stop="http://www.utsc.utoronto.ca/~rosselet/cscc09f12/asn/services/getstops.php"
serviceURL_predict = "http://www.utsc.utoronto.ca/~rosselet/cscc09f12/asn/services/getpredictions.php?id="

$('#all_routes').live('pageinit', function(event){
	$.getJSON(serviceURL_route,getRoutes);
});

function getRoutes(data){
  disp_route=data.items;
  $('#list_routes').empty();
  $.each(disp_route, function(key,value) {
    $('#list_routes').append('<li><a href="#route_runs" data-transition=\"slide\" class="btn runs" id="'+value.tag+'">' + value.title + '</a></li>');
  });
  $('#list_routes').listview('refresh');
}

$('a.runs').live("click", function(event) {
  var tag = $(this).attr('id');   
  $.getJSON(serviceURL_run+tag,getRuns); 
}); 

function getRuns(data){
  disp_branches=data.items;
  $('#runName').html("Route "+disp_branches[1].route_id)
  $('#list_runs').empty();
  $.each(disp_branches, function(key,value) {
    var createID = '?routeid='+value.route_id+'&runid='+value.id
    $('#list_runs').append('<li><a href="#run_stops" data-transition=\"slide\" class="btn stops" id="'+createID+'" route=\"'+value.route_id+'\" pole=\"'+value.direction_name+'\">'+value.display_name+'</a></li>');
  });
  $('#list_runs').listview('refresh'); 
}

$('a.stops').live("click", function(event) {
  var tag = $(this).attr('id');
  window['routez'] = $(this).attr('route');
  var pole = $(this).attr('pole');
  $('#stopName').html('Route'+' '+routez+' '+pole)
  $.getJSON(serviceURL_stop+tag,getStops); 
}); 

function getStops(data) {
  disp_stops=data.items;
  $('#list_stops').empty();
  $.each(disp_stops, function(key,value) {
    $('#list_stops').append('<li><label>'+value.display_name+'</label> <br/> <div class="ui-btn-left"><a href="#" class=\"btn save\" id=\"'+value.id+'\" stname=\"'+value.display_name+'\" stlong=\"'+value.longitude+'\" stlat=\"'+value.latitude+'\" branch=\"'+window.routez+'\" data-role="button" data-icon="star">Save</a></div><div class="ui-btn-right"><a data-transition=\"slide\" href="#stop_predictions" data-role="button" class="btn predict" id=\"'+value.id+' \" data-icon=\"arrow-r\">Predict Arrivals</a></div></li>'); 
  });
  $('#list_stops').listview('refresh'); 
  $('a.save').button();
  $('a.predict').button();
}

$('a.predict').live("click", function(event) {
  var tag = $(this).attr('id');
  $.getJSON(serviceURL_predict+tag,getPredictions); 
}); 

function getPredictions(data) {
  disp_predictions=data.items;
  $('#list_predictions').empty();
  $.each(disp_predictions, function(key,value) {
    $('#list_predictions').append('<li><label>'+value.minutes+' minutes</label><font color=\"grey\"> '+value.run_id+'</font></li>'); 
  });
  $('#list_predictions').listview('refresh');
}

$('a.save').live("click",function(event) {
  var stopID = $(this).attr('id');
  var stopName = $(this).attr('stname');
  var stopLat = $(this).attr('stlat');
  var stopLong = $(this).attr('stlong');
  var routeID = $(this).attr('branch');

  var localD = getLocalDict('savedstops')
  if (stopID != null) {
    localD[stopID] = [stopName, routeID, stopLat, stopLong]
    localStorage['savedstops'] = JSON.stringify(localD);
  }
  //redirect to someplace else
  });

function getLocalDict(key) {
  var localD = localStorage[key];
  if (localD == null) {
    localD = {}; //return empty localD
  }
  else {
    localD = JSON.parse(localD); //retrieve the id in JSON format from //local storage
  };
  return localD;
}

$('#saved_stops').live('pageshow',function(event) {
  getSaves();
}); 

function getSaves() {
  console.log("entered getSaves");
  $('#list_saves').empty();
  var localD = getLocalDict('savedstops')
  var keyz=[];
  for (var key in localD) {
    if (localD.hasOwnProperty(key)) {
      keyz.push(key);
    }
  }
  console.log(keyz);
  $.each(keyz, function(key, value) {
     $('#list_saves').append('<li><label>'+localD[value][0]+'</label><br/><div class="ui-btn-left"><a data-transition=\"slide\" href="#stop_predictions" data-role="button" class="btn predict" data-icon="arrow-r" id=\"'+value+' \">Predictions</a></div><div class="ui-btn-left"><a href=\"#\" data-icon=\"delete\" data-theme=\"b\" class=\"btn delete\" data-role=\"button\" id=\"'+value+'\">delete</a></div></li>')
  });
  $('#list_saves').listview('refresh');
  $('a.predict').button();
  $('a.delete').button();
}

$('a.delete').live("click", function(event) {
  var key=$(this).attr('id');
  var localD = getLocalDict('savedstops')
  delete localD[key]
  localStorage['savedstops'] = JSON.stringify(localD);
  //now update the UI
  $(this).closest('li.ui-li').remove();
  $('#list_saves').listview('refresh');
})

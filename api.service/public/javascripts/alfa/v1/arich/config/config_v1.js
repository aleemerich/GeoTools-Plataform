var ARICH=ARICH||{};ARICH.config=function(){var _params={};return{load:function(e){for(var t=0;t<e.length;t++){ARICH.config.set(e[t]["name"],e[t]["value"])}},get:function(param){try{var result=eval(_params[param]);return result}catch(e){console.log("[ARICH.config.get] Erro ao buscar o valor para o parâmetro '"+param+"'. Erro: "+e.message);return null}},set:function(e,t){var n={};n[e]=t;if(!ARICH.helper.hashtable.exist([_params],n)){_params[e]=t}},params:_params}}()
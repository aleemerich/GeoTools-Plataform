var ARICH=ARICH||{};ARICH.initialize=function(){ARICH.config.set("sys_timeout_beforeExecute",1e3);ARICH.config.set("sys_attempts_beforeExecute",100);ARICH.queue.load([{id:0,script_ids:"[1]",key_action:"['before_inicialize_config']",name:"getConfig",description:"Obtendo configurações remotas e a fila do servidor",order:0},{id:1,key_action:"['before_inicialize_queue']",name:"getQueue",description:"Obtendo configurações remotas e a fila do servidor",order:0}],"scripts");ARICH.queue.load([{id:0,script_id:0,function_exec:"ARICH.helper.ajax",description:"Solicita ao servidor as configurações do sistema",params:'({remote_element: "settings", remote_action: "all", function_return: "ARICH.composer.afterScript"})',order:0,remote:true},{id:1,script_id:1,function_exec:"ARICH.helper.ajax",description:"Solicita ao servidor os scripts agregadores",params:'({remote_element: "scripts", remote_action: "all", function_return:"ARICH.composer.afterScript"})',order:0,remote:true},{id:2,script_id:1,function_exec:"ARICH.helper.ajax",description:"Solicita ao servidor os itens da fila (detalhes dos scripts)",params:'({remote_element: "script_details",remote_action: "all", function_return: "ARICH.composer.afterScript"})',order:0,remote:true},{id:3,script_id:0,function_exec:"ARICH.config.load",description:"Lê os dados vindos do servidor e carrega o CONFIG",params:"%%0%%",order:1,remote:false},{id:4,script_id:1,function_exec:"ARICH.queue.load",description:"Lê os dados vindos do servidor e carrega os SCRIPTS",params:'%%1%%|"scripts"',order:1,remote:false},{id:5,script_id:1,function_exec:"ARICH.queue.load",description:"Lê os dados vindos do servidor e carrega a FILA",params:'%%2%%|"details"',order:1,remote:false}],"details");ARICH.composer.beforeScript("before_inicialize_config");ARICH.composer.beforeScript("create_modal");ARICH.composer.beforeScript("before_authentication")}
/*
ORDEN DE EJECUCION DE UNA QUERY

En SQL no se ejecuta la query tal cual la codeamos, esto quiere decir que, si bien la sintaxis debe respetarse,
a la hora de estructurar la query sql lo ejectua de forma distintal.

*/

select
	store,
	sum(quantity)
from
	stg.order_line_sale s
where
	1 = 1
group by
	store
having
	sum(quantity) > 36300
limit
	10000;
	
/*

Aunque nuestra query comienza con el select y termina, en este caso, con el having, sql lo ejectura de la siguiente manera

Obtener datos               (from / join) -> primer paso
Filtrar las filas           (where) -> segundo paso
Agrupar                     (group by) -> tercero paso
Filtrar los grupos          (having) -> cuarto paso
Devolver el resultado       (select) -> quinto paso
Ordenar                     (order by) -> sexto paso
Limitar resultados visibles (select) -> quinto paso

Como es sabido, solo el select, las columnas y la base de donde se extraen los resultados, son obligatorios, pero aunque no estuviese
se respeteria de igual forma este orden de ejecucion. Observemos la siguiente query

*/


select
	order_number o
from
	stg.order_line_sale
where
	o = 'M20220002323'
	
/*

Esta columna genera error durante la ejecucion, debido a que el where es el segundo paso de ejecucion y en el select
todavia no se establecio un alias para la columna.

*/

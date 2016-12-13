/**
 * BlogCalendar-Tpl
 *
 * items tpl for Blog Calendar archive based on DocCalendar
 *
 * @category	chunk
 * @internal @modx_category DocCalendar
 */
{ 
					id: '[+id+]',
					title: '[+title+]',
					description:'<p>[+description+]</p>',
					sourceurl: '[~[*id*]~]',
					url: '[~[+id+]~]',
					start: '[+date+]',
                    end: ''
},
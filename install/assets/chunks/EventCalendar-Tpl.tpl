/**
 * EventCalendar-Tpl
 *
 * items tpl for Event Calendar based on DocCalendar
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
					start: '[+Event-Start-Date+]',
                    end: ''
},
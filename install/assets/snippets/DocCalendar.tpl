/**
 * DocCalendar
 *
 * Documents Calendar for Doclister
 * @version   1.3
 * @author      Author: Nicola Lambathakis http://www.tattoocms.it/
 *
 * @category	snippet
 * @internal	@modx_category DocCalendar
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 */
<?php
<?php
if(!defined('MODX_BASE_PATH')){die('What are you doing? Get out of here!');}
$jQuery = isset($jQuery) ? $jQuery : '1';
$LoadAssets = isset($LoadAssets) ? $LoadAssets : '1';

$locale = isset($locale) ? $locale : 'en-gb'; // en, es, de, it, etc.
$views = isset($views) ? $views : 'month,listMonth,listYear'; // basicDay, agendaDay, listDay, basicWeek, agendaWeek, listWeek, month, listMonth, listYear
$defaultView = isset($defaultView) ? $defaultView : 'month';
$headerButtons = isset($headerButtons) ? $headerButtons : 'prev,next'; //prev,next today
$basicDaytext = isset($basicDaytext) ? $basicDaytext : 'Today';
$agendaDaytext = isset($agendaDaytext) ? $agendaDaytext : 'Day Agenda';
$listDaytext = isset($listDaytext) ? $listDaytext : 'Day List';
$basicWeektext = isset($basicWeektext) ? $basicWeektext : 'Week';
$agendaWeektext = isset($agendaWeektext) ? $agendaWeektext : 'Week Agenda';
$listWeektext = isset($listWeektext) ? $listWeektext : 'Week List';
$monthtext = isset($monthtext) ? $monthtext : 'Month';
$listMonthtext = isset($listMonthtext) ? $listMonthtext : 'Month List';
$listYeartext = isset($listYeartext) ? $listYeartext : 'Year List';
$dow = isset($dow) ? $dow : '1, 2, 3, 4, 5, 6, 7'; // days of week. an array of zero-based day of week integers (0=Sunday)
$startTime = isset($startTime) ? $startTime : '08:00'; // a start time (10am in this example)
$endTime = isset($endTime) ? $endTime : '21:30';// an end time (6pm in this example)
$minTime = isset($minTime) ? $minTime : '08:00:00';
$maxTime = isset($maxTime) ? $maxTime : '22:30:00';
$navLinks = isset($navLinks) ? $navLinks : 'false';
$eventLimit = isset($eventLimit) ? $eventLimit : 'true';
$editable = isset($editable) ? $editable : 'false';
$calID = isset($calID) ? $calID : 'DocCalendar';
$Modal = isset($Modal) ? $Modal : '1';
$ModalTpl = isset($ModalTpl) ? $ModalTpl : 'Modal-DocCalendar';

if($ModalTpl == ''){
$BSModalTpl = '<div id="fullCalModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"></span> <span class="sr-only">close</span></button>
                    <h4 id="modalTitle" class="modal-title"></h4>
                </div>
				<div id="description" class=""></div>
				<div id="modalBody" class="modal-body"></div>
				<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <a class="btn btn-primary" id="eventUrl">Read More</a>
                </div>
            </div>
        </div>
    </div>
';
}

else {
	$BSModalTpl = $modx->getChunk(''.$ModalTpl.'');
	}
$customModalparams = isset($customModalparams) ? $customModalparams : '';
$tpl = isset($tpl) ? $tpl : 'DocCalendar-Tpl';
$parents = isset($parents) ? $parents : '';
$display = isset($display) ? $display : '0';
$summary = isset($summary) ? $summary : '';
$tvList = isset($tvList) ? $tvList : '';
$tvPrefix = isset($tvPrefix) ? $tvPrefix : '';
$dateSource = isset($dateSource) ? $dateSource : 'pub_date';
$dateFormat = isset($dateFormat) ? $dateFormat : '%d %b %Y %H:%M:%S'; //dont change it
$depth = isset($depth) ? $depth : '2';
$debug = isset($debug) ? $debug : '0';
$filters = isset($filters) ? $filters : '';
$showParent = isset($showParent) ? $showParent : '0';
$showNoPublish = isset($showNoPublish) ? $showNoPublish : '';
$addWhereList = isset($addWhereList) ? $addWhereList : '';
// DL params
$params['parents'] = $parents;
$params['display'] = $display;
$params['tvList'] = $tvList;
$params['renderTV'] = $renderTV;
$params['tvPrefix'] = $tvPrefix;
$params['summary'] = $summary;
$params['dateSource'] = $dateSource;
$params['dateFormat'] = $dateFormat;
$params['depth'] = $depth;
$params['debug'] = $debug;
$params['filters'] = $filters;
$params['sortBy'] = 'createdon';
$params['sortDir'] = 'DESC';
$params['tpl'] = $tpl;
$params['total'] = $total;
$params['showParent'] = $showParent;
$params['showNoPublish'] = $showNoPublish;
$params['addWhereList'] = $addWhereList;
$params['paginate'] = '0';
// run Doclister Snippet
$DLCalendarList = $modx->runSnippet('DocLister', $params);
$caloutput .='<div id="'.$calID.'"></div>';
if($Modal == "1"){
$caloutput .=''.$BSModalTpl.'';
}
if($LoadAssets == "1"){
$cssoutput='
<link rel="stylesheet" href="assets/snippets/DocCalendar/fullcalendar/fullcalendar.css" />';
}
if($LoadAssets == "1"){
if($jQuery == "1"){
$scriptoutput .='
<script src="assets/snippets/DocCalendar/fullcalendar/lib/jquery.min.js"></script>';
}
$scriptoutput .='
<script src="assets/snippets/DocCalendar/fullcalendar/lib/moment.min.js"></script>
<script src="assets/snippets/DocCalendar/fullcalendar/fullcalendar.min.js"></script>
<script src="assets/snippets/DocCalendar/fullcalendar/locale/'.$locale.'.js"></script>';
}
$scriptoutput .='
<script>
var $j = jQuery.noConflict();
$j(document).ready(function() {
	$j(\'#'.$calID.'\').fullCalendar({
			header: {
				left: \''.$headerButtons.'\',
				center: \'title\',
				right: \''.$views.'\'
			},
			businessHours: {
    		// days of week. an array of zero-based day of week integers (0=Sunday)
   				dow: [ '.$dow.' ], // Monday - Thursday
    			start: \''.$startTime.'\', // a start time (10am in this example)
    			end: \''.$endTime.'\' // an end time (6pm in this example)
			},

						// customize the button names,
			// otherwise they\'d all just say list
			views: {
				basicDay: { buttonText: \''.$basicDaytext.'\' },
				agendaDay: { buttonText: \''.$agendaDaytext.'\' },
				listDay: { buttonText: \''.$listDaytext.'\' },
				basicWeek: { buttonText: \''.$basicWeektext.'\' },
				agendaWeek: { buttonText: \''.$agendaWeektext.'\' },
				listWeek: { buttonText: \''.$listWeektext.'\' },
				month: { buttonText: \''.$monthtext.'\' },
				listMonth: { buttonText: \''.$listMonthtext.'\' },
				listYear: { buttonText: \''.$listYeartext.'\' }
			},
			defaultView: \''.$defaultView.'\',
        	minTime: \''.$minTime.'\',
        	maxTime: \''.$maxTime.'\',
			navLinks: '.$navLinks.', // can click day/week names to navigate views
			editable: '.$editable.',
			eventLimit: '.$eventLimit.', // allow more link when too many events
			';	
	//modal
	if($Modal == "1"){
			$scriptoutput .='eventClick:  function(event, jsEvent, view) {
					$(\'#modalDocId\').text(event.id);
                    $(\'#modalTitle\').html(event.title);
                    $(\'#modalBody\').html(event.description);
                    $(\'#eventUrl\').attr(\'href\',event.url);
                    $(\'#sourceurl\').text(event.sourceurl);
                    $(\'#fullCalModal\').modal();
					'.$customModalparams.'
				return false;
                },
	';
} //end modal		
		
$scriptoutput .='events: [
				'.$DLCalendarList.'
			],
		});
		
	});
</script>';
$modx->regClientCss( $cssoutput );
$modx->regClientScript( $scriptoutput );
$output = $caloutput;
return $output;
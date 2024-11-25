/**
 * Modal-DocCalendar
 *
 * sample tpl for DocCalendar Bootstrap Modal
 *
 * @category	chunk
 * @internal @modx_category DocCalendar
 */
<div id="fullCalModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
					<h4 id="modalTitle" class="modal-title"></h4>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>                    
                </div>
				<div id="description" class=""></div>
				<div id="modalBody" class="modal-body"></div>
				<div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                <a class="btn btn-primary" id="eventUrl">Read </a>
                </div>
            </div>
        </div>
</div>
<div class="panel panel-primary" id="main">
    <div class="panel-body" id="content">
        <h1 class="pageTitle">
            <a href="$base$$pageUrl$">$pagetitle$</a>
            $if(revision)$
                <small class="revision">Revision $revision$</small>
            $endif$
        </h1>
        $if(messages)$
            <div class="messages">
                $messages:message()$
            </div>
        $endif$
        $content$
    </div>
</div>

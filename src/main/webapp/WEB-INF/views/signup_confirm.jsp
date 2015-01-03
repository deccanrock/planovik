<%@ include file="header.jsp" %>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="page-content">

        <div class="widget-box" style="width:70%; margin-top:4%;margin-left:10%">
        <div class="widget-header widget-header-flat">
            <h4 class="widget-title smaller">
               We have received your information
            </h4>
            <div class="widget-title smaller" style="margin-left:30px;">
	            <span style="color:#000;">Registration Number: </span> <span>${org.orgid}</span>
       		</div>
        </div>
        <div class="widget-body">
        <div class="widget-main">
        <!-- #section:plugins/fuelux.wizard -->
        <div id="fuelux-wizard" data-target="#step-container" style="width:95%;margin-top:20px;">
            <!-- #section:plugins/fuelux.wizard.steps -->
            <ul class="wizard-steps">
                <li data-target="#step1" class="active">
                    <span class="step">1</span>
                    <span class="title">Registration Started</span>
                </li>

                <li data-target="#step2">
                    <span class="step">2</span>
                    <span class="title">Verification Completed</span>
                </li>

                <li data-target="#step3">
                    <span class="step">3</span>
                    <span class="title">Credentials Issued</span>
                </li>

                <li data-target="#step4">
                    <span class="step">4</span>
                    <span class="title">Start Verification</span>
                </li>
            </ul>

            <!-- /section:plugins/fuelux.wizard.steps -->
        </div>

        <hr />

            <div class="row">
                <div class="col-xs-12">
                    <blockquote>
                        <p class="lighter line-height-125">
                            Welcome and Thank you for sharing your contact details!<br /><br />
                            We will contact you shortly to help complete registration process and get you on board.
                        </p>
                    </blockquote>
                </div>
            </div>
            <hr />

            <div class="row">
                <div class="col-xs-3">
                    <address>
                        <strong>Organization</strong>
                        <br />
                        <span style="color:#669FC7">${org.name}</span>
                    </address>
                </div>
                <div class="col-xs-2">
                    <address>
                        <strong>Full Name</strong>
                        <br />
                        <span style="color:#669FC7">${org.contacttitle} ${org.contactfname} ${org.contactlname}</span>
                    </address>
                </div>
                <div class="col-xs-3">
                    <address>
                        <strong>Official Email</strong>
                        <br />
                        <span style="color:#669FC7">${org.contactemail}</span>
                    </address>
                </div>
                <div class="col-xs-2">
                    <address>
                        <strong>Official Designation</strong>
                        <br />
                        <span style="color:#669FC7">${org.contactdesignation}</span>
                    </address>
                </div>
                <div class="col-xs-2">
                    <address>
                        <strong>Phone Number</strong>
                        <br />
                        <span style="color:#669FC7">${org.contactphone}</span>
                    </address>
                </div>

            </div>
        </div>
        </div>
    </div>
        </div>
    </div>

<%@ include file="footer.jsp" %>

</div>

</body>
</html>
<script type="text/javascript">
/* <![CDATA[ */
  \$.get("$base$/_user", {}, function(username, status) {
     if (username == "") {  // nobody logged in
        \$(".registerlink").removeClass('hide');
        \$(".loginlink").removeClass('hide');
        \$(".logoutlink").addClass('hide');
     } else {
        \$(".logged_in_user").text(username);
        \$(".registerlink").addClass('hide');
        \$(".loginlink").addClass('hide');
        \$(".logoutlink").removeClass('hide');
     };
   });
/* ]]> */
</script>

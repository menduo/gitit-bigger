<script type="text/javascript">
/* <![CDATA[ */
  \$.get("$base$/_user", {}, function(username, status) {
     \$(".logged_in_user").text(username);
     if (username == "") {  // nobody logged in
        \$(".registerlink").show();
        \$(".loginlink").show();
        \$(".logoutlink").hide();
     } else {
        \$(".registerlink").hide();
        \$(".loginlink").hide();
        \$(".logoutlink").show();
     };
   });
/* ]]> */
</script>

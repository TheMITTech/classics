<html>
<head>
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<title>We're Sorry</title>
</head>
<body onload="doIt();" style="width:50%">
<h1>This service is not offered anymore</h1>
<p>The Internet Classics Archive no longer offers comments on its texts.
We apologize for any inconvenience.</p>
<?php if($_SERVER['HTTP_HOST'] == 'classics.mit.edu' && isset($_SERVER['HTTP_REFERER'])) { ?>
<a href="<?=$_SERVER['HTTP_REFERER']?>">Go back.</a>
<?php } else { ?> 
<script language="javascript">
<!--
document.write("<a href='javascript:history.go(-1)'>Go Back</a>");
//--!>
</script>
<?php } ?>
<hr>
<p>
The <a href="/">Internet Classics Archive</a> is a service provided by
<a href="http://tech.mit.edu/">The Tech</a>, MIT's student newspaper.
</p>
</body>
</html>

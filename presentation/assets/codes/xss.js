function validate(e){for(e=unescape(e),old="";old!==e;)e=(e=(old=e).replace("<script>","")).replace("<\/script>","");return e}

console.log("1 : "+decodeURI(validate("<script>")));
console.log("2 : "+decodeURI(validate("<scr<script>ipt>")));
console.log("3 : "+decodeURI(validate("%3Cscript>")));
console.log("4 : "+decodeURI(validate("%<script>3Cscript>")));

var root = "/kbopark";
var control = "";

function moveWrite(tno) {
	document.getElementById("cact").value = "mvwrite";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = "1";
	document.getElementById("ckey").value = "";
	document.getElementById("cword").value = "";
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function listArticle(tno, pg, key, word) {
	document.getElementById("cact").value = "listarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function viewArticle(tno, pg, key, word, seq) {
	document.getElementById("cact").value = "viewarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function prevArticle(tno, pg, key, word, seq) {
	document.getElementById("cact").value = "prevarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function nextArticle(tno, pg, key, word, seq) {
	document.getElementById("cact").value = "nextarticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function movemodify(tno, pg, key, word, seq) {
	document.getElementById("cact").value = "movemodify";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = "";
	document.getElementById("cword").value = "";
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function deletearticle(tno, pg, seq) {
	document.getElementById("cact").value = "deletearticle";
	document.getElementById("ctno").value = tno;
	document.getElementById("cpg").value = pg;
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}
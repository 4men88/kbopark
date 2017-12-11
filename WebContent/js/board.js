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
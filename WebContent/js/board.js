var root = "/kbopark";
var control = "";

function moveWrite() {
	document.getElementById("cact").value = "mvwrite";
	document.getElementById("cpg").value = "1";
	document.getElementById("ckey").value = "";
	document.getElementById("cword").value = "";
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function listArticle(pg, key, word) {
	document.getElementById("cact").value = "listarticle";
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}

function viewArticle(pg, key, word, seq) {
	document.getElementById("cact").value = "viewarticle";
	document.getElementById("cpg").value = pg;
	document.getElementById("ckey").value = key;
	document.getElementById("cword").value = word;
	document.getElementById("cseq").value = seq;
	
	document.getElementById("commonForm").action = root + control;
	document.getElementById("commonForm").submit();
}
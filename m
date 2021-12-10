Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310ECC433F5
	for <ath10k@archiver.kernel.org>; Fri, 10 Dec 2021 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:From:
	Date:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DPrdAub7QLurNsxOnp2LjT6P4C3mC8QDuBujoH9gGLE=; b=V/+w8bOz5LEQR8
	Ylg9H/53xjGroNyAcfeMACYxNRmxfCjW8isTs63JijqLIh4O+QGZuuM6GpWGzMjED7FwGxPpuhPWr
	ndkRXX7MCP6hoLy08aytxM9r4XNn4xdO3WqAxIuj8ImmYiUsC9lbL2Y2Nxsz15kAHcUXXyyAYeW2H
	9FIawnfuWdjV8Vrm4kHXskY03BTFHmyoaJSvWT/m13DHBxoNfw+bsW9GRVwhkHUPklu5arh8z8x5k
	AmaoiTG0mwcUB82izUkbig93TXQgofPb3i8slC5084m0VJR9eQbJax1bq4RCAY663KZeHcg1UymrH
	L7043L2BHsihGcNawjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlWG-003WSs-KI; Fri, 10 Dec 2021 19:25:24 +0000
Received: from tk2-244-31533.vs.sakura.ne.jp ([160.16.204.37])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvlDV-003OL8-1W
 for ath10k@lists.infradead.org; Fri, 10 Dec 2021 19:06:02 +0000
Received: by tk2-244-31533.vs.sakura.ne.jp (Postfix, from userid 996)
 id 8844E9EBC; Sat, 11 Dec 2021 03:57:55 +0900 (JST)
To: ath10k@lists.infradead.org
Subject: =?UTF-8?B?44CQ55WZ5a2m44OV44Kn44Ot44O844K344OD44OX44CR44GK5ZWP44GE5ZCI?=
 =?UTF-8?B?44KP44Gb5a6M5LqG44Gu44GU5qGI5YaF?=
Date: Fri, 10 Dec 2021 18:57:55 +0000
From: =?UTF-8?B?55WZ5a2m44OV44Kn44Ot44O844K344OD44OX?= <info@ryu-fellow.org>
Message-ID: <afeab915eb24e3bad4dc178d2252e7aa@ryu-fellow.org>
X-Mailer: PHPMailer 5.2.27 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_110601_222092_53BC8E8B 
X-CRM114-Status: UNSURE (   0.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: info@ryu-fellow.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

4p2k77iPIE1hcmlhIGxpa2VkIHlvdSEgQ2xpY2sgSGVyZTogaHR0cDovL2JpdC5kby9mU1A4bz9x
aTR3IOKdpO+4jyDmp5gKCuOBiuWVj+OBhOWQiOOCj+OBm+OBhOOBn+OBoOOBjeOBvuOBl+OBpuOA
geiqoOOBq+OBguOCiuOBjOOBqOOBhuOBlOOBluOBhOOBvuOBmeOAggrkuIvoqJjjga7lhoXlrrnj
gavjgabjgYrllY/jgYTlkIjjgo/jgZvjgpLjgYrlj5fjgZHjgYTjgZ/jgZfjgb7jgZfjgZ/jgILm
lLnjgoHjgabmi4XlvZPogIXjgojjgorjgZTpgKPntaHjgYTjgZ/jgZfjgb7jgZnjgIIK44KC44GX
5pWw5pel5Lit44Gr6L+U5LqL44GM44Gq44GE5aC05ZCI44Gv44CB5q2j44GX44GP5Y+X5L+h44GM
44Gn44GN44Gq44GL44Gj44Gf5Y+v6IO95oCn44GM44GC44KK44G+44GZ44CC5oGQ44KM5YWl44KK
44G+44GZ44GM44CBaW5mb0ByeXUtZmVsbG93Lm9yZ+OBvuOBp+WGjeW6puOBruOBlOmAo+e1oeOC
kuOBiumhmOOBhOOBhOOBn+OBl+OBvuOBmeOAggoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQoK4pa844GK5ZWP44GE5ZCI44KP44Gb56iu5YilCuOBneOBruS7luOBruOB
iuWVj+OBhOWQiOOCj+OBmwoK4pa844GK5ZCN5YmNCuKdpO+4jyBNYXJpYSBsaWtlZCB5b3UhIENs
aWNrIEhlcmU6IGh0dHA6Ly9iaXQuZG8vZlNQOG8/cWk0dyDinaTvuI8KCuKWvOaJgOWxngoxc3Vu
czduCgrilrzjg6Hjg7zjg6vjgqLjg4njg6zjgrkKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
CuKWvOOBiuWVj+OBhOWQiOOCj+OBm+WGheWuuQo0bHBhdWlwCgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCgrigLvjgZPjga7jg6Hjg7zjg6vjga/oh6rli5Xov5Tkv6Hj
g6Hjg7zjg6vjgajjgarjgorjgb7jgZnjgIIKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KCueJueWumumdnuWWtuWIqea0u+WLleazleS6uiDjgrDjg63jg7zjg5Djg6vj
garlrabjgbPjga7jgrPjg5/jg6Xjg4vjg4bjgqPjg7vnlZnlrabjg5Xjgqfjg63jg7zjgrfjg4Pj
g5cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

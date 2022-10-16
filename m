Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A13C4332F
	for <ath10k@archiver.kernel.org>; Sun, 16 Oct 2022 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:From:To
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTiOy9jwrM8spzkc5uWFJuV/8LdIadFXp42fIyvtyq0=; b=gykwYi+W0FqbXl
	ymAEiIj6dcqBmi3gFwlAoKw0p3K0dTeBIm8+xqFRXLIBvHuiPEmAp1rjZvzZSvTNN1gQ4M85nsBKm
	3HcwkCIlG7/Mwj2FE8htdkPzZTCRcF5ZOMw4S0Jj4Ty0mlV1Pk2CJ8ZDTgMPQojeCXzXp5CQLaNSv
	mPKsXedPvFdqADp4m5d4fU7MQXEumQq2DRWhpZTlq1wnsjcRFiT2XoYXTFCKzfahALwoqc9gQthk1
	5YNdO9NnqBy2My7xg5hbrPOpTm/iZ7mYDbcW9VT3dA2kxEWu0c5IFkbVtIdlwFPjEkNhUMmp50bb9
	5VvDXmT8LsoveJFy0Kfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojxrC-000hsy-HI; Sun, 16 Oct 2022 07:14:46 +0000
Received: from mwb-bld-mts-003c1.ocn.ad.jp ([153.128.188.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojxr7-000hr3-Ap
	for ath10k@lists.infradead.org; Sun, 16 Oct 2022 07:14:45 +0000
Received: from cmn-spm-mts-006c1.ocn.ad.jp (cmn-spm-mts-006c1.ocn.ad.jp [153.153.67.160])
	by mwb-bld-mts-003c1.ocn.ad.jp (Postfix) with ESMTP id 17D293C000A88
	for <ath10k@lists.infradead.org>; Sun, 16 Oct 2022 16:14:13 +0900 (JST)
Received: from mwb-vc-mts-003c1.ocn.ad.jp ([153.153.67.72])
	by cmn-spm-mts-006c1.ocn.ad.jp with ESMTP
	id jxqfoOQ6AWDWajxqfoRxnQ; Sun, 16 Oct 2022 16:14:13 +0900
X-BIZ-RELAY: yes
Received: from mwb-sdgw-mts-003c1.ocn.ad.jp ([122.28.88.78])
	by mwb-vc-mts-003c1.ocn.ad.jp with ESMTP
	id jxqfo0vRx6Jgujxqfo7VbG; Sun, 16 Oct 2022 16:14:13 +0900
Received: from sisiku.com (sisiku.com [61.112.14.202])
	by mwb-sdgw-mts-003c1.ocn.ad.jp (Postfix) with ESMTP id EF771800023B
	for <ath10k@lists.infradead.org>; Sun, 16 Oct 2022 16:14:12 +0900 (JST)
Received: from www.sisiku.com (www3576.sakura.ne.jp [49.212.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by sisiku.com (Postfix) with ESMTPSA id B72A1127B04
	for <ath10k@lists.infradead.org>; Sun, 16 Oct 2022 16:14:14 +0900 (JST)
Date: Sun, 16 Oct 2022 07:14:12 +0000
To: ath10k@lists.infradead.org
From: =?UTF-8?B?44K344K344Kv44Ki44OJ44Kv44Op44Kk44K55qCq5byP5Lya56S+?= <info@sisiku.com>
Subject: =?UTF-8?B?44GK5ZWP44GE5ZCI44KP44Gb?=
Message-ID: <0l2Nf1vpL2MJr9zt8g7XqGZnkFrEUDYJ8FFeAv711sI@www.sisiku.com>
X-Mailer: WPMailSMTP/Mailer/smtp 2.8.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_001441_533697_8A925C87 
X-CRM114-Status: UNSURE (   2.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

77u/8J+SmyBBbGljZSB3YW50IHRvIG1lZXQgeW91ISBDTElDSyBIRVJFOiBodHRwOi8vZWR3aW5j
cmVhdGlvbi5jb20vdXBsb2Fkcy9nby5waHA/eTlxdCDwn5Ka5qeYCgrjgYrllY/jgYTlkIjjgo/j
gZvjgYLjgorjgYzjgajjgYbjgZTjgZbjgYTjgb7jgZnjgIIK44GK5ZWP44GE5ZCI44KP44Gb5YaF
5a6544Gr44Gk44GN44G+44GX44Gm44Gv44CB5Yil6YCU44CB5Za25qWt5ouF5b2T6ICF44GM44GU
6L+U562U44GE44Gf44GX44G+44GZCuOAggoK44OL44Ol44O844K544Oh44O844Or6LO86Kqt77ya
IOW4jOacm+OBl+OBquOBhAoK44GK5ZCN5YmN77yaIO+7v/CfkpsgQWxpY2Ugd2FudCB0byBtZWV0
IHlvdSEgQ0xJQ0sgSEVSRTogaHR0cDovL2Vkd2luY3JlYXRpb24uY29tL3VwbG9hZHMvZ28ucGhw
P3k5cXQg8J+Smgrjg5Xjg6rjgqzjg4rvvJogYWRncmxnCuS8muekvuWQje+8miAyYng2NWIK5Lya
56S+5ZCN77yI44OV44Oq44Ks44OK77yJ77yaIDY4ZHA1bQrpg6jnvbLvvJogN3piMm91CuW9ueiB
t++8miAzMGF0ankK6YO15L6/55Wq5Y+377yaMDY2MTQK44GU5L2P5omA77yaIGNlMGVvNArjgYrp
m7voqbHnlarlj7fvvJogOTg5ODE1MzYwMDQxCkZBWOeVquWPt++8miA5ODk4MTUzNjAwNDEK44Oh
44O844Or44Ki44OJ44Os44K577yaIGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCuOBiuWVj+OB
hOWQiOOCj+OBm+WGheWuue+8miAKcTdhNHRmCgrjgZTkuI3mmI7jgarngrnjgYzjgYLjgorjgb7j
gZfjgZ/jgonjgIHkuIvoqJjjgb7jgafjgYrllY/jgYTlkIjjgo/jgZvjgY/jgaDjgZXjgYTjgIIK
CioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCuOCt+OCt+OCr1NJU0lLVeOCouODieOCr+ODqeOCpOOCueagquW8j+S8muekvgrjgJI5
MjAtMDg2N+OAgOefs+W3neecjOmHkeayouW4gumVt+Wcn+WhgDEtMTYtMTXjgIDkuLjmmIzjg5Pj
g6sKVEVM77yaMDc2LTIzNC0wNDQ544CAIEZBWO+8mjA3Ni0yMjQtMDQ0OQpFLW1haWwgOiBpbmZv
QHNpc2lrdS5jb23jgIDjgIBXZWIgOiBodHRwczovL3d3dy5zaXNpa3UuY29tCioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

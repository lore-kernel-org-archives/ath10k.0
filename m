Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C175EC433EF
	for <ath10k@archiver.kernel.org>; Mon, 16 May 2022 03:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mcVe0jPz5FG1PovwmodHghLehKDpF1GVNgI8BJwS2w=; b=sXGq2UMYvG+eZQ
	N30E2B0MIuKqtvfWsm4BTqVPluvF08XcWbnfk89HiiCrbr110WUoUvsOZSRq/kyn1dp0TgyvWXJWG
	1GKDv7nHM30xvdMVJLLIUL6sed1pXH696XrG2a8ICv1lDaMxVBrRsoldrqT99pf2ITbrO9gA+/FBN
	ZEUIBV6vUp0845NSA44fH2+VTeMEH7ZRXrR3ygyS+qDJUp9SNWlvMU7JSk7xHcGTBrEwE1VnxE89J
	AlrcG617UCyDXizlnChfUJYHcCVybnG/zEjK5xWx30zNbM7ZqPAUmvWgsrtN1eOWVOQkskwR+JCSx
	Juqg2kt2zJ6IPT/qc17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqRMe-005lhK-HT; Mon, 16 May 2022 03:25:44 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqRMa-005lej-Ei
 for ath10k@lists.infradead.org; Mon, 16 May 2022 03:25:41 +0000
Received: by mail-lj1-x22e.google.com with SMTP id m23so16616628ljc.0
 for <ath10k@lists.infradead.org>; Sun, 15 May 2022 20:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xta7mXhm2Fn94nk/9joq4nWctV2Qx65e2rWuESLvCI=;
 b=Hioqv9TGU/FbI35sE3TREY8e3/vmNZPGONyFHjiAwcc9MDOvUNHPD53QhsY149u620
 Vevyl1GrZSRsjOrDS9hggWqA7R/8Hsht1AGFl0kqZhdN43sML7EG0G2kgzFXOhGDp8S1
 ROaX1Nacry7w/o0XmxHtgGPgdVPDCvhxWwfg04FUCJuSA1M6DR91zYq2LrrSJLJpbuKv
 XjKSkDLL32I9GYe25ZdEh8+tUT7zEiRFi6SMcXZ++DBT9aW5c99BJUvFc0Pen4tudogj
 0a4sHa5IcbbnspNdJloR3QO1OJqMmkv0JX3n2+cxZHAVKf4WFXbWNDH0u6sDp116Ljv1
 xr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xta7mXhm2Fn94nk/9joq4nWctV2Qx65e2rWuESLvCI=;
 b=ts1fot6PAa7ny8dfTDYFSKcK6ITCL//YBziGHtauU14RCjpMz23W5BkLEyYvuhds/A
 tEEFKp2ckoxjJoWV/3FL8H8orRl8EdXEsJMEbmGhTZKFj9G3xbLegtxwLmqHrcCvzeFE
 oIcpC0D5BOy23rTC/ScGB22FkyMtaW3PHXJBd/sMBbUo3dTVnMFChHnwuLFQc0UHtfwY
 ysR6qHalbW5e3Hr7uqxQxN+h665cO7kTQNctqveJ7BzBl4UlGX3vx9j8wd5P2dNNSXJC
 6FCy9M5TQSOUYyNJP9gnNEfzl67LDIFl9qiXMBRfhfqD8Fhgo7ziFn25L8XpB4+9ef2G
 44Kw==
X-Gm-Message-State: AOAM532nS6ePy8xjkb/skvUqM9k3RSdDiFvurfCSr3I2JXsI0OBUEkDw
 vtwzAZeaQM37IuulS0K2XO4=
X-Google-Smtp-Source: ABdhPJwG21mD1Uu47jm2MyFyRUP+b0rBLtkvdr0bu9qRGPrQoG4/kzUA6vA7jP5N0Yy80KvBI1zgrg==
X-Received: by 2002:a2e:9e03:0:b0:24f:153c:c479 with SMTP id
 e3-20020a2e9e03000000b0024f153cc479mr10429362ljk.13.1652671537745; 
 Sun, 15 May 2022 20:25:37 -0700 (PDT)
Received: from rsa-laptop.internal.lan ([217.25.229.52])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a2e9152000000b0024f3d1daee5sm1337251ljg.109.2022.05.15.20.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 20:25:37 -0700 (PDT)
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Edward Matijevic <motolav@gmail.com>, John Crispin <john@phrozen.org>,
 =?UTF-8?q?Old=C5=99ich=20Jedli=C4=8Dka?= <oldium.pro@gmail.com>,
 Tom Psyborg <pozega.tomislav@gmail.com>,
 Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>,
 Zhijun You <hujy652@gmail.com>
Subject: [PATCH 1/4] ath10k: improve tx status reporting
Date: Mon, 16 May 2022 06:25:16 +0300
Message-Id: <20220516032519.29831-2-ryazanov.s.a@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_202540_530430_BA332C56 
X-CRM114-Status: GOOD (  13.22  )
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

V2UgdXNlIGllZWU4MDIxMV90eF9zdGF0dXMoKSB0byByZXBvcnQgZWFjaCBjb21wbGV0ZWQgdHgg
ZnJhbWUuCkludGVybmFsbHksIHRoaXMgZnVuY3Rpb24gY2FsbHMgc3RhX2luZm9fZ2V0X2J5X2Fk
ZHJzKCksIHdoYXQgaGFzIGEKY291cGxlIG9mIGRyYXdiYWNrczoKMS4gYWRkaXRpb25hbCBzdGF0
aW9uIGxvb2t1cCBjYXVzZXMgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlvbjsKMi4gbWFjODAyMTEg
Y2FuIG5vdCBwcm9wZXJseSBhY2NvdW50IEV0aGVybmV0IGVuY2Fwc3VsYXRlZCBmcmFtZXMgZHVl
CiAgIHRvIHRoZSBpbmFiaWxpdHkgdG8gcHJvcGVybHkgZGV0ZXJtaW5lIHRoZSBkZXN0aW5hdGlv
biAoc3RhdGlvbikgTUFDCiAgIGFkZHJlc3Mgc2luY2UgaWVlZTgwMjExX3R4X3N0YXR1cygpIGFz
c3VtZXMgdGhlIGZyYW1lIGhhcyBhIDgwMi4xMQogICBoZWFkZXIuCgpUaGUgbGF0dGVyIGlzIGVz
cGVjaWFsbHkgZGVzdHJ1Y3RpdmUgaWYgd2Ugd2FudCB0byB1c2UgaGFyZHdhcmUgZnJhbWVzCmVu
Y2Fwc3VsYXRpb24uCgpUbyBmaXggYm90aCBvZiB0aGVzZSBpc3N1ZXMsIHJlcGxhY2UgaWVlZTgw
MjExX3R4X3N0YXR1cygpIHdpdGgKaWVlZTgwMjExX3R4X3N0YXR1c19leHQoKSBjYWxsIGFuZCBm
ZWVkIGl0IHN0YXRpb24gcG9pbnRlciBmcm9tIHRoZSB0eApxdWV1ZSBhc3NvY2lhdGVkIHdpdGgg
dGhlIHRyYW5zbWl0dGVkIGZyYW1lLgoKVGVzdGVkLW9uOiBRQ0E5ODg4IGh3IDIuMCAxMC40LTMu
OS4wLjItMDAxMzEKVGVzdGVkLW9uOiBRQ0E2MTc0IGh3IDMuMiBQQ0kgV0xBTi5STS40LjQuMS0w
MDE1Ny1RQ0FSTVNXUFotMQpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgUnlhemFub3YgPHJ5YXphbm92
LnMuYUBnbWFpbC5jb20+ClRlc3RlZC1ieTogT2xkxZlpY2ggSmVkbGnEjWthIDxvbGRpdW0ucHJv
QGdtYWlsLmNvbT4gIyBUUC1MaW5rIEFyY2hlciBDNyB2NCAmIHY1IChRQ0E5NTYzICsgUUNBOTg4
MCkKVGVzdGVkLWJ5OiBFZHdhcmQgTWF0aWpldmljIDxtb3RvbGF2QGdtYWlsLmNvbT4gIyBUUC1M
aW5rIEFyY2hlciBDMjYwMCAoSVBRODA2NCArIFFDQTk5ODAgMTAuNC4xLjAwMDMwLTEpClRlc3Rl
ZC1ieTogRWR3YXJkIE1hdGlqZXZpYyA8bW90b2xhdkBnbWFpbC5jb20+ICMgUUNBOTM3NyBQQ0kg
aW4gU3RhIG1vZGUKVGVzdGVkLWJ5OiBaaGlqdW4gWW91IDxodWp5NjUyQGdtYWlsLmNvbT4gIyBO
RVRHRUFSIFI3ODAwIChRQ0E5OTg0IDEwLjQtMy45LjAuMi0wMDE1OSkKLS0tCgpDaGFuZ2VzIHNp
bmNlIFJGQzoKICogbmV3IFRlc3RlZC1vbiBhbmQgVGVzdGVkLWJ5IHRhZ3MKCiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYyB8IDEyICsrKysrKysrKysrLQogMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvdHhyeC5jCmluZGV4IDEwMTIzOTc0YzNkYS4uNzI1NDA0MzRjNzViIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYworKysgYi9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYwpAQCAtNDMsNiArNDMsNyBAQCBzdGF0
aWMgdm9pZCBhdGgxMGtfcmVwb3J0X29mZmNoYW5fdHgoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVj
dCBza19idWZmICpza2IpCiBpbnQgYXRoMTBrX3R4cnhfdHhfdW5yZWYoc3RydWN0IGF0aDEwa19o
dHQgKmh0dCwKIAkJCSBjb25zdCBzdHJ1Y3QgaHR0X3R4X2RvbmUgKnR4X2RvbmUpCiB7CisJc3Ry
dWN0IGllZWU4MDIxMV90eF9zdGF0dXMgc3RhdHVzOwogCXN0cnVjdCBhdGgxMGsgKmFyID0gaHR0
LT5hcjsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBhci0+ZGV2OwogCXN0cnVjdCBpZWVlODAyMTFf
dHhfaW5mbyAqaW5mbzsKQEAgLTEyOCw3ICsxMjksMTYgQEAgaW50IGF0aDEwa190eHJ4X3R4X3Vu
cmVmKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsCiAJCWluZm8tPnN0YXR1cy5mbGFncyB8PSBJRUVF
ODAyMTFfVFhfU1RBVFVTX0FDS19TSUdOQUxfVkFMSUQ7CiAJfQogCi0JaWVlZTgwMjExX3R4X3N0
YXR1cyhodHQtPmFyLT5odywgbXNkdSk7CisJbWVtc2V0KCZzdGF0dXMsIDAsIHNpemVvZihzdGF0
dXMpKTsKKwlzdGF0dXMuc2tiID0gbXNkdTsKKwlzdGF0dXMuaW5mbyA9IGluZm87CisKKwlyY3Vf
cmVhZF9sb2NrKCk7CisJaWYgKHR4cSAmJiB0eHEtPnN0YSkKKwkJc3RhdHVzLnN0YSA9IHR4cS0+
c3RhOworCWllZWU4MDIxMV90eF9zdGF0dXNfZXh0KGh0dC0+YXItPmh3LCAmc3RhdHVzKTsKKwly
Y3VfcmVhZF91bmxvY2soKTsKKwogCS8qIHdlIGRvIG5vdCBvd24gdGhlIG1zZHUgYW55bW9yZSAq
LwogCiAJcmV0dXJuIDA7Ci0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==

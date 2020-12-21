Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092F4C433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 01:53:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D4922D5A
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 01:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D4922D5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EkYGNHad+mYwrj9JnWWwU5oXZsmt+VZBBKglLWV73mM=; b=WrVzMURZcm6Ih0jK0gDHzogR2I
	zNShnezj8ijjIYRcMhtPy7L8mbz92XECqXs4aXYT+kaVaAYxb5JsR/XoglHTGioAU7iCDlF6vUOjR
	8Z20wB3Up4ZzcMUj43vnO6lnYJEb9nsFpIcTmrKZPkckMGkfqDDR4kwhfNO0D64Oyqo3bkq6Lyeu2
	td6xAWiNL/mVSoVa0Z/cDYefe4T6XE4oMds1VpdqxVKgy43TTKpkrR/Tnrkb84PG/sYcIDrHFzdxy
	Dfr/sJk/U2Eybow0tfkeXrrpS7OlmuA9K30aqBEucw7LjkPsWoARE8+DNeA7mxIKtPMKpnEOw2T7M
	U6uzVOrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krANu-0003sm-1k; Mon, 21 Dec 2020 01:53:14 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krANq-0003sN-Gt
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 01:53:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608515588; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QQKZtdU5aapl2TsfW56Emn7Tl65Rubj/ruzexWFDQes=;
 b=l59h6NJoIhaU5GQwQ0Gqx1OQ9BDnMc3tmHtn6BQlfHg/j5VjLCiQOW51sjnUzZHbRd0P02Ak
 ZbmVOeJ2fJqcScqF/z9G7s9+0LaZFHKEqPV4wlLk0fHabmHpmxoNYsLn+NHBADgf3m4vHGZ0
 sk4T2+D3PkmxtW9oOufBZV/bupQ=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fe00001f5e9af65f8047751 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 01:53:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 72053C433ED; Mon, 21 Dec 2020 01:53:05 +0000 (UTC)
Received: from miaoqing-HP-Z220-SFF-Workstation.ap.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: miaoqing)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 220E4C433C6;
 Mon, 21 Dec 2020 01:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 220E4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=miaoqing@codeaurora.org
From: Miaoqing Pan <miaoqing@codeaurora.org>
To: ath10k@lists.infradead.org
Subject: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
Date: Mon, 21 Dec 2020 09:52:59 +0800
Message-Id: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_205310_716309_D037D26C 
X-CRM114-Status: GOOD (  15.32  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RmFpbGVkIHRvIHRyYW5zbWl0IHdtaSBtYW5hZ2VtZW50IGZyYW1lczoKCls4NDk3Ny44NDA4OTRd
IGF0aDEwa19zbm9jIGEwMDAwMDAud2lmaTogd21pIG1nbXQgdHggcXVldWUgaXMgZnVsbApbODQ5
NzcuODQwOTEzXSBhdGgxMGtfc25vYyBhMDAwMDAwLndpZmk6IGZhaWxlZCB0byB0cmFuc21pdCBw
YWNrZXQsIGRyb3BwaW5nOiAtMjgKWzg0OTc3Ljg0MDkyNF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53
aWZpOiBmYWlsZWQgdG8gc3VibWl0IGZyYW1lOiAtMjgKWzg0OTc3Ljg0MDkzMl0gYXRoMTBrX3Nu
b2MgYTAwMDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgZnJhbWU6IC0yOAoKVGhpcyBpc3N1
ZSBpcyBjYXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBhbmQKX19z
a2JfcXVldWVfdGFpbC4gVGhlIHF1ZXVlIG9mIOKAmHdtaV9tZ210X3R4X3F1ZXVl4oCZIGlzIHBy
b3RlY3RlZCBieSBhCmRpZmZlcmVudCBsb2NrOiBhci0+ZGF0YV9sb2NrIHZzIGxpc3QtPmxvY2ss
IHRoZSByZXN1bHQgaXMgbm8gcHJvdGVjdGlvbi4KU28gd2hlbiBhdGgxMGtfbWdtdF9vdmVyX3dt
aV90eF93b3JrKCkgYW5kIGF0aDEwa19tYWNfdHhfd21pX21nbXQoKQpydW5uaW5nIGNvbmN1cnJl
bnRseSBvbiBkaWZmZXJlbnQgQ1BVcywgdGhlcmUgYXBwZWFyIHRvIGJlIGEgcmFyZSBjb3JuZXIK
Y2FzZXMgd2hlbiB0aGUgcXVldWUgbGVuZ3RoIGlzIDEsCgogIENQVXggKHNrYl9kZXVxdWUpCQkJ
Q1BVeSAoX19za2JfcXVldWVfdGFpbCkKCQkJCQluZXh0PWxpc3QKCQkJCQlwcmV2PWxpc3QKICBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiID0gc2tiX3BlZWsobGlzdCk7CVdSSVRFX09OQ0UobmV3c2stPm5l
eHQsIG5leHQpOwogIFdSSVRFX09OQ0UobGlzdC0+cWxlbiwgbGlzdC0+cWxlbiAtIDEpO1dSSVRF
X09OQ0UobmV3c2stPnByZXYsIHByZXYpOwogIG5leHQgICAgICAgPSBza2ItPm5leHQ7CQlXUklU
RV9PTkNFKG5leHQtPnByZXYsIG5ld3NrKTsKICBwcmV2ICAgICAgID0gc2tiLT5wcmV2OwkJV1JJ
VEVfT05DRShwcmV2LT5uZXh0LCBuZXdzayk7CiAgc2tiLT5uZXh0ICA9IHNrYi0+cHJldiA9IE5V
TEw7CWxpc3QtPnFsZW4rKzsKICBXUklURV9PTkNFKG5leHQtPnByZXYsIHByZXYpOwogIFdSSVRF
X09OQ0UocHJldi0+bmV4dCwgbmV4dCk7CgpJZiB0aGUgaW5zdHJ1Y3Rpb24g4oCYbmV4dCA9IHNr
Yi0+bmV4dOKAmSBpcyBleGVjdXRlZCBiZWZvcmUK4oCYV1JJVEVfT05DRShwcmV2LT5uZXh0LCBu
ZXdzaynigJksIG5ld3NrIHdpbGwgYmUgbG9zdCwgYXMgQ1BVeCBnZXQgdGhlCm9sZCDigJhuZXh0
4oCZIHBvaW50ZXIsIGJ1dCB0aGUgbGVuZ3RoIGlzIHN0aWxsIGFkZGVkIGJ5IG9uZS4gVGhlIGZp
bmFsCnJlc3VsdCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBxdWV1ZSB3aWxsIHJlYWNoIHRoZSBtYXhp
bXVtIHZhbHVlIGJ1dAp0aGUgcXVldWUgaXMgZW1wdHkuCgpTbyByZW1vdmUgYXItPmRhdGFfbG9j
aywgYW5kIHVzZSAnc2tiX3F1ZXVlX3RhaWwnIGluc3RlYWQgb2YKJ19fc2tiX3F1ZXVlX3RhaWwn
IHRvIHByZXZlbnQgdGhlIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbi4KClRlc3RlZC1vbjogV0NO
Mzk5MCBodzEuMCBTTk9DIFdMQU4uSEwuMy4xLmMyLTAwMDMzLVFDQUhMU1dNVFBMWi0xCgpTaWdu
ZWQtb2ZmLWJ5OiBNaWFvcWluZyBQYW4gPG1pYW9xaW5nQGNvZGVhdXJvcmEub3JnPgotLS0KIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMgfCAxMyArKystLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwppbmRleCBkYzMyYzc4Li41ZGExNTA0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCisrKyBiL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMKQEAgLTM3NjMsMjMgKzM3NjMsMTYgQEAgYm9v
bCBhdGgxMGtfbWFjX3R4X2ZybV9oYXNfZnJlcShzdHJ1Y3QgYXRoMTBrICphcikKIHN0YXRpYyBp
bnQgYXRoMTBrX21hY190eF93bWlfbWdtdChzdHJ1Y3QgYXRoMTBrICphciwgc3RydWN0IHNrX2J1
ZmYgKnNrYikKIHsKIAlzdHJ1Y3Qgc2tfYnVmZl9oZWFkICpxID0gJmFyLT53bWlfbWdtdF90eF9x
dWV1ZTsKLQlpbnQgcmV0ID0gMDsKLQotCXNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7CiAK
IAlpZiAoc2tiX3F1ZXVlX2xlbihxKSA9PSBBVEgxMEtfTUFYX05VTV9NR01UX1BFTkRJTkcpIHsK
IAkJYXRoMTBrX3dhcm4oYXIsICJ3bWkgbWdtdCB0eCBxdWV1ZSBpcyBmdWxsXG4iKTsKLQkJcmV0
ID0gLUVOT1NQQzsKLQkJZ290byB1bmxvY2s7CisJCXJldHVybiAtRU5PU1BDOwogCX0KIAotCV9f
c2tiX3F1ZXVlX3RhaWwocSwgc2tiKTsKKwlza2JfcXVldWVfdGFpbChxLCBza2IpOwogCWllZWU4
MDIxMV9xdWV1ZV93b3JrKGFyLT5odywgJmFyLT53bWlfbWdtdF90eF93b3JrKTsKIAotdW5sb2Nr
OgotCXNwaW5fdW5sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKLQotCXJldHVybiByZXQ7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBlbnVtIGF0aDEwa19tYWNfdHhfcGF0aAotLSAKMi43LjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

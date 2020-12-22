Return-Path: <SRS0=CzWf=F2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2EFC433E0
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 06:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B232255F
	for <ath10k@archiver.kernel.org>; Tue, 22 Dec 2020 06:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B232255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9oK1cxIkjg9xkp9FmvQ/TdrGzRtzZUATkCcEuT/ie4Y=; b=yNM74zKI3oJR5RkTQ/0YTa/k+/
	gl/QYFgxiaf9x1QnrX/exEO6ybKQahv/u/tOHXEaO49J/N5ZTH0xLhcjnlmSupdVToKkTlrZxJyeo
	S26po29ThFMlUvOxtmjOXMNtXNlKgU4Esstz97W43qR2SIhs7mEhzXqgZKpbY7b3M03IrUwBfBLtG
	71tfSI8vdxhofRW62RWlZdirG1NQ0PDkDmllgv2M/d5YZWoS6jEiou4O7jh+LVejhEgwVp/3n9XQK
	uFZxNxMYzmdiq4fcjKNdNMLUpVVbCzfOD3h0j0j5D3d/D/W2vMCU/NJFy6MF1DOG4XZ6lw5KoEm8V
	2j+NpmxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krbGB-0005s7-FN; Tue, 22 Dec 2020 06:35:03 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krbG7-0005rT-2L
 for ath10k@lists.infradead.org; Tue, 22 Dec 2020 06:35:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608618900; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=TKB7sI3CKvg+RVej1qQWFlhU6xzxcbfFdpg5n8TXN34=;
 b=CIIQ+2jm6VXqgLbXvPa7sOzWSVWuurLba95a879XO1w6i4wghvHDSZ7dP7xigmilu4idwnmp
 4aXZ3kOt/veAdHxQ7LeWIX+2FJz0LA5+IgDOX5OClqV6oFa84VQG8YgC8lJDJl5Dkey8IesV
 2LswWFAHFnYhkVlsXfuBXtm1xn0=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe1938dcfd94dd328e0ebe8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 06:34:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 30A03C43462; Tue, 22 Dec 2020 06:34:53 +0000 (UTC)
Received: from miaoqing-HP-Z220-SFF-Workstation.ap.qualcomm.com (unknown
 [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: miaoqing)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4602AC433ED;
 Tue, 22 Dec 2020 06:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4602AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=miaoqing@codeaurora.org
From: Miaoqing Pan <miaoqing@codeaurora.org>
To: ath10k@lists.infradead.org
Subject: [PATCH v2] ath10k: fix wmi mgmt tx queue full due to race condition
Date: Tue, 22 Dec 2020 14:34:47 +0800
Message-Id: <1608618887-8857-1-git-send-email-miaoqing@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_013500_930701_D13CF008 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org,
 Miaoqing Pan <miaoqing@codeaurora.org>
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
IHRvIHByZXZlbnQgdGhlIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbi4gQWxzbyBzd2l0Y2gKdG8g
dXNlIHNrYl9xdWV1ZV9sZW5fbG9ja2xlc3MsIGluIGNhc2Ugd2UgcXVldWUgYSBmZXcgU0tCcyBz
aW11bHRhbmVvdXNseS4KClRlc3RlZC1vbjogV0NOMzk5MCBodzEuMCBTTk9DIFdMQU4uSEwuMy4x
LmMyLTAwMDMzLVFDQUhMU1dNVFBMWi0xCgpTaWduZWQtb2ZmLWJ5OiBNaWFvcWluZyBQYW4gPG1p
YW9xaW5nQGNvZGVhdXJvcmEub3JnPgotLS0KdjI6IHVzZSBza2JfcXVldWVfbGVuX2xvY2tsZXNz
IGluc3RlYWQgb2Ygc2tiX3F1ZXVlX2xlbgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvbWFjLmMgfCAxNSArKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21h
Yy5jCmluZGV4IGRjMzJjNzguLjNjZWZhMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvbWFjLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9tYWMuYwpAQCAtMzc2MywyMyArMzc2MywxNiBAQCBib29sIGF0aDEwa19tYWNfdHhfZnJtX2hh
c19mcmVxKHN0cnVjdCBhdGgxMGsgKmFyKQogc3RhdGljIGludCBhdGgxMGtfbWFjX3R4X3dtaV9t
Z210KHN0cnVjdCBhdGgxMGsgKmFyLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQogewogCXN0cnVjdCBz
a19idWZmX2hlYWQgKnEgPSAmYXItPndtaV9tZ210X3R4X3F1ZXVlOwotCWludCByZXQgPSAwOwot
Ci0Jc3Bpbl9sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKIAotCWlmIChza2JfcXVldWVfbGVuKHEp
ID09IEFUSDEwS19NQVhfTlVNX01HTVRfUEVORElORykgeworCWlmIChza2JfcXVldWVfbGVuX2xv
Y2tsZXNzKHEpID49IEFUSDEwS19NQVhfTlVNX01HTVRfUEVORElORykgewogCQlhdGgxMGtfd2Fy
bihhciwgIndtaSBtZ210IHR4IHF1ZXVlIGlzIGZ1bGxcbiIpOwotCQlyZXQgPSAtRU5PU1BDOwot
CQlnb3RvIHVubG9jazsKKwkJcmV0dXJuIC1FTk9TUEM7CiAJfQogCi0JX19za2JfcXVldWVfdGFp
bChxLCBza2IpOworCXNrYl9xdWV1ZV90YWlsKHEsIHNrYik7CiAJaWVlZTgwMjExX3F1ZXVlX3dv
cmsoYXItPmh3LCAmYXItPndtaV9tZ210X3R4X3dvcmspOwogCi11bmxvY2s6Ci0Jc3Bpbl91bmxv
Y2tfYmgoJmFyLT5kYXRhX2xvY2spOwotCi0JcmV0dXJuIHJldDsKKwlyZXR1cm4gMDsKIH0KIAog
c3RhdGljIGVudW0gYXRoMTBrX21hY190eF9wYXRoCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRo
MTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hdGgxMGsK

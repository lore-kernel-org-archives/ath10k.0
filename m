Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4413CC433FE
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28A360F21
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F28A360F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1D9xJmHXW8YSRPLDLMJpn6D/80jlmp2Qv9fuxl/KUU=; b=vL9VoP/3dG6C/3
	Af2cjpOeB+FW2wuwnS9RtjTtiRuUYYNgq85UDArbvBcM6duScaTcW7+fQS3hFNjseJ1W2AAqHp3z5
	whunfIsrCdyU6FRc1za5l90dH33QoXzdkcksl8hTNGm7nTtkg/dX4PCLgTYeeh6gEClvHTRhXpoHQ
	H3KvZ2aRV2FEj2eqPvVSrh/msxEyXdo2kdbOhzwlxZRQUdUBWJkCYUReHSsguQQxgB3x+3xp39Qd5
	R3YNDAI2eTGOgDJsXiaFMzFoioEPAwVFkHVShk7yS3tMfDbvg5lUBn0vtqKdmFKIytuhmJ6fSCGyb
	DAXXkosWmMx0v6cHx8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg3yA-007jdE-Hx; Thu, 28 Oct 2021 11:53:18 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg3y5-007jcd-N9
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 11:53:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635421995; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=ld1f+aqBTT8aE5Ulu7PhU13nMnfkgomOhhW3itU1TBY=;
 b=ZAIoKTACKiVgl+eP/Yfjbb9wjh13qN5xVej7lvvyVjD2JueNi3P0SpQpIQ9cebohtQYFJSJg
 9A6+McP8xpQOrWQyaczIivp7Z+OWnXrv7WREvUdjrVtBcMYcOOGYs2BK19PyCAwbPYOkkef6
 maXwkqr0droGlfHjh2me6M1+a+A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617a8f1c900d71ea1efef8d3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 11:53:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CADA3C4360C; Thu, 28 Oct 2021 11:52:59 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 48775C4338F;
 Thu, 28 Oct 2021 11:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 48775C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
Date: Thu, 28 Oct 2021 14:52:56 +0300
In-Reply-To: <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com> (Christian
 Lamparter's message of "Thu, 28 Oct 2021 13:31:02 +0200")
Message-ID: <875yth5pt3.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_045315_223828_DF9C6ECD 
X-CRM114-Status: GOOD (  18.17  )
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

Q2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIDI4
LzEwLzIwMjEgMTA6NTgsIEthbGxlIFZhbG8gd3JvdGU6Cj4+IENocmlzdGlhbiBMYW1wYXJ0ZXIg
PGNodW5rZWV5QGdtYWlsLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gQVRIMTBLIGNoaXBzIGFyZSB1c2Vk
IGl0IHdpZGUgcmFuZ2Ugb2Ygcm91dGVycywKPj4+IGFjY2Vzc3BvaW50cywgcmFuZ2UgZXh0ZW5k
ZXJzLCBuZXR3b3JrIGFwcGxpYW5jZXMuCj4+PiBPbiB0aGVzZSBlbWJlZGRlZCBkZXZpY2VzLCBj
YWxpYnJhdGlvbiBkYXRhIGlzIG9mdGVuCj4+PiBzdG9yZWQgb24gdGhlIG1haW4gc3lzdGVtJ3Mg
Zmxhc2ggYW5kIHdhcyBvdXQgb2YgcmVhY2gKPj4+IGZvciB0aGUgZHJpdmVyLgo+Pj4KPj4+IFRv
IGJyaWRnZSB0aGlzIGdhcCwgYXRoMTBrIGlzIGdldHRpbmcgZXh0ZW5kZWQgdG8gcHVsbAo+Pj4g
dGhlIChwcmUtKWNhbGlicmF0aW9uIGRhdGEgdGhyb3VnaCBudm1lbSBzdWJzeXN0ZW0uCj4+PiBU
byBkbyB0aGlzLCBhIG52bWVtLWNlbGwgY29udGFpbmluZyB0aGUgaW5mb3JtYXRpb24gY2FuCj4+
PiBlaXRoZXIgYmUgc3BlY2lmaWVkIGluIHRoZSBwbGF0Zm9ybSBkYXRhIG9yIHZpYSBkZXZpY2Ut
dHJlZS4KPj4+Cj4+PiBUZXN0ZWQgd2l0aDoKPj4+ICAgICAgICAgIE5ldGdlYXIgRVg2MTUwdjIg
KElQUTQwMTggLSBwcmUtY2FsaWJyYXRpb24gbWV0aG9kKQo+Pj4gICAgICAgICAgVFAtTGluayBB
cmNoZXIgQzcgdjIgKFFDQTk4ODB2MiAtIG9sZCBjYWxpYnJhdGlvbiBtZXRob2QpCj4+Pgo+Pj4g
Q2M6IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4KPj4+IENjOiBUaGliYXV0IFZB
UsOITkUgPGhhY2tzQHNsYXNoZGlydC5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
TGFtcGFydGVyIDxjaHVua2VleUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiB2MSAtPiB2MjoK
Pj4+IAktIHVzZSAlenUgYW5kICV1IGluIHRoZSBmb3JtYXQgc3RyaW5nIGZvciBzaXplX3QKPj4+
ICAgICAgICAgICAgYW5kIHUzMiB0eXBlcyAoY2F0Y2hlZCBieSB0aGUgImtlcm5lbCB0ZXN0IHJv
Ym90IikuCj4+PiAJLSByZXdvcmRlZCBjb21taXQgbWVzc2FnZSArIHN1Y2Nlc3NmdWxseSB0ZXN0
ZWQgb24gUUNBOTg4MHYyCj4+Pgo+Pj4gSSBwbGFjZWQgdGhlIG52bWVtIGNvZGUgaW4gZnJvbnQg
b2YgdGhlIGN1cnJlbnQgImZpbGUiIG1ldGhvZAo+Pj4gKGZpcm13YXJlX3JlcXVlc3QpLiBSZWFz
b24gaXMgdGhhdCB0aGlzIG1ha2VzIGl0IGVhc2llciBmb3IgbWUKPj4+IHRvIHRlc3QgaXQuIElm
IG5lZWRlZCBpdCBjYW4gYmUgbW92ZWQgdG8gYSBkaWZmZXJlbnQgcGxhY2UuCj4+Cj4+IExvb2tz
IGdvb2QgdG8gbWUuIEJlZm9yZSBJIGFwcGx5IHRoaXMsIEkgd2FudCB0byBtZW50aW9uIHRvIHRo
YXQgSSBoYXZlCj4+IGhhZCBhIGxvbmcgaW4gbXkgZGVmZXJyZWQgcXVldWUgcmVsYXRlZCB0d28g
cGF0Y2hzZXRzOgo+Cj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXdpcmVsZXNzL3BhdGNoLzIwMjAwOTI3MTkyNTE1Ljg2LTEtYW5zdWVsc210aEBnbWFpbC5j
b20vCj4+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVz
cy9wYXRjaC8yMDIwMDkyNzE5MjUxNS44Ni0yLWFuc3VlbHNtdGhAZ21haWwuY29tLwo+Cj4gT2gg
b2ssIHNlcnZlcyBtZSByaWdodCBmb3Igbm90IGxvb2tpbmcgdGhvcm91Z2hseSBnb29nbGluZyB0
aGlzIGZpcnN0Lgo+IEFsYmFuIEJlZGVsIGFuZCBBbnN1ZWwncyB3b3JrIG1hZGUgdGhpcyBudm1l
bSBhbGwgcG9zc2libGUuIEFuZCBpbmRlZWQsCj4gdGhlIHNlY29uZCBwYXRjaCBoZXJlIGxvb2tz
IGVlcmllIHNpbWlsYXIuCj4KPiBEbyB5b3Ugd2FudCB0byBnbyB3aXRoIGhpcyB0d28gcGF0Y2hl
cyBpbnN0ZWFkPwoKSSB3b3VsZCBwcmVmZXIgdG8gdGFrZSB5b3VyIHBhdGNoLgoKPiBJJ2xsIGNo
YW5nZSBtaW5lLCBzbyBpdCBqdXN0IGNvbnNpc3RzIG9mIHRoZSBjYWxfbW9kZSBmb3IgdGhlIG9s
ZGVyCj4gUUNBOTg4MHYyLFFDQTk4ODcgYW5kIGFkZCB0aGUgLUVQUk9CRV9ERUZFUiBoYW5kbGlu
Zy4gVGhpcwo+IC1FUFJPQkVfREVGRVIgb25seSBldmVyIGNvbWVzIHVwIHdpdGggdGhlIE1lcmFr
aSBnZWFyLiBUaGlzIGlzIGJlY2F1c2UKPiBNZXJha2kgbGlrZXMgcHV0dGluZyB0aGUgTUFDcy1W
YWx1ZXMgaW50byBTb0MtY29ubmVjdGVkIEFUMjQKPiBlZXByb21zLWNoaXBzLiBFdmVyeW9uZSBl
bHNlIGp1c3QgaGF2ZSB0aGVtIGluIGEgcHJvcGVyIEZMQVNICj4gcGFydGl0aW9uLiBUaG91Z2gs
IHRoaXMncyB1c3VhbGx5IG5vdGhpbmcgbW9yZSB0aGFuIGFkZGluZyB0aGUKPiBmb2xsb3dpbmcg
bGluZToKPgo+IGlmIChyZXQgPT0gLUVQUk9CRVJfREVGRVIpCj4gCXJldHVybiByZXQ7CgpTbyBJ
J2xsIGRyb3AgdGhpcyB2ZXJzaW9uIGFuZCB3YWl0IGZvciB2Mz8KCi0tIApodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

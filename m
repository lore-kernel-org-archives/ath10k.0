Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36904C4332F
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 08:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F021C61056
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 08:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F021C61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3mnoSnjPWzTvYwDAtXo8Osqq+KXEtuEn5kxlXkw/P4=; b=xsvHDQH8b/BZyV
	/jAxtzS3sDAM7odJNj9ya4yNwXR2jYmAgd90/H0coRqlcAduH7ZDTKwfiaozEs+jPamCqvNkDmho3
	eJmWtqaAE4GCLH61f8qBm0nFuHVYJCrbXmCCVRcblRPEHfbyHXtU/tF5Rsyc5o7bl0uunY/uVSixE
	1tqdqhimXLaakQqrV4MKPvfx9Df4eXpJbxMHi+DwC+BcrWshQTgkQCFc0I7utnud5Is2qyJVV4J7M
	tpViNwcL5abk6gZ5hdcD0VG7aRnmR8nNgGIJGain/b7RV1rGUpY0/ufWyvyMX2fyvi0c2We49wbhQ
	bwGZYN+fwKx0S8w7AGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg1FU-007KYB-BS; Thu, 28 Oct 2021 08:59:00 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg1FN-007KWN-M9
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 08:58:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635411536; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=4KROLv/TfRY+ImU5mU/rR3OKISGBN52NI3Dxegicnhs=;
 b=GTxmS/zuhmKc/Nb4/rV9eBJVxCQf/fRDPb5Sxzvk0iyasT3nzVj5kp1OjkpWZMDd1WXJKDVi
 ZTb0FHCX8UXEk9pupvU6QO2x3te//oKQ3hRhKiE45sa7q/vcGxLAdG9UPnzzwWRg9FUQbaaI
 43jf278MmBN7Qe+dCDiXycH7aC8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 617a6629ff3eb667a7ccd0fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Oct 2021 08:58:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86229C43460; Thu, 28 Oct 2021 08:58:17 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4B59C4338F;
 Thu, 28 Oct 2021 08:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4B59C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
References: <20211016234609.1568317-1-chunkeey@gmail.com>
Date: Thu, 28 Oct 2021 11:58:13 +0300
In-Reply-To: <20211016234609.1568317-1-chunkeey@gmail.com> (Christian
 Lamparter's message of "Sun, 17 Oct 2021 01:46:09 +0200")
Message-ID: <87ee855xwa.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_015857_064900_DB9C7278 
X-CRM114-Status: GOOD (  17.71  )
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

Q2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEFUSDEw
SyBjaGlwcyBhcmUgdXNlZCBpdCB3aWRlIHJhbmdlIG9mIHJvdXRlcnMsCj4gYWNjZXNzcG9pbnRz
LCByYW5nZSBleHRlbmRlcnMsIG5ldHdvcmsgYXBwbGlhbmNlcy4KPiBPbiB0aGVzZSBlbWJlZGRl
ZCBkZXZpY2VzLCBjYWxpYnJhdGlvbiBkYXRhIGlzIG9mdGVuCj4gc3RvcmVkIG9uIHRoZSBtYWlu
IHN5c3RlbSdzIGZsYXNoIGFuZCB3YXMgb3V0IG9mIHJlYWNoCj4gZm9yIHRoZSBkcml2ZXIuCj4K
PiBUbyBicmlkZ2UgdGhpcyBnYXAsIGF0aDEwayBpcyBnZXR0aW5nIGV4dGVuZGVkIHRvIHB1bGwK
PiB0aGUgKHByZS0pY2FsaWJyYXRpb24gZGF0YSB0aHJvdWdoIG52bWVtIHN1YnN5c3RlbS4KPiBU
byBkbyB0aGlzLCBhIG52bWVtLWNlbGwgY29udGFpbmluZyB0aGUgaW5mb3JtYXRpb24gY2FuCj4g
ZWl0aGVyIGJlIHNwZWNpZmllZCBpbiB0aGUgcGxhdGZvcm0gZGF0YSBvciB2aWEgZGV2aWNlLXRy
ZWUuCj4KPiBUZXN0ZWQgd2l0aDoKPiAgICAgICAgIE5ldGdlYXIgRVg2MTUwdjIgKElQUTQwMTgg
LSBwcmUtY2FsaWJyYXRpb24gbWV0aG9kKQo+ICAgICAgICAgVFAtTGluayBBcmNoZXIgQzcgdjIg
KFFDQTk4ODB2MiAtIG9sZCBjYWxpYnJhdGlvbiBtZXRob2QpCj4KPiBDYzogUm9iZXJ0IE1hcmtv
IDxyb2JpbWFya29AZ21haWwuY29tPgo+IENjOiBUaGliYXV0IFZBUsOITkUgPGhhY2tzQHNsYXNo
ZGlydC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlA
Z21haWwuY29tPgo+IC0tLQo+Cj4gdjEgLT4gdjI6Cj4gCS0gdXNlICV6dSBhbmQgJXUgaW4gdGhl
IGZvcm1hdCBzdHJpbmcgZm9yIHNpemVfdAo+ICAgICAgICAgICBhbmQgdTMyIHR5cGVzIChjYXRj
aGVkIGJ5IHRoZSAia2VybmVsIHRlc3Qgcm9ib3QiKS4KPiAJLSByZXdvcmRlZCBjb21taXQgbWVz
c2FnZSArIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gUUNBOTg4MHYyCj4KPiBJIHBsYWNlZCB0aGUg
bnZtZW0gY29kZSBpbiBmcm9udCBvZiB0aGUgY3VycmVudCAiZmlsZSIgbWV0aG9kCj4gKGZpcm13
YXJlX3JlcXVlc3QpLiBSZWFzb24gaXMgdGhhdCB0aGlzIG1ha2VzIGl0IGVhc2llciBmb3IgbWUK
PiB0byB0ZXN0IGl0LiBJZiBuZWVkZWQgaXQgY2FuIGJlIG1vdmVkIHRvIGEgZGlmZmVyZW50IHBs
YWNlLgoKTG9va3MgZ29vZCB0byBtZS4gQmVmb3JlIEkgYXBwbHkgdGhpcywgSSB3YW50IHRvIG1l
bnRpb24gdG8gdGhhdCBJIGhhdmUKaGFkIGEgbG9uZyBpbiBteSBkZWZlcnJlZCBxdWV1ZSByZWxh
dGVkIHR3byBwYXRjaHNldHM6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
bGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMDA5MjcxOTI1MTUuODYtMS1hbnN1ZWxzbXRoQGdtYWls
LmNvbS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNz
L3BhdGNoLzIwMjAwOTI3MTkyNTE1Ljg2LTItYW5zdWVsc210aEBnbWFpbC5jb20vCgpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMDA5
MTgxODExMDQuOTgtMS1hbnN1ZWxzbXRoQGdtYWlsLmNvbS8KaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjAwOTE4MTgxMTA0Ljk4LTIt
YW5zdWVsc210aEBnbWFpbC5jb20vCgpDaHJpc3RpYW4sIHdlIGRvbid0IG5lZWQgdGhvc2UgYW55
bW9yZSwgcmlnaHQ/IEV4cGVjdCB0aGUgZmlyc3QgcGF0Y2gKbWF5YmUuCgotLSAKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczov
L3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3Vi
bWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

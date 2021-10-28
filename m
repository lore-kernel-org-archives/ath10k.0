Return-Path: <SRS0=1Jc9=PQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D77CC433F5
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215CE60249
	for <ath10k@archiver.kernel.org>; Thu, 28 Oct 2021 11:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 215CE60249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2xN52kObZoINyL1+YN7TkwQg/v4OggxYYeBLgI51ok=; b=XjrojtZYVEOUJS
	dKuG9pVH9kbJZAEbTv38uVu5R3MhLQAmmYrboi1B7NA1pRypoReyjFrU9l5Tm+EMlaWzjWm7UF06+
	3pcdTqZceO2uQmgtNIHzL5AD8P5+q4VjqWlqhK2A1UcYNO3Pg4BnLnQ5J6INORep0iUOwg3lMy4ZT
	Shoo+7KjmcVh6iGVyNk9zTeraFF2IYQY5m/g0jIYqBatuPpyRvA6N7HlrklZf53hrqrTDvbAuroyA
	KPvbcHLYK1/9iWZx+anEx6AyHKidCW5bYYZtPG+JTArXeVyO+mipKyYBTAW6DkxWjsS0optQhUlsh
	7psOexwbhG5I8XMIZwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg3lY-007iS2-DG; Thu, 28 Oct 2021 11:40:16 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg3lV-007iRU-Bq
 for ath10k@lists.infradead.org; Thu, 28 Oct 2021 11:40:15 +0000
Received: by mail-lj1-x232.google.com with SMTP id e2so10094578ljg.13
 for <ath10k@lists.infradead.org>; Thu, 28 Oct 2021 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EPO/PX8P5pmEDcwaoHZ4NGvxtgVrTPN3Xr1ZeWVcQyo=;
 b=ixrOqryvaeOSQXpt3O/J1Q3ZXT3Zu6bTLc1dI8IjsUPGeQQFIAsrQ9RIA4ASR6R6rV
 Hd0ezGPMrvnl5k+gPF+8nmopWRVo++rY1DgakoRKQpDZIpeLUxJsdfvwy0cNgr067aY+
 GgPyds6TObuPEoIL0zlonP9dmSbiWdbODJNvEDVRp2T+k32AtUJs9PRKqXshKRcV6HUI
 DUhEqV3sze2+tbomPW2viZbKhb/YTuZBn717MoDCd8e3qv/+lnvWq29zwQ/92k7vtiJP
 zRVEQDiP0vG4VSwEDfuH5vZGE0CeFVBtcQBaiU36K/o+3CZVC+j4rj2AYePdNyHJL9Ex
 9uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EPO/PX8P5pmEDcwaoHZ4NGvxtgVrTPN3Xr1ZeWVcQyo=;
 b=7XfIHQN11N9C44o5Rq10iZbQRLmcPklP+3jzfDwJXbWgUmmKi7Qt+8+cSdEW1FPsCE
 vkao+4tYtMxia77ILqoAVbD7zQ0h4vatNz7Su/4QbcT0NnUZyVEJY5FT9fGsiLWW9D8r
 iHlfx5cn4V8qz4cIpOzhyTqh2wQISzezL17K4T65u0pXL6olNL5dEtgZMstNtTUo4QJT
 lGJ1f3MWl42daZd69XEY5jrt9Yqs56KzIFtBHU9pCOL6PVM1nuEeGumB8QxI8ZSE+Cwy
 Wn+tLoxdBUEMMYYxl2K3K1cGtWGpJod9g96G+UGoTBbypPT/ynYoAp6zP+wNy8tu3wOZ
 6MmA==
X-Gm-Message-State: AOAM533umQ2t6NVAme4iyZDuvPgDr8FtQvIklc6TjX0YwOoUGcgPy+VJ
 FbBv70Pculq5rH15J2nhc1kj/jajuilk4ZWwVingQlkeHwQ=
X-Google-Smtp-Source: ABdhPJw9ppDKOlSn9mDamAid1FcMBK+j3nbvg5BNuyUWxO4KLqJGVEnwX5aGOcV4NHZonB4SXUTUdgmyIEO5lPih7Ik=
X-Received: by 2002:a2e:9015:: with SMTP id h21mr4179495ljg.264.1635421210214; 
 Thu, 28 Oct 2021 04:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211016234609.1568317-1-chunkeey@gmail.com>
 <87ee855xwa.fsf@codeaurora.org>
 <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
In-Reply-To: <3a8840ea-1499-950b-fb44-7546a32c586f@gmail.com>
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Thu, 28 Oct 2021 13:39:59 +0200
Message-ID: <CA+_ehUwi45irFZCadx-XRnW_+jJac7wWcPJ2756K8xjFsDx4Ow@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_044013_436836_38EE7A67 
X-CRM114-Status: GOOD (  31.55  )
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

Pgo+IE9uIDI4LzEwLzIwMjEgMTA6NTgsIEthbGxlIFZhbG8gd3JvdGU6Cj4gPiBDaHJpc3RpYW4g
TGFtcGFydGVyIDxjaHVua2VleUBnbWFpbC5jb20+IHdyaXRlczoKPiA+Cj4gPj4gQVRIMTBLIGNo
aXBzIGFyZSB1c2VkIGl0IHdpZGUgcmFuZ2Ugb2Ygcm91dGVycywKPiA+PiBhY2Nlc3Nwb2ludHMs
IHJhbmdlIGV4dGVuZGVycywgbmV0d29yayBhcHBsaWFuY2VzLgo+ID4+IE9uIHRoZXNlIGVtYmVk
ZGVkIGRldmljZXMsIGNhbGlicmF0aW9uIGRhdGEgaXMgb2Z0ZW4KPiA+PiBzdG9yZWQgb24gdGhl
IG1haW4gc3lzdGVtJ3MgZmxhc2ggYW5kIHdhcyBvdXQgb2YgcmVhY2gKPiA+PiBmb3IgdGhlIGRy
aXZlci4KPiA+Pgo+ID4+IFRvIGJyaWRnZSB0aGlzIGdhcCwgYXRoMTBrIGlzIGdldHRpbmcgZXh0
ZW5kZWQgdG8gcHVsbAo+ID4+IHRoZSAocHJlLSljYWxpYnJhdGlvbiBkYXRhIHRocm91Z2ggbnZt
ZW0gc3Vic3lzdGVtLgo+ID4+IFRvIGRvIHRoaXMsIGEgbnZtZW0tY2VsbCBjb250YWluaW5nIHRo
ZSBpbmZvcm1hdGlvbiBjYW4KPiA+PiBlaXRoZXIgYmUgc3BlY2lmaWVkIGluIHRoZSBwbGF0Zm9y
bSBkYXRhIG9yIHZpYSBkZXZpY2UtdHJlZS4KPiA+Pgo+ID4+IFRlc3RlZCB3aXRoOgo+ID4+ICAg
ICAgICAgIE5ldGdlYXIgRVg2MTUwdjIgKElQUTQwMTggLSBwcmUtY2FsaWJyYXRpb24gbWV0aG9k
KQo+ID4+ICAgICAgICAgIFRQLUxpbmsgQXJjaGVyIEM3IHYyIChRQ0E5ODgwdjIgLSBvbGQgY2Fs
aWJyYXRpb24gbWV0aG9kKQo+ID4+Cj4gPj4gQ2M6IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdt
YWlsLmNvbT4KPiA+PiBDYzogVGhpYmF1dCBWQVLDiE5FIDxoYWNrc0BzbGFzaGRpcnQub3JnPgo+
ID4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBMYW1wYXJ0ZXIgPGNodW5rZWV5QGdtYWlsLmNv
bT4KPiA+PiAtLS0KPiA+Pgo+ID4+IHYxIC0+IHYyOgo+ID4+ICAgICAgLSB1c2UgJXp1IGFuZCAl
dSBpbiB0aGUgZm9ybWF0IHN0cmluZyBmb3Igc2l6ZV90Cj4gPj4gICAgICAgICAgICBhbmQgdTMy
IHR5cGVzIChjYXRjaGVkIGJ5IHRoZSAia2VybmVsIHRlc3Qgcm9ib3QiKS4KPiA+PiAgICAgIC0g
cmV3b3JkZWQgY29tbWl0IG1lc3NhZ2UgKyBzdWNjZXNzZnVsbHkgdGVzdGVkIG9uIFFDQTk4ODB2
Mgo+ID4+Cj4gPj4gSSBwbGFjZWQgdGhlIG52bWVtIGNvZGUgaW4gZnJvbnQgb2YgdGhlIGN1cnJl
bnQgImZpbGUiIG1ldGhvZAo+ID4+IChmaXJtd2FyZV9yZXF1ZXN0KS4gUmVhc29uIGlzIHRoYXQg
dGhpcyBtYWtlcyBpdCBlYXNpZXIgZm9yIG1lCj4gPj4gdG8gdGVzdCBpdC4gSWYgbmVlZGVkIGl0
IGNhbiBiZSBtb3ZlZCB0byBhIGRpZmZlcmVudCBwbGFjZS4KPiA+Cj4gPiBMb29rcyBnb29kIHRv
IG1lLiBCZWZvcmUgSSBhcHBseSB0aGlzLCBJIHdhbnQgdG8gbWVudGlvbiB0byB0aGF0IEkgaGF2
ZQo+ID4gaGFkIGEgbG9uZyBpbiBteSBkZWZlcnJlZCBxdWV1ZSByZWxhdGVkIHR3byBwYXRjaHNl
dHM6Cj4KPgo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL3BhdGNoLzIwMjAwOTI3MTkyNTE1Ljg2LTEtYW5zdWVsc210aEBnbWFpbC5jb20vCj4g
PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0
Y2gvMjAyMDA5MjcxOTI1MTUuODYtMi1hbnN1ZWxzbXRoQGdtYWlsLmNvbS8KPiBPaCBvaywgc2Vy
dmVzIG1lIHJpZ2h0IGZvciBub3QgbG9va2luZyB0aG9yb3VnaGx5IGdvb2dsaW5nIHRoaXMgZmly
c3QuCj4gQWxiYW4gQmVkZWwgYW5kIEFuc3VlbCdzIHdvcmsgbWFkZSB0aGlzIG52bWVtIGFsbCBw
b3NzaWJsZS4gQW5kIGluZGVlZCwKPiB0aGUgc2Vjb25kIHBhdGNoIGhlcmUgbG9va3MgZWVyaWUg
c2ltaWxhci4KPgo+IERvIHlvdSB3YW50IHRvIGdvIHdpdGggaGlzIHR3byBwYXRjaGVzIGluc3Rl
YWQ/IEknbGwgY2hhbmdlIG1pbmUsIHNvIGl0Cj4ganVzdCBjb25zaXN0cyBvZiB0aGUgY2FsX21v
ZGUgZm9yIHRoZSBvbGRlciBRQ0E5ODgwdjIsUUNBOTg4NyBhbmQKPiBhZGQgdGhlIC1FUFJPQkVf
REVGRVIgaGFuZGxpbmcuIFRoaXMgLUVQUk9CRV9ERUZFUiBvbmx5IGV2ZXIgY29tZXMgdXAKPiB3
aXRoIHRoZSBNZXJha2kgZ2Vhci4gVGhpcyBpcyBiZWNhdXNlIE1lcmFraSBsaWtlcyBwdXR0aW5n
IHRoZSBNQUNzLVZhbHVlcwo+IGludG8gU29DLWNvbm5lY3RlZCBBVDI0IGVlcHJvbXMtY2hpcHMu
IEV2ZXJ5b25lIGVsc2UganVzdCBoYXZlIHRoZW0gaW4gYQo+IHByb3BlciBGTEFTSCBwYXJ0aXRp
b24uIFRob3VnaCwgdGhpcydzIHVzdWFsbHkgbm90aGluZyBtb3JlIHRoYW4gYWRkaW5nCj4gdGhl
IGZvbGxvd2luZyBsaW5lOgo+Cj4gaWYgKHJldCA9PSAtRVBST0JFUl9ERUZFUikKPiAgICAgICAg
IHJldHVybiByZXQ7Cj4KClRoZSAyIHBhdGNoIGhhcyB0byBjaGFuZ2UgdG8gdXNlIHRoZSBudm1l
bSBhcGkuClRoZSBtdGQgb25lIGlzIHByZXNlbnQgaW4gYXRoMTBrLWN0IGFuZCBsb29rcyB0byB3
b3JrIHdlbGwgb24gbXkgZGV2aWNlcy4KQXQgdGltZXMgSSBhbHNvIHRlc3RlZCBvbmUgaW1wbGVt
ZW50YXRpb24gdGhhdCB1c2VkIG52bWVtIGFwaSB0byBmZXRjaCBjYWwKZGF0YSBmcm9tIG52bWVt
IHVzaW5nIGEgc3BlY2lmaWMgbnZtZW0gY2VsbCBuYW1lIHBhc3NlZCBpbiB0aGUgZHRzIGFuZCBp
dApkaWQgd29yayBqdXN0IHJpZ2h0LgpBbHNvIHdpdGggcmVjZW50IGNoYW5nZXMgdG8gbnZtZW0g
YXBpIHRoZSBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlIGFuZCB0aGUKcGRldiBjaGVjayBhcmUg
bm90IG5lZWRlZCBhbnltb3JlIGFyZSB0aGUgbnZtZW0gY2FuIGZpbmQgY2VsbCBhbHNvIGlmIHRo
ZQpwbGF0Zm9ybSBpcyBub3QgcmVnaXN0ZXJlZAoKPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDIwMDkxODE4MTEwNC45OC0xLWFu
c3VlbHNtdGhAZ21haWwuY29tLwo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjAwOTE4MTgxMTA0Ljk4LTItYW5zdWVsc210aEBn
bWFpbC5jb20vCj4KPiBBbnN1ZWwncyBwb3N0OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMDA5MTgxODExMDQuOTgtMi1hbnN1ZWxz
bXRoQGdtYWlsLmNvbS8jMjM2MzkzNjEKPiAgPiBZb3UgYXJlIHJpZ2h0IGFib3V0IG52bWVtLi4u
IFByb2JsZW0gaXMgdGhhdCBudm1lbSBmb3IgbXRkIGlzIHN0aWxsIG5vdAo+ICA+IHN1cHBvcnRl
ZC4gSSBhbHJlYWR5IHNlbnQgYSBwYXRjaCB0byBmaXggdGhpcyBpbiB0aGUgbXRkIG1haWxpbmcg
bGlzdCBidXQKPiAgPiBJJ20gd2FpdGluZyBmb3IgcmV2aWV3Li4uCj4gID4gSWYgdGhhdCB3aWxs
IGJlIGFjY2VwdGVkLCBJIGNhbiBjb252ZXJ0IHRoaXMgcGF0Y2ggdG8gdXNlIG52bWVtIGFwaS4K
Pgo+IFRoZSBudm1lbSBhcGkgaXMgdGhlcmUgKHdoaWNoIG1ha2VzIHRoZXNlIHR3byBwYXRjaGVz
IG9ic29sZXRlIEkgdGhpbmspLgo+IEdyYW50ZWQ6IFRoZSBudm1lbSBjYW4ndCBkbyBhbGwgdGhl
IHNhbWUgY2FzZXMgKEZyb20gd2hhdCBJIGtub3csIG10ZAo+IHBhcnRpdGlvbnMgc3BsaXR0ZXJz
IGFuZCBtdGRwYXJ0cyB0aHJvdWdoIGNvbW1hbmRsaW5lIGlzIGJlaW5nIHdvcmtlZCBvbi4KPiBC
dXQgd2UgYWx3YXlzIGhhdmUgdXNlcnNwYWNlICsgZmlybXdhcmVfcmVxdWVzdCBhcyBhIGZhbGxi
YWNrKS4KPgo+IENoZWVycywKPiBDaHJpc3RpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK

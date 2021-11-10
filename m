Return-Path: <SRS0=JVk6=P5=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C72BC433EF
	for <ath10k@archiver.kernel.org>; Wed, 10 Nov 2021 13:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F6361211
	for <ath10k@archiver.kernel.org>; Wed, 10 Nov 2021 13:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7F6361211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmqsddUFbYtSXqnWRp+5mwsROkZBHRhn532SGsD/23M=; b=z4Dk1xe1YnN3Uw
	TvvN0usWFf6dgLG4trBHCULbvUsRvbJOyuwg0X52MQosCM5yNlDyJlQpId6bJ24X7Hq9lNwFlRLTa
	ySoUiPntWkO+7SWum2msUlnIIlfVBRq6rb1/eUNJohLOrHOJ3+OB0NwoMuv9ZNNPoj5dedXhvzlSh
	mz72xMNrLOQ5jc1aIha9+Wg9pIalif4xsYT3NOw1A9DBtpkh3tsVQ7AAg0HERfEj6kqNC6p9I0p7B
	dFHwTvuoF3kAm6l8iqA1KFvE46jDkGjXqzhLR7qC2bbdQqHogDYL5zge/Xad1TCIJJvapRkNgVIRg
	3OC1ycbf8q2GSFEfRFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mknnu-005Zon-F7; Wed, 10 Nov 2021 13:38:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mknnq-005Zmd-Iq
 for ath10k@lists.infradead.org; Wed, 10 Nov 2021 13:38:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636551492; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=7B862f6o0/eR9spFIWw0jZNTKRZeuG0U4+f110DkEyw=;
 b=TuF3862AQnXHrOddDIjx7cZllNKXXeSvr2N+Y7Fzvo6xNyg5V8es86AIQ2pYhDis2zMvbs6R
 jBTZQ0aXslwL/QtKy4BvnIzMAOortRpP7esXJ00arypROWEoMiVqziWgnQ//Bh1VArR59KPg
 1/uD5+UF9n0Oym6uLeMix/YzxkU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 618bcb41b882f8ab2f4e6a83 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 13:38:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5582C43616; Wed, 10 Nov 2021 13:38:08 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C533EC43460;
 Wed, 10 Nov 2021 13:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C533EC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Francesco Magliocca <franciman12@gmail.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, enrico@fracta.dev
Subject: Re: [PATCH] ath10k: abstract htt_rx_desc structure
References: <CAH4F6us6kLs4WZVKVNQV69wZ=BA2AzOyacyKLB3RfVme=9uKvA@mail.gmail.com>
 <27297ff6-d970-7b9a-01f0-d5261d553e6b@leemhuis.info>
Date: Wed, 10 Nov 2021 15:38:03 +0200
In-Reply-To: <27297ff6-d970-7b9a-01f0-d5261d553e6b@leemhuis.info> (Thorsten
 Leemhuis's message of "Tue, 9 Nov 2021 09:53:13 +0100")
Message-ID: <87wnlgm8qs.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_053814_711804_35FA6443 
X-CRM114-Status: GOOD (  19.84  )
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

VGhvcnN0ZW4gTGVlbWh1aXMgPHJlZ3Jlc3Npb25zQGxlZW1odWlzLmluZm8+IHdyaXRlczoKCj4g
T24gMDguMTEuMjEgMTc6MjUsIEZyYW5jZXNjbyBNYWdsaW9jY2Egd3JvdGU6Cj4+IFFDQTYxNzQg
Y2FyZCBvZnRlbiBoYW5ncyB3aXRoIHRoZSBjdXJyZW50IGh0dF9yeF9kZXNjCj4+IG1lbW9yeSBs
YXlvdXQgaW4gc29tZSBjaXJjdW1zdGFuY2VzLCBiZWNhdXNlIGl0cyBmaXJtd2FyZQo+PiBmYWls
cyB0byBoYW5kbGUgbGVuZ3RoIGRpZmZlcmVuY2VzLgo+PiBUaGVyZWZvcmUgd2UgbXVzdCBhYnN0
cmFjdCB0aGUgaHR0X3J4X2Rlc2Mgc3RydWN0dXJlCj4+IGFuZCBvcGVyYXRpb25zIG9uIGl0LCB0
byBhbGxvdyBkaWZmZXJlbnQgd2lyZWxlc3MgY2FyZHMKPj4gdG8gdXNlIGRpZmZlcmVudCwgdW5y
ZWxhdGVkIHJ4IGRlc2NyaXB0b3Igc3RydWN0dXJlcy4KPj4gCj4+IERlZmluZSBhIGJhc2UgaHR0
X3J4X2Rlc2Mgc3RydWN0dXJlIGFuZCBodHRfcnhfZGVzY19xY2Ffb2xkCj4+IGZvciB1c2Ugd2l0
aCB0aGUgUUNBIGZhbWlseSBvZiBhdGgxMGsgc3VwcG9ydGVkIGNhcmRzCj4+IGFuZCBodHRfcnhf
ZGVzY19uZXcgZm9yIHVzZSB3aXRoIHRoZSBXQ04zOTkwIGNhcmQuCj4+IAo+PiBEZWZpbmUgaHR0
X3J4X2Rlc2Nfb3BzIHdoaWNoIGNvbnRhaW5zIHRoZSBhYnN0cmFjdCBvcGVyYXRpb25zCj4+IHRv
IGFjY2VzcyB0aGUgZ2VuZXJpYyBodHRfcnhfZGVzYywgZ2l2ZSBpbXBsZW1lbnRhdGlvbnMKPj4g
Zm9yIGVhY2ggY2FyZCBhbmQgdXBkYXRlIGh0dF9yeC5jIHRvIHVzZSB0aGUgZGVmaW5lZAo+PiBh
YnN0cmFjdCBpbnRlcmZhY2UgdG8gcnggZGVzY3JpcHRvcnMuCj4+IAo+PiBGaXhlczogZTNkZWY2
ZjcgKCJhdGgxMGs6IFVwZGF0ZSByeCBkZXNjcmlwdG9yIGZvciBXQ04zOTkwIHRhcmdldCIpCgpU
aGlzIHNob3VsZCBiZToKCkZpeGVzOiBlM2RlZjZmN2RkZjggKCJhdGgxMGs6IFVwZGF0ZSByeCBk
ZXNjcmlwdG9yIGZvciBXQ04zOTkwIHRhcmdldCIpCgpJIGNhbiBmaXggdGhhdCBkdXJpbmcgY29t
bWl0LgoKPj4gVGVzdGVkLW9uOiBRQ0E2MTc0IGh3My4yIFBDSSBXTEFOLlJNLjQuNC4xLTAwMTU3
LVFDQVJNU1dQWi0xCj4+IAo+PiBDby1kZXZlbG9wZWQtYnk6IEVucmljbyBMdW1ldHRpIDxlbnJp
Y29AZnJhY3RhLmRldj4KPj4gU2lnbmVkLW9mZi1ieTogRW5yaWNvIEx1bWV0dGkgPGVucmljb0Bm
cmFjdGEuZGV2Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGcmFuY2VzY28gTWFnbGlvY2NhIDxmcmFuY2lt
YW4xMkBnbWFpbC5jb20+Cj4KPiBBcyBhIExpbnV4IGtlcm5lbCByZWdyZXNzaW9uIHRyYWNrZXIg
bGV0IG1lIHVzZSB0aGlzIG9wcG9ydHVuaXR5IGFuZAo+IHNheTogVGhhbmtzIGZvciB3b3JraW5n
IG9uIGEgZml4IGZvciB0aGlzIHJlZ3Jlc3Npb24uCj4KPiBUaGVyZSBpcyBvbmUgc21hbGwgZGV0
YWlsIHRoYXQgY291bGQgYmUgaW1wcm92ZWQ6IHRoZSBjb21taXQgbWVzc2FnZQo+IHdvdWxkIGJl
bmVmaXQgZnJvbSBhIGxpbmsgdG8gdGhlIHJlZ3Jlc3Npb24gcmVwb3J0LiBUaGlzIGlzIGV4cGxh
aW5lZCBpbgo+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0LCB3
aGljaCByZWNlbnRseSB3YXMgY2hhbmdlZAo+IHNsaWdodGx5IHRvIG1ha2UgdGhpcyBhc3BlY3Qg
Y2xlYXJlcjoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL2xpbnVzLzFmNTdiZDQyYjc3Ywo+Cj4g
RS5nLiBhZGQgc29tZXRoaW5nIGxpa2UgdGhpcywganVzdCAqd2l0aG91dCogdGhlIGxlYWRpbmcg
Y2FyZXQowrkpOgo+Cj4gXkxpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYXRoMTBrL0NB
SDRGNnVzRnU4LUE2azVaN3JVOV9faUVOY1NDNlpyLU50UmhoX2F5cFI3NFV2TjF1UUBtYWlsLmdt
YWlsLmNvbS8KPgo+IEZyYW5jZXNjbywgY291bGQgeW91IHBsZWFzZSBkbyB0aGlzIGluIGNhc2Ug
eW91IG5lZWQgdG8gc2VudCBhbiBpbXByb3ZlZAo+IHZlcnNpb24gZm9yIG90aGVyIHJlYXNvbnM/
IEFuZCBpZiB0aGUgcGF0Y2ggaXMgYWxyZWFkeSBnb29kIHRvIGdvOiBjb3VsZAo+IHRoZSBzdWJz
eXN0ZW0gbWFpbnRhaW5lciBwbGVhc2UgYWRkIGl0IHdoZW4gYXBwbHlpbmc/CgpJIGhhdmUgbm90
IGhhZCBhIGNoYW5jZSB0byByZXZpZXcgdGhlIHBhdGNoIHlldCwgYnV0IEkgY2FuIGFkZCB0aGUg
bGluawpkdXJpbmcgY29tbWl0IChpZiBJJ2xsIGFwcGx5IHRoaXMgdmVyc2lvbikuCgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

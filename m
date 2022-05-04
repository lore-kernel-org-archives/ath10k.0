Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA58DC433F5
	for <ath10k@archiver.kernel.org>; Wed,  4 May 2022 07:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlUpRxeDZi5OPdG9e+kIpOFscfziSTiGjmEt4ruuvXg=; b=pY5U8Ks1M5hiyN
	qlsVLfb0QjyMMcmsY5LTZIW8UkxOTHIyw87yI5X+pHFsnmGzlOBbnA/PAUgwDUq6504/zTTzaYzxP
	d9rgjCTdxiLpal6Gi7oFCr3mdJiXxeACWZxalnNrVhNQR6CQ+obpiiQ7q99gS4+hObdjnhQTc9uhk
	/T6H4CPytzvcLhX2T1f5abgLCkwPUHVRjZHueEIOscL8cZuJ8T+0Z/pEQ1aLgExEnwLzydROB5MUX
	Gg4hmquh0VkKyHw0+FGoMySpBMKujujjJVnh7onYRxPVAii6DFcZ1kJeSj/GEoen4ya5nXeOHi1ac
	VMGyNsPnoLHzpkY0+bqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9kA-009JhZ-66; Wed, 04 May 2022 07:48:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9k6-009Jgj-N0
 for ath10k@lists.infradead.org; Wed, 04 May 2022 07:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69549B821D5;
 Wed,  4 May 2022 07:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15143C385A5;
 Wed,  4 May 2022 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651650492;
 bh=m64RQCqyjvzWxiO7fknKK0SA5V08XscCrerNlOARsp8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=QJlVydFQ9EKJEIznsNdV8CBg4DU9tA4As27tQIGFCjanNC2wgU3vtgxXZKEePDbmr
 ChPd9gy5ScO9j41YNrdidOUGpLoeOe5pSpARmg/IPtcaPkzf2ytMqawGVrqK21ovW2
 fbj3q2xVaW8k03juchaWUT3v/SPVf9uPo8Hz+Eb/EF7Q6FFCdNucVNCFGSR65R4KpO
 puq0ERGTRPtJoQD8pIoaMn4MDzl02AkC/QKQv5hvxSQPgh3OkBLBxEzSE2PU1WcQDq
 9aieKNA66bMP4v0sa+kDzUl2LE1wvK97Z9kHqzuyOhIVh13OzWiB6bcV+pgxHIMJuw
 2JuRoJ75jYbBw==
From: Kalle Valo <kvalo@kernel.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Thibaut <hacks@slashdirt.org>, Christian Lamparter <chunkeey@gmail.com>,
 davem@davemloft.net, kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
 <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
 <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
 <70a8dd7a-851d-686b-3134-50f21af0450c@gmail.com>
 <7DCB1B9A-D08E-4837-B2FE-6DA476B54B0D@slashdirt.org>
 <CAOX2RU7kF8Da8p_tHwuE-8YMXr5ZtWU2iL6ZY+UR+1OvGcyn+w@mail.gmail.com>
Date: Wed, 04 May 2022 10:48:04 +0300
In-Reply-To: <CAOX2RU7kF8Da8p_tHwuE-8YMXr5ZtWU2iL6ZY+UR+1OvGcyn+w@mail.gmail.com>
 (Robert Marko's message of "Tue, 3 May 2022 17:58:03 +0200")
Message-ID: <87sfppagcr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_004815_054643_8DB3E437 
X-CRM114-Status: GOOD (  23.55  )
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

Um9iZXJ0IE1hcmtvIDxyb2JpbWFya29AZ21haWwuY29tPiB3cml0ZXM6Cgo+IE9uIFdlZCwgMTYg
RmViIDIwMjIgYXQgMjI6NTUsIFRoaWJhdXQgPGhhY2tzQHNsYXNoZGlydC5vcmc+IHdyb3RlOgo+
Pgo+PiBIaSwKPj4KPj4gPiBMZSAxNiBmw6l2ci4gMjAyMiDDoCAyMjoxOSwgQ2hyaXN0aWFuIExh
bXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiBhIMOpY3JpdCA6Cj4+ID4KPj4gPiBIaSwKPj4g
Pgo+PiA+IE9uIDE2LzAyLzIwMjIgMTQ6MzgsIFJvYmVydCBNYXJrbyB3cm90ZToKPj4gPj4gU2ls
ZW50IHBpbmcsCj4+ID4+IERvZXMgYW55Ym9keSBoYXZlIGFuIG9waW5pb24gb24gdGhpcz8KPj4g
Pgo+PiA+IEFzIGEgZmFsbGJhY2ssIEkndmUgY29iYmxlZCB0b2dldGhlciBmcm9tIHRoZSBvbGQg
c2NyaXB0cyB0aGF0Cj4+ID4gImNvbmNhdCBib2FyZC5iaW4gaW50byBhIGJvYXJkLTIuYmluLiBE
byB0aGlzIG9uIHRoZSBkZXZpY2UKPj4gPiBpbiB1c2Vyc3BhY2Ugb24gdGhlIGZseSIgaWRlYS4g
VGhpcyB3YXMgc3VjY2Vzc2Z1bGx5IHRlc3RlZAo+PiA+IG9uIG9uZSBvZiB0aGUgYWZmZWN0ZWQg
ZGV2aWNlcyAoTWlrcm9UaWsgU1hUc3EgNSBhYyAoUkJTWFRzcUctNWFjRCkpCj4+ID4gYW5kIHNo
b3VsZCB3b3JrIGZvciBhbGwgTWlrcm9UaWsuCj4+ID4KPj4gPiAiaXBxNDB4eDogZHluYW1pY2Fs
bHkgYnVpbGQgYm9hcmQtMi5iaW4gZm9yIE1pa3JvdGlrIgo+PiA+IDxodHRwczovL2dpdC5vcGVu
d3J0Lm9yZy8/cD1vcGVud3J0L3N0YWdpbmcvY2h1bmtlZXkuZ2l0O2E9Y29tbWl0O2g9NTJmMzQw
N2Q5NGRhNjJiOTliYTZjMDlmMzY2MzQ2NGNjY2QyOWI0Zj4KPj4gPiAodGhvdWdoIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBsaW5rIHdpbGwgc3RheSBhY3RpdmUgZm9yCj4+ID4gdG9vIGxvbmcuKQo+Pgo+
PiBJTUhPIFJvYmVydOKAmXMgcGF0Y2ggYWRkcmVzc2VzIGFuIGFjdHVhbCBidWcgaW4gYXRoMTBr
IHdoZXJlYnkgdGhlCj4+IGRyaXZlciBzZW5kcyB0aGUgc2FtZSBkZXZwYXRoIGZvciB0d28gZGlm
ZmVyZW50IGRldmljZXMgd2hlbgo+PiByZXF1ZXN0aW5nIGJvYXJkLTEgQkRGLCB3aGljaCBkb2Vz
buKAmXQgc2VlbSByaWdodC4KPj4KPj4gWW91ciBwcm9wb3NhbCBpcyBsZXNzIHN0cmFpZ2h0Zm9y
d2FyZCB0aGFuIHVzaW5nIHVubW9kaWZpZWQgYm9hcmQtMQo+PiBkYXRhIChhcyBjb3VsZCBiZSBk
b25lIGlmIHRoZSBhYm92ZSBidWcgZGlkIG5vdCBvY2N1cikgYW5kIG5lZ2F0ZXMKPj4gdGhlIHBy
ZXZpb3VzIGVmZm9ydHMgbm90IHRvIHN0b3JlIHRoaXMgZGF0YSBvbiBmbGFzaCAodXNpbmcgaW5z
dGVhZAo+PiB0aGUga2VybmVs4oCZcyBkb2N1bWVudGVkIGZpcm13YXJlIHN5c2ZzIGxvYWRpbmcg
ZmFjaWxpdHkgLSBhZ2Fpbgo+PiBwb3NzaWJsZSB3aXRob3V0IHRoZSBhYm92ZSBpc3N1ZSkuCj4K
PiBLYWxsZSwgYW55IGNoYW5jZSBvZiByZXZpZXdpbmcgdGhpcz8gSXQganVzdCBicmluZ3MgdGhl
IGJvYXJkIGRhdGEgaW4KPiBsaW5lIHdpdGggY2FsZGF0YSBhcyBmYXIgYXMgbmFtaW5nIGdvZXMu
CgpTb3JyeSBmb3IgdGhlIGRlbGF5IGluIHJldmlldy4gU28gdGhlIG9yaWdpbmFsIGlkZWEgd2Fz
IHRoYXQgYm9hcmQuYmluCndvdWxkIGJlIG9ubHkgdXNlZCBieSBkZXZlbG9wZXJzIGZvciB0ZXN0
aW5nIHB1cnBvc2VzIG9ubHkgYW5kIG5vcm1hbAp1c2VycyB3aWxsIHVzZSB0aGUgYm9hcmQgZmls
ZSBhdXRvbWF0aWNhbGx5IGZyb20gYm9hcmQtMi5iaW4uIEl0J3MgYQpzaGFtZSBpZiBNaWtyb3Rp
ayBicm9rZSB0aGlzLCBpdCdzIG5vdCBpZGVhbCBpZiB0aGVyZSBhcmUgc28gbWFueQpkaWZmZXJl
bnQgd2F5cyB0byB1c2UgYm9hcmQgZmlsZXMuIEkgbmVlZCB0byB0aGluayBhIGJpdCBhYm91dCB0
aGlzLgoKVGhlIHBhdGNoIGlzIG5vdyBpbiBwZW5kaW5nIGJyYW5jaCBmb3IgYnVpbGQgdGVzdGlu
ZzoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2t2YWxv
L2F0aC5naXQvY29tbWl0Lz9oPXBlbmRpbmcmaWQ9ZWRhODM4YzM5NDE4NjNhNDg2ZjdmY2VkNGI3
MzlkZTZmYzgwZTg1NwoKSSBhbHNvIGZpeGVkIHR3byBjaGVja3BhdGNoIHdhcm5pbmdzOgoKZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmM6MTI1MjogbGluZSBsZW5ndGggb2Yg
OTMgZXhjZWVkcyA5MCBjb2x1bW5zCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29y
ZS5jOjEyNTM6IGxpbmUgbGVuZ3RoIG9mIDk2IGV4Y2VlZHMgOTAgY29sdW1ucwoKLS0gCmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9saXN0LwoKaHR0
cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9u
L3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==

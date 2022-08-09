Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDF1C19F2D
	for <ath10k@archiver.kernel.org>; Tue,  9 Aug 2022 06:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbL1+yj84giEsFZcUSYCfiIhAkIXQVjhAbGKEW4N8vc=; b=43FitnEBXfz7+F
	HZH34hSGJe9iPFV/C5epZwPfLR692RcelkAxEVuBWWtU+9cG2K/jB9vKB3rMKOKuZDZJ2Y6cXqq5m
	a2D3crosFL4vyyU8sZAjajdIfknFaXePIO6of+7yRJR8OEZ9FZJ18zNhR7751ws+xzvte+mCzEhD0
	txEJx9h8FxJBVwhuoxNaY52FfXSjPhvniptycVm+Om9Rq3MezFyM3pxmAAcmJnnhO7OMVISyKrGMS
	nkLKskN6eNhq2EJgVVy0q9LpFUSNNoOJ9AQ+dzet2Ky7yFsK3T/hX8F0eg602FG9nrGZ94sIAFiUZ
	4zdA+GVdtavLN94Cm3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLIX1-001r8z-9J; Tue, 09 Aug 2022 06:15:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLIWs-001r3x-Sb
	for ath10k@lists.infradead.org; Tue, 09 Aug 2022 06:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6577A611EB;
	Tue,  9 Aug 2022 06:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E15C433D6;
	Tue,  9 Aug 2022 06:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660025748;
	bh=k7OuGhnfskK7dll6V8t3jjANCTkSpibWPAEjmEo2dHA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HycFWDhiEN0sC++XhgJIpjbsg35hqKJt0/DKXHRF7tq+dxKWVgyG5oJnRNhzizy+H
	 GSsRlhsd2BUJZz0ye6lDPXr40lY51hAuqEnSg9S/SF+Yx0r/3RuXjfxMAa89BnjKPn
	 07H7fC05YUCEysa6xLgze+6xPLF9EttmN4e+X+KvpkPQhB5Cq/xWIZylFIfiI4rHwx
	 Xq1CoZ1iBpAPXJVMuKrkF/60AlzbXhu46TvxfU+GCoJ5/XXDuA98HWScXZjuRsbOpE
	 nLSmtwAtUNGSFYYXoKG1r+dYggbtOtaesiAJNd32zmaCZOewa3y9pyTuwL7PRso/MR
	 8XzD5HheKo6qQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi:ath10k: Set tx credit to one for WCN3990 snoc based
 devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220801134941.15216-1-quic_youghand@quicinc.com>
References: <20220801134941.15216-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Youghandhar Chintala <quic_youghand@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166002574373.17823.14670540192835891455.kvalo@kernel.org>
Date: Tue,  9 Aug 2022 06:15:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_231551_005149_360ADFE5 
X-CRM114-Status: GOOD (  10.37  )
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

WW91Z2hhbmRoYXIgQ2hpbnRhbGEgPHF1aWNfeW91Z2hhbmRAcXVpY2luYy5jb20+IHdyb3RlOgoK
PiBDdXJyZW50bHkgaG9zdCBjYW4gc2VuZCB0d28gV01JIGNvbW1hbmRzIGF0IG9uY2UuIFRoZXJl
IGlzIHBvc3NpYmlsaXR5IHRvCj4gY2F1c2UgU01NVSBpc3N1ZXMgb3IgY29ycnVwdGlvbiwgaWYg
aG9zdCB3YW50cyB0byBpbml0aWF0ZSAyIERNQQo+IHRyYW5zZmVycywgaXQgaXMgcG9zc2libGUg
d2hlbiBjb3B5IGNvbXBsZXRlIGludGVycnVwdCBmb3IgZmlyc3QgRE1BCj4gcmVhY2hlcyBob3N0
LCBDRSBoYXMgYWxyZWFkeSB1cGRhdGVkIFNSUkkgKFNvdXJjZSByaW5nIHJlYWQgaW5kZXgpIGZv
cgo+IGJvdGggRE1BIHRyYW5zZmVycyBhbmQgaXMgaW4gdGhlIG1pZGRsZSBvZiAybmQgRE1BLiBI
b3N0IHVzZXMgU1JSSQo+IChTb3VyY2UgcmluZyByZWFkIGluZGV4KSB0byBpbnRlcnByZXQgaG93
IG1hbnkgRE1B4oCZcyBoYXZlIGJlZW4gY29tcGxldGVkCj4gYW5kIHRyaWVzIHRvIHVubWFwL2Zy
ZWUgYm90aCB0aGUgRE1BIGVudHJpZXMuIEhlbmNlIG5vdyBpdCBpcyBsaW1pdGluZyB0bwo+IG9u
ZS5CZWNhdXNlIENFIGlzICBzdGlsbCBpbiB0aGUgbWlkZGxlIG9mIDJuZCBETUEgd2hpY2ggY2Fu
IGNhdXNlIHRoZXNlCj4gaXNzdWVzIHdoZW4gaGFuZGxpbmcgdHdvIERNQSB0cmFuc2ZlcnMuCj4g
Cj4gVGhpcyBjaGFuZ2Ugd2lsbCBub3QgaW1wYWN0IG90aGVyIHRhcmdldHMsIGFzIGl0IGlzIG9u
bHkgZm9yIFdDTjM5OTAuCj4gCj4gVGVzdGVkLW9uOiBXQ04zOTkwIGh3MS4wIFNOT0MgV0xBTi5I
TC4yLjAtMDEzODctUUNBSExTV01UUExaLTEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb3VnaGFuZGhh
ciBDaGludGFsYSA8cXVpY195b3VnaGFuZEBxdWljaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBL
YWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgoKUGF0Y2ggYXBwbGllZCB0byBhdGgt
bmV4dCBicmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtzLgoKZDgxYmJiNjg0YzI1IHdpZmk6IGF0aDEw
azogU2V0IHR4IGNyZWRpdCB0byBvbmUgZm9yIFdDTjM5OTAgc25vYyBiYXNlZCBkZXZpY2VzCgot
LSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3Bh
dGNoLzIwMjIwODAxMTM0OTQxLjE1MjE2LTEtcXVpY195b3VnaGFuZEBxdWljaW5jLmNvbS8KCmh0
dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlv
bi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

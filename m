Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B66AC433EF
	for <ath10k@archiver.kernel.org>; Mon, 21 Feb 2022 10:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgrjZax3XG99LDgJPWZ04z7dgN7mexLbTOlitDOgme0=; b=vRCg7QoCw8dE16
	UspIOAYIvt9dDL/ZSx/ou9OIjcmFnVSCmiOdvT4BCqQnjz7f5a7BcxBsou6TdqJUPTEQFfwH1qQjb
	j+b/nkAZRLsV3qaxN2mHMsSTh86ZcFAN0fGve0dBMlo3S7/kOJG6vRcJ4ypKg+rHHBVHmzc+TGibV
	1bWBo09aLpfMSoa19X2xT0VtaSmGRfkzY5dtxldZXO4Basa71+q9u83DKlr8TMPovBfEjUa4nwCrN
	4+gc7B9uI8hRE/yLjYw4gZSizYmsoBvr1uulzJAQX5VI1V5mgkAUs/D4frmCIz1/KHvj08minAtB0
	qlcsOycjpiKI3X33LhpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6I1-0057QC-WB; Mon, 21 Feb 2022 10:51:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5rW-004tRK-Jt
 for ath10k@lists.infradead.org; Mon, 21 Feb 2022 10:24:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9304B80F1A;
 Mon, 21 Feb 2022 10:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4C5C340E9;
 Mon, 21 Feb 2022 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645439047;
 bh=6s+hgRMRd1mGGSL9Zvl+8+90hKWB0EL5G7F0mNadTzo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=MtjrfxSImCQN6xpeOrz63uqubJDixtbjelbnF/EFsOhFr0Z25J99wQmKSULgReg9h
 L31eXvy6S0rODX8i79FTkHgiopSLKaDyA1YzTsnG0dQwjz7QKv9TuHT44fbPhxZAjG
 t87+oUvdR7qBojyhSpwSKAcD0gIGByttCzo9fwHHcYE/s2PwKFA/RCLXPAqy1gNmeh
 x0g+D70fWq5h8YK1NcpH6tQBjJNTxpdfaAztkTF72STdoDQcbAk7j9huQurf0nIvd2
 0DnvyCR3tn48HCA8sstUgS58AETs4KS5IzssOBXGLm2QVcQWBkYprH/hoxlCXETVcM
 b+Ju2bPQUJ4kA==
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath10k: Replace zero-length array with
 flexible-array member
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220216194807.GA904008@embeddedor>
References: <20220216194807.GA904008@embeddedor>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164543904389.26423.17294004275131018250.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:24:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_022410_877164_D164D9E3 
X-CRM114-Status: UNSURE (   8.61  )
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

Ikd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBU
aGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8g
ZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBvZiB0cmFpbGluZyBlbGVt
ZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxm
bGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNhc2VzLiBUaGUgb2xkZXIg
c3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZAo+IG5vIGxv
bmdlciBiZSB1c2VkWzJdLgo+IAo+IFsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9G
bGV4aWJsZV9hcnJheV9tZW1iZXIKPiBbMl0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC92NS4xNi9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0aC1hbmQtb25lLWVsZW1l
bnQtYXJyYXlzCj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVz
Lzc4Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJu
ZWwub3JnPgo+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxxdWljX2t2YWxvQHF1aWNpbmMuY29tPgoKUGF0
Y2ggYXBwbGllZCB0byBhdGgtbmV4dCBicmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtzLgoKOGJjNjY0
MjZjYTU0IGF0aDEwazogUmVwbGFjZSB6ZXJvLWxlbmd0aCBhcnJheSB3aXRoIGZsZXhpYmxlLWFy
cmF5IG1lbWJlcgoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC13aXJlbGVzcy9wYXRjaC8yMDIyMDIxNjE5NDgwNy5HQTkwNDAwOEBlbWJlZGRlZG9yLwoKaHR0
cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9u
L3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A29BC433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 06:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZk70sDf6Csa8oQyN5M19C7FR5RXWBm+Y2bq+bTfFqQ=; b=iihbpFm96klqcP
	L7Yiw39p/00H3sK5cJx/4X0uRNygC5Y6EMC8PtMF/ZwGEktfcYaaujsFI+4hZ7itrQvZ4sDy4SHM7
	/TG/t/WPFDtumJUKLrTNaJWHYPVDr5W+wp3npH74LK3ACRGLBSkEwIaxAAyXlcHJZ/SaiFljJ98IK
	/vOECTvCANoOJS3Lph2URIAay8EI+h/6maFy0unKCvhgQOJ9ozPtt3fAmtFnMbcUVcseqQnRy20LO
	5ge3RpbOFA7cszFcqS0KxZHZDkrYz97ud/vSTSjvGFNwlQPJlk/DzyAVKdWqGCthZQXj8iTdk1Yaz
	IV8ipUlzjd58dmExxWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nypHy-00BJcy-Rl; Wed, 08 Jun 2022 06:35:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nypHw-00BJcb-CQ
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 06:35:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D945617A1;
	Wed,  8 Jun 2022 06:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EACC3411D;
	Wed,  8 Jun 2022 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654670130;
	bh=kwT01TkNnB7ob0dcH+qkga1PipFzYUIP6dBZkk+b6xI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QKLm+sl6mbdXkMhKE3lhaubdduJOUoY55lL/rkuKEm+Jrc6l5KmQAZ20C5dzko/f+
	 dtsWT9RSJFcY7eyezcUbf5w/1/KpkUnoOyaSrrpbPLiUk8dtQ4e5eCPk+MMoGqTLDU
	 a3gMg0wIM4mdwAqvh1A2IIa5eOEWNNY7pln+W940ywRL0tVkCIKNzSngG3/YhmgCUo
	 uTBsQE8vzy0qgXoLMpNEsOzxnyiuiVxuYJEZyZ2Z8egHxFVvUilJ0fxoHxct+FdvS5
	 WwJrSs7QMSONCA7nKsp32Iux2As0PDpfEfQu1QdUdXpBtzAySkNsjopowcDEwoe93c
	 n87HUJbyjUqCQ==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?Q?Nicol=C3=B2?= Sprea <nsprea@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: Firmware 4 vs Firmware 6 for QCA6174 hw3.0
References: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
Date: Wed, 08 Jun 2022 09:35:26 +0300
In-Reply-To: <CA+BgFQXJr2FFdS5wK=it=sKck3htDXFFO50Px=scvL62xh41bw@mail.gmail.com>
	(=?utf-8?Q?=22Nicol=C3=B2?= Sprea"'s message of "Wed, 8 Jun 2022 08:12:17
 +0200")
Message-ID: <87k09rr7bl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_233532_498915_D0627FB1 
X-CRM114-Status: UNSURE (   8.52  )
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

Tmljb2zDsiBTcHJlYSA8bnNwcmVhQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBXaGF0IGFyZSB0aGUg
ZGlmZmVyZW5jZXMgYmV0d2VlbiBmaXJtd2FyZSA0IGFuZCBmaXJtd2FyZSA2IGZvciBRQ0E2MTc0
Cj4gaHczLjA/CgpUaGV5IGFyZSBqdXN0IGRpZmZlcmVudCBmaXJtd2FyZSBpbnRlcmZhY2UgdmVy
c2lvbnMgdG8gbWFpbnRhaW4KYmFja3dhcmRzIGNvbXBhdGliaWxpdHk6CgpodHRwczovL3dpcmVs
ZXNzLndpa2kua2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2F0aDEway9maXJtd2FyZSNmaXJt
d2FyZV9hcGlfdmVyc2lvbnMKClRoZSBhY3R1YWwgZmlybXdhcmUgdmVyc2lvbnMgYXJlIHN0cmlu
Z3MgbGlrZSAnV0xBTi5STS40LjQuMS0wMDI4OC1RQ0FSTVNXUFotMScuCgpodHRwczovL2dpdGh1
Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13YXJlL3RyZWUvbWFzdGVyL1FDQTYxNzQvaHczLjAvNC40
LjEKCj4gSXMgdGhlcmUgYSByZWxlYXNlIG5vdGU/CgpJZiB5b3UgYXJlIGFza2luZyByZWxlYXNl
cyBub3RlcyBmb3IgZmlybXdhcmUgcmVsZWFzZXMsIHVuZm9ydHVuYXRlbHkgbm8uCgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpo
dHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRp
b24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK

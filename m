Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AC5C4332F
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 20:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF0QqFxmnwqrhCpPUkTGMx7ArdBE23FQF43aR98WF4U=; b=i6ZSVYMF+Dw9jC
	XnMYL6sW0Mc+0TLTFJa8owzYgaMywE6D0H/+94JYJCWgLovE6IloUlWB/PnasR0YclFsjHI+/3Pbo
	v8QbY6YOmu8UvaU0lIXZnM4Xq6S0+8qtg7iyw+qwN6HVFggfO5qQGFnPE6QBpuCr576+ameTIzsAN
	kevZRWLPIxOGZV4WlQB8QOOG261T0XLZoSkZMyU4p1aF71Cb67zP6TlStYgs0ZWkUhgG20z/MmYOw
	zhIaNlhsf4COT8OFH8U5hBIdA945RtfqsWT8q+ZVfp4u+/wUW+uCFpqGori0AuqeUdmTgstCnzUCc
	gjAi6jIRMwNN3MZYQPnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKQzy-008KgV-4s; Wed, 16 Feb 2022 20:34:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKQzv-008Kg2-Fo
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 20:34:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso3452715pjh.5
 for <ath10k@lists.infradead.org>; Wed, 16 Feb 2022 12:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iwe6dEk//R9IuP/djM6G40dVnul034jHIp8QF8r0XR0=;
 b=BrGmYaDzFVlZCLvN5Oth2ItnzMAlHs1DOQ822SesSK2Oh5jI6qS4aqNad+42EY2kKb
 Ia8+hSaZ4mqQi9XOqxajxbt2sLo9H9by+N/WHQcxUA1yFiFYk9ATeu2f1uttgqFYOcpr
 x1RktQZKgCy5KR+NplaKdMWCDgeigYmlySNcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iwe6dEk//R9IuP/djM6G40dVnul034jHIp8QF8r0XR0=;
 b=G7JKkm+6sd2sBgZa6Iy5DSI9Caq7vkdWOtWeKN4LNJV7AZ7Ou0sMwZvCvBBWTFTztE
 V4BzPDArz3gy4eSpoJYS9IGeNTrcftte/F/lcO0JhGM5QnedkdM0fsViLAA8jzuhjmXj
 WncMUBK9jBecsm1vTVw7TmFbjgQ1TymuiqtjDOMb2mO0TsIf1xXNP8JEbnG6seofWuZT
 3GDjeUnClJ2P0fsfpCjyJADBCD27s2I/1V9Df9TQT+Lph/Y4NxfUSpldfaPwJ+0diJBs
 0R01mKtlumBz45N+8ETKLgHfk7WVAzff5tmwzEbZ7EeCCyYKEBfrOoj7FxjgvJexF8PJ
 NRIQ==
X-Gm-Message-State: AOAM531FeOpwBoN8cnATV6qUoAcDOIxOyIdJu0wPvTKzH3/Guk9GxQqi
 ADLhtq46ayxnOTniLZBdNsizvw==
X-Google-Smtp-Source: ABdhPJwsH0zVt+LsoY8rw3hePDyetrBIK4AyokHSO8tVCiAs2LgBt0S1V97Mw3awlO8FX1zTwc/+nA==
X-Received: by 2002:a17:902:db05:b0:14d:743f:5162 with SMTP id
 m5-20020a170902db0500b0014d743f5162mr603116plx.12.1645043638779; 
 Wed, 16 Feb 2022 12:33:58 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m21sm6259992pgh.69.2022.02.16.12.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:33:58 -0800 (PST)
Date: Wed, 16 Feb 2022 12:33:57 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ath10k: Replace zero-length array with
 flexible-array member
Message-ID: <202202161233.805BB2B7A@keescook>
References: <20220216194807.GA904008@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216194807.GA904008@embeddedor>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_123359_557401_8A8F3F82 
X-CRM114-Status: UNSURE (   9.31  )
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

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDE6NDg6MDdQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBUaGVyZSBpcyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHBy
b3ZpZGUgYSB3YXkgdG8gZGVjbGFyZQo+IGhhdmluZyBhIGR5bmFtaWNhbGx5IHNpemVkIHNldCBv
ZiB0cmFpbGluZyBlbGVtZW50cyBpbiBhIHN0cnVjdHVyZS4KPiBLZXJuZWwgY29kZSBzaG91bGQg
YWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZvciB0aGVzZQo+IGNh
c2VzLiBUaGUgb2xkZXIgc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlz
IHNob3VsZAo+IG5vIGxvbmdlciBiZSB1c2VkWzJdLgo+IAo+IFsxXSBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9GbGV4aWJsZV9hcnJheV9tZW1iZXIKPiBbMl0gaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvaHRtbC92NS4xNi9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCN6ZXJvLWxlbmd0
aC1hbmQtb25lLWVsZW1lbnQtYXJyYXlzCj4gCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0tT
UFAvbGludXgvaXNzdWVzLzc4Cj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8
Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tA
Y2hyb21pdW0ub3JnPgoKLS0gCktlZXMgQ29vawoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=

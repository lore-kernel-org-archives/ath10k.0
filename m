Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329EB606A32A
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5Dyt7+Hg;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=VGn2Bp2A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=; b=5Dyt7+HgHoBek0
	DcBIIyq8Fk/73V0W4+pQ8v8wKwjnzUu+bccqZfJpbbLzgjBMIq+6Mt29a7L9Y2Jzqq8SgE6dKtlea
	u30iQv3LwIQmmWpoT5fsDmft2NOy31cUCxDMuSjXdE8N38c+EE83HKGD6oTzYik5BK+jvTh44b7hL
	ijdNdmRYuNRzumBfE/6aSIgiMwZph00x/SEX3euN/LOeTmBZJyI4HzP1+LBWRCOhiq7+pqMlN3xJR
	jtBB+1Esw/zoX5zWWCT6WQbzP1pL3e7tmWuYIYsC9josmMKVrbjF6PiK67z30f+t/4IhgNtWEAqlW
	BPjGM1QazLCCF70p4ULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpIU-000000001SD-1RvS;
	Sat, 21 Nov 2026 17:54:46 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpIM-000000001OF-0Yz2
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 17:54:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso2301807a12.0
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283676; x=1795888476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=VGn2Bp2AsTjBQoTFVKKroR979DUxbAjCdlgDQHJpVCao7+3GMVy1+KYiGV6nUQ/arA
         8q6/JZVJEVKr6FlgIbmADrQzpEf6p6yd8bVkuw7sM/DxWRM4Ja8Fp6FwQCjuKY2A1gI6
         xJ9iDCXDKg6tuO7N75PJ5NLsD5pdX+yuXaPhCRjfIAGHqsC51Ffcy3iGeqHWAGHDCokF
         B9WBeHQMLoc60ew+WpeocTUNbf2NVTIObJfk3QBBuIL5rzCCWA07OB9Fn+EuHDGg2ttK
         kCP79W/+PlgytiCbIO62jX399xgeIUSm2bdGuyyAfiLmfoQm6MsnEhyjz/Wsad6dfJNZ
         pz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283676; x=1795888476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dpoy6DCYbkJWGbaA6ezM4nqF1VCRKH/+J0hI3FCaueg=;
        b=wbKl46IrHEDxdEED3EjYmWICe32rEpjQPkFdv5LVImNiYmVwWHULgky5V/X1yiWmGW
         yjSA6Ohlfmr8Ttb9CN85UdCODsU0HGz8W5AcVCI3XyBf/W/7pFwYCSffPVO1z3q+U3ao
         tjiylJu6PCsRbybswBBt7nfSKd2GFeybdXk/TtwDbZkKbn/OJaDC9Ccte6roG9urTtjx
         ql0QErHVlMxR1ihzyFtjWgS25+CJBmn0bOKmcHAuWnM7cxvdzmZlmKZT18PogiH1So9J
         ggXv9o1xk2Yuk//7A2A+KrigXHL7PxhhAeOXyIn9s5SltkCOYGBOI86k3cpwTEcMogFI
         sSig==
X-Forwarded-Encrypted: i=1; AL+hErH47kCW6uzkgoLKjt1CFrz+LPfHGsZjzzszNpcFutGr6+rfZzN2DQnpuWiviVYiTKZ3PAjoKXc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9igUQ75YgmLFQvq3XTd/HHw+fRbb/a8X5RI06PYIJdprzT6Usp
	jTDnpsrZaBeGUIF8odR/Zl7veCSdOnr1Owg9AynZQ20FQRt13X5eg/rUu/e7jeTTCA==
X-Gm-Gg: AZFdTZeJRD5mqAjnVHuCOI6sDrM/birSRvsLnCxTtwrDXnkS1AQiubJEP4ZY6NYXVZL
	ocdU0Tlvbf9AO8RCa0bUZ3aPiwuQ0RzKdCoSJbF9UCL/ZSt/MZLxMRGinl/vFPwEyrX/h+AUMum
	WLr3nXjtyjpeqsILqyzNEaA9euky0Tt2iX6fXAoe05oc/4s1z6nbGoz+uCrrKB2Xgpdq5iXWrq3
	MyODHRsMGxoK+AYXr10HCWOXZW+kEOMwvPxz6RxX+WI5Nfp3DfF/EXxifNQdE3wOanMuDw7sZRM
	rHwwjaGRJxUo8u0GKJyubD+zthWIm7tgKwOC3+ZitOaHqvteI+GyHpZ/BWVijSOHiueOUyml3Ih
	q/VgYMr7/9SC1AeGmPNhbAdbNx7LXcND2jdu7a7ouF/V3LunVUQIFu7Ym954KtBfuJFOmChFiu6
	EcDAAw2cKwTFa5toCuxzm9/KnAy/5OjUCkhJ++/suV99U7B6s4YcEjW9eiaykSEsAeko95acq5q
	s9N7Roemfe2Gi6Y4Jr0AhthUz6I6yKzjw+XQzdKnlslhWR3wIxwWrc5ixKk28eyqiC6ODPQWCxg
	SRPwiNGXkGenoCcYUlrd0dGqRgBaBiMG/1b4q+IGT550dDfyZDia/vt2dbfYGU82OhFmQ+VJS6l
	vB65aQ3zZOhYuw+KDJeXcczr+FZ1SVvxz1cn8pBiCb0/JqwEZvScUhqOpY71vz07K0iahHCbuwT
	XB7I7Qy98gwMmRusTeR7w0BNyoCuF9haT8+LiC/X9YMyIXS9toeubG6j4WyKfONz2+xrfaunTE/
	A34EwToPH0v49xFx9dRoWfJbzao2dKKfVwS1+4yiVrTbusiM+IHxgpgM7a8m2Ns+wPPyD0wPaAT
	VZ47en2StIch6Kw95MOUJ3TBBeel/ff6DmEz0kkQSz5Es/gVZBv9slA=
X-Received: by 2002:a17:906:a11a:b0:c4c:d96e:80de with SMTP id a640c23a62f3a-c513a5dabbdmr467707266b.8.1795283676178;
        Sat, 21 Nov 2026 09:54:36 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm217895266b.80.2026.11.21.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jeff.johnson@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:36 +0100
Message-ID: <20261121175436.648565-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <9b13a6c0-1ff9-4c63-b1fc-9ab6def252bd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_095438_204774_B755FD9C 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/2026 11:57 AM, Jeff Johnson wrote:
> I'm concerned that you are taking an approach to benefit routers which can
> actually harm mobile clients (which want to minimize the number of CPU cores
> in use to reduce power consumption). I'm very hesitant to consider a series
> for upstream that could be detrimental to mobile devices.

Agreed. In v2 only QCA988X, QCA9887, QCA99X0, QCA9984 and QCA9888 take
the vector block, set by ce_msi_spread in their ath10k_hw_values.
QCA6174, QCA6164 and QCA9377 keep one MSI vector and no affinity hint.

> This looks like something that should stay within OpenWrt, which is focused on
> the AP, and not come upstream where we have to treat mobile devices nicely.

Without ce_msi_spread, ath10k_pci_init_irq() calls
pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI), the call
pci_enable_msi() makes, and request, free, sync and deinit make the
same calls as ath-next, so the client chips see no change.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius


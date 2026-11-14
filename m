Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66873606A327
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sy54wrc/;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=a9k+APlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=; b=Sy54wrc/lvCKAS
	8faP1BfNSjR12/qa6hxQozi619BTVddbhiyaN/sBn8SlmFqTsfb4/JW4AHhl3mEFAYfgIhbg2LWsJ
	OwzvBOnG5YcOBuB/qfJxi0j7ySMbzV2XmHCnO+kcoUmQluw76fqOpiWmlv5sl+T4ruMcW5n+Y5tx4
	cVbRcufa/+bhetQb6JVoyjeJiCXWk4Z1ZvBLTWCmXavLQfncHrQrczWhvhoIwzKdWRXBkU3Z+9L1S
	C5F4SvFuYhsRnXIJ6cWfiybyRVysBKOIKE0pAjc9HCJ5HjsdQXpr229mPFKpHLH7hJWYL4VgmPcJm
	SHlbZfZ7hTNNEUhnbXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKw2-0000000GlZJ-2b2O;
	Sat, 14 Nov 2026 21:05:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSKvz-0000000GlYv-1BuM
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 21:05:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2858305a12.0
        for <ath10k@lists.infradead.org>; Sat, 14 Nov 2026 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690312; x=1795295112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=a9k+APlqeP12Bz7n+Dv3bkVWpczFk7nmCkf28eH27W+QMID8GOGBymI5Suc2jQXkYI
         Zaf/kfSVVuqB9U7g2NI8eXQmpQCG+IAEo59pJFlwRyLxrFShQaYt3GyNzofrRtVcHniN
         1HVxNkb9pYhpNiMQG6oR82+2Eb8ObSbAfPosXx40FUJMJBv3c7dS5suBFi4KNOecYZl4
         Tm/aZzxTOpD24ppWMxB18HEj3Cez4TLWRJNBuVE/l5kKxmVlo0G3j8J3YYkxNPTro08y
         XNnlntJGx+Dzd63VanxIhjqK72RSN2+Ei7HjQY40ltXJgFJueSusJOM6Poid2XCW+toj
         69PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690312; x=1795295112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkd42w5V14bXsJqIyYpVaD3zfPD5OHjGnQateM2Ecv0=;
        b=JcP+AOz62Ystxr1SNAFQ+fa0+Nihz5H0SAFyKQV3YUzgrFBSx7JUF2Up/6E47nnp3L
         BPAsuSELRxQcHuh6phIgYwwCt9IduIr9h8MPngHY6kPfAa/Z4lT8j4Rc+IjSuGau/lHq
         GhQ/Ah0hy5lWHERxO5OuELyMIVGSRKq/VZeV+/U+/a9y2ViM3JIUsB7SRn0mWA6KWBee
         W2WZv8jrTUsUcTooWjE04aGXYAD780mSljoikK45fx/NVB2ethq7ta9EPS0EV7ogU+LK
         tY+8TAUqRkr7j9r0AHt/8b1fzfMsc3QR48SbdPkHlnuoAIUpcXGsMRI9HPIgoFler+05
         Cbng==
X-Forwarded-Encrypted: i=1; AL+hErHhTYD4sXhi+JiSPCb0dNSEZyTbZy1rENCQBtdVCiiXFR4LyenxTMei4v0SGiIAjuyNmY7ytss=@lists.infradead.org
X-Gm-Message-State: APuU4Z8grasIqMJa48emkDurCU7LZDoS1nEd0m+Nvu0ex9nU/aWe/dCN
	bM2k7jJzUOtLWz3GOIF7gcUMgUaVsWgL+lg5SgAvHLszwNIiHLCKjl01wsotFXoXPw==
X-Gm-Gg: AYBFou0Dsf8vcRQWPtr6dm3gyWuF26kVBQ68MxK3tkDXz0gwXXKCiil+nGquuu5K6IS
	hszewJslI3JZfljo1NADsUwiqke58fse8CnWfNmUIQBaM4gxMPTSRdh/WVwgo46yrG+cuTPOPDX
	dsET+x1eDSTnd8h1k1F9TV6fpVUo0eRitCOJ/JWtAU8j0rNb139Sz4vIEOUtsDDkSeE8TJT4o4c
	3WxFTajse6XZGWQ158NadKQ+CESqf07Zamfuy2VRv7OwLpYD6nooYDt4aAjNOnMnYPyqWdCECrX
	Krm6FP0A0Yv626kCcj4mVkIedTYnjOm42lyzwBUE0BHf4CllwfnnHoxjbMnxdwY2kb5/YIrb2EQ
	/UeA+nyoJlmKJftRvczjmBeDIGGzm+5s6DyZbZ3sCyzKPkT3mAKHA/1K/g8pFRQxXlfLoE40E4F
	5f8RLzqtbbWHlJkPoLznME8GPyXqwgsD2ZwaWID9sVE46EcigV/1DOeJh8N9QU7djR0wrLpboZQ
	ps3vFN56KIcJSGajBtXNFfHM6u53pvuvhu2rAtLwmupR2ZEz5u5uIoPSNE48bkHaF+s06ryB1OJ
	jixXq856Dbhf2KfiuvX3MTHrVeBm1QcnBn2JBe8BhNvhCdpEA3pRlDDJvEdbPipELOvPAXaHPPK
	qNRzVkB7DzjGQGu9JMZj7+lIJCuQcQcxt4MdrL/IbfMvHsD0W1osEIxhIE9ZIO1pOtzYq7rkKeG
	eUcUib5JRfgReULFHLZf5nWHY5EFE2B5gtzfGTxNxt74dMAe3ibPdSSJI8sW4jHabeev4rvCXAS
	P4VYzPY6HiSG/QVhuZWLBTHS444tBrimvusrlog00xq5S1bMeoSm1rouAsrLDfP6pGe1M8xFQZP
	lgdjo9JFFMkn3KJC55pFOn4I
X-Received: by 2002:a05:6402:448:b0:6b7:1b3b:d309 with SMTP id 4fb4d7f45d1cf-6b7c0c75058mr3870449a12.33.1794690311837;
        Sat, 14 Nov 2026 13:05:11 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c7c21sm2604649a12.19.2026.11.14.13.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:10 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 14 Nov 2026 22:05:06 +0100
Message-ID: <20261114210506.787342-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_130515_380160_0BA5E545 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, Nov 2, 2026 at 1:13 PM Loic Poulain wrote:
> > -		ret = pci_enable_msi(ar_pci->pdev);
> > -		if (ret == 0)
> > +		ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_MAX + 1,
> > +					    PCI_IRQ_MSI);
>
> Why not simply using pci_alloc_irq_vectors_affinity()?

irq_calc_affinity_vectors() sizes the block by the possible CPUs: 5
vectors on the 4-CPU IPQ8074 with the firmware vector as pre_vector.
msi_setup_msi_desc() rounds that up and enables 8 in the device, so the
HTT copy engine's vector 6 has no handler: 226 interrupts in 14 s (one
run) against 36891-37590 with the hints (three runs). A calc_sets
callback allocates all 8, but group_cpus_evenly() makes at most one
group per CPU and the rest get irq_default_affinity. v2 takes the whole
block or one vector, and keeps the hints.

Julius


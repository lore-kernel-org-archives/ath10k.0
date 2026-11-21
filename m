Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D415606A331
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pA0xYPfq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=j18J/ClD;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XCtCBYyn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=; b=pA0xYPfqZQqYch
	s6pcuOZcOyWn5QVMEIL/uDAubV145IVOB9i5cOoqkNWu+oxX+T7LmXMzTYqaxc7AOaCpiwW2Fq5RV
	bIfBwFTCT4x1whwMR2pE7NWdjCA2Yrzoff+dMxXStGFYgS1s/RT/RZ6bPYDVglvYfgnGjPOMVUa6G
	RWxc1ZzdLUzmVesUs9DbRwpGny+KVadKBieCQbALqehxwms0oHrZoj7M4Sp7mQkLsAtp5BR6465AR
	dR4xTO4o5KQ0cI5r9Vb8yVzwm7TzC/tYa1qIFbspbUvqitaCw9Trow4dHUlmrLJYrySteVyANWe8D
	xBn2dyncqHclFvxAQGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpIS-000000001Qg-10hc;
	Sat, 21 Nov 2026 17:54:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpIR-000000001QG-1QrD
	for ath10k@bombadil.infradead.org;
	Sat, 21 Nov 2026 17:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=; b=j18J/ClD0jNRiCUuqjv9mmMxJ6
	FZjE6insUXL6uG+ndFiewrk89lp0O2VNTud1A6iVKeJvG/FJAteWmO9Hg1CZhyWjhwT9v+QpOiA3d
	MxFwgbxYmGVSK7GHgSmIh1BFB/l0JVSRyyGShkhCl9fwJJ4NXvndaOkiKinH1/6K/tlG2nNGr0t9t
	a3rRJtiF4d261mIys99/LVDE/Ocd4Wptnpvv62zIqyCapsmKiCHsMfBHha1c+5fGAHWr8vi8Lt0ql
	WwYGYBOo6aAoCI0AzgEZlnPZw5r1AUkRvVkRkOxCK7wbuFxPMEt7IJNRvgH59XSa3vncZdod9o5eu
	1cEjB3fw==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpIO-00000001jiV-2rbZ
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 17:54:42 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so360150666b.2
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 09:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283678; x=1795888478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=XCtCBYynyaGLUeBpQANEIzCCenKD0tOv7jEInGAvC4vciHvdGhIBWc/kpr/DPcboeC
         tETfdFVAAYVO51W4n/wQmYGPQ2vSVMxplfCuyKB5+uXIwqH/vttBXM4RDbfniFZ3o5uP
         rj9AE/rnPG9udXm7R3dIY2J9CsR6vSkqs8UbV6o+G85gx+AhyBV9YXEZRQF8DuajRJ+B
         ZTOpONM0nfshRpTw/Kn9tf6Pqu/OS5vNuGF+xauJzq3Jym5strD3cwNcotg2zY7ZOF3g
         7mXTAyxenzPgQ8K/4qUeoeEjkqNjiUXBhYIjsevtVlWx7cKfKZ1rMVtKTb8YttV/atDy
         xZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283678; x=1795888478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ0e/W/n/O5onpPBZJsAZoVPMj2UkOY9Tvk5edCPPM=;
        b=QpMv2APghRnGE5rOfdum2OBf86ieQ4pv5klolW5vnh1rxWcs0+drKOSVlRKFL2MLYi
         7CZfrlcWmLEARJ3Zt7kBkjqcvKDgOC+DmUTn100ORwzv0EVODTTsU/FvE3dq0jtH6v/M
         BKmwoRdnfGniN/SBFtMTImKlbxJBVzkUksghS6qLvs+0YlcTCDZpRnoaCOfwLKmqRRZN
         6UoeV5vTKiqxBz17bfM9/HyyWZa7hSsLeM2+fd83jMbHQFwJJjZIq2z2RkAdntxOTF++
         NksIFTM0l5lgXtLISlCE7m55xNa84jamPoWOVywl1JLsTcoZE1ZlBds306hVg7gLmTDZ
         cDsQ==
X-Forwarded-Encrypted: i=1; AL+hErFHMAa4+Z2SW8h5jxja6Ut1QaBIEJAtNLRgdt05KhYXqwNdjlS4AWMuYE2PxlIlohFzs9b8PGU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+8DtVUT12khYiyw/aHogZqF/PnhS2Us7gB4/v9qQrhlLdch6q0
	dpeh0y0xhBupnshaH5uOf/Suh+Ti72c1Bf/gY/rRG7AzgsI9j/F+MrsFYexbMG/fCg==
X-Gm-Gg: AZFdTZeVz05doHRr8+QnILe0HUNN6rApDKuEuJV6NtwABaWAQsmqHpTFMtRBUUyzXMZ
	ejHClPBTD0PimQZPQPZgVwFvNP3R6A0BKk4IH6EGvx2SoPlOWLA0JSzzrc7ynk6g1jP3D2E/lO9
	asevFCDUMGsWiVsTq8fYcxbvjNgTHO9v99XLo/REaDZxQYzuhv1B5HopCYIf4A87DOIGRQAxzj1
	x7pVGZH2TNtHbR12BbSmiL08JIkhsvO07DCT2V0WmjmWl0p/WMPE3B5z9PK4XckojCEC1EEam2H
	rZsG2spP2TAw9pFU7EFVkC9BT2yJwKtD6R4XZmm1m/AtXsZUlHOHRT7V+fqd3tAZcMXcg3OR1Ol
	NSC4N0FWBuYnzo4uJGZs6BH27zgv74o38i5ejhzn/DPo8tYG6Yn7zqPkoByHvFYZgKo6C0inUt7
	5KtDjDto9ECG/Mjseg8wqRZZU78D564kUREUaXXPaafWHyREewPmXLgX4BgtaC6nDNwJz+HAfD7
	FXEfC+jU79f65HE57kBpyDMqUvHNpw/FnksqTcxYJP5zUsDBMBRPZc40xj4bnDmLFjQgApTitl9
	X7FUqu++8RAvPgULaiyrWliTtUuiIpzkMb93PSDM0c5LaqA23PpWuaRyYnLJGRfWImce6ztbzJm
	fdMMSPC2pYTjQ6fh9oBgwgzU/ga20PMGhWYeMqvesbGKM0zCRH+AD1dygIQJcg/mphe9U0q2WTC
	2FafXN+GX4Ytozfdm8JdDSOnpOgKnY1vPaQoyweRaF8V6PnKRWmofTSUP6WRFuZJlRl7Bp/j4QV
	vfNclqWm49kqZu53FA+kVrWSZlOSujAungDbOqkhU7HR0EuJOsUIxXvNlQDPdSzDzl0mRiuB6yb
	uaWXmjzi0oO0OXBo9XlrnreW1GjGDM4yll3uT615ML1pUP/YdgOjD+Y0q/HQmnbrTW9RSEtS0Sk
	F
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr179230966b.1.1795283678143;
        Sat, 21 Nov 2026 09:54:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm213191666b.36.2026.11.21.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:37 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baochen.qiang@oss.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sat, 21 Nov 2026 18:54:37 +0100
Message-ID: <20261121175437.648605-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
References: <20261101164247.258200-1-julius@bairaktaris.de> <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com> <20261114210506.787342-1-julius@bairaktaris.de> <CAFEp6-0nEWKrKXx0A7dHuzFU_=NZfzjNZQzKp2nfk+gr_SDvag@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_175440_589843_030C8E67 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

On Mon, Nov 16, 2026 at 4:25 PM Loic Poulain wrote:
> So, from what you say I understand pci_alloc_irq_vectors_affinity() is
> the wrong API here because it sizes the allocation around CPUs,
> whereas your goal is to size the allocation around device
> CE/capability (8 vectors).

Yes.

> Can you mention cfe9011a05a8 ("ath10k: remove MSI range support").
> And why we re-introduce MIS support and how is it different from
> previous implementation?

Agreed. The v2 2/2 message names it, gives its reasons, and says that
its per copy engine handlers and tasklets do not come back: every
vector gets ath10k_pci_interrupt_handler(), which schedules the one
NAPI, so only the CPU of the HTT copy engine's interrupt changes.

> Also, you should update the comment/kdoc for
> ath10k_pci_per_engine_handler() which says MSI interrupts are not
> handled there.

Agreed. That function went with cfe9011a05a8; the stale comment sits
above ath10k_pci_interrupt_handler(), and v2 rewrites it.

v2: https://lore.kernel.org/all/20261121175402.644803-1-julius@bairaktaris.de/

Julius


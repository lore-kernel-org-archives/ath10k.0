Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B9606A335
	for <ath10k@archiver.kernel.org>; Sun, 22 Nov 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i/dgJtor;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=qZWAl87R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=; b=i/dgJtoryCEdZiKrdv+OA0IzOd
	BR278fKoYdjO6oTnuGGx0N8q2wb++gWN/DGNDqzKk3r3shBM6bBvptAUfnfbsXrBKrFk2mtRlzYQe
	zPEmqfF9ZG/sDcIGCJ5Igwo3Lgc4dicwbmrFM1C5/0MxMDOddwSWRw6q827t+SLGEaj+/k+V+Jt7Z
	pCaztSw5iD/kuS2XcrHNtYJeAY6vgowxmt/8KSXo4z6qnVeqgs3OI15KNy2CNsaVJ0j4L4c2r/PGX
	SJlhAV/nNSMzuOFN+mC7uDMEKFCPJIqQB/RiQv4DAO/Kg/ry/pNrnBWj06Z7TX7tFqVq6P00Ec5An
	lLV3uLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8mn-00000001DRH-1mxa;
	Sun, 22 Nov 2026 14:43:21 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8mk-00000001DQh-3jVl
	for ath10k@lists.infradead.org;
	Sun, 22 Nov 2026 14:43:20 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-8b4e18369c8so13498897b3.2
        for <ath10k@lists.infradead.org>; Sun, 22 Nov 2026 06:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795358597; cv=none;
        d=google.com; s=arc-20260327;
        b=qP+qLd/GPT63iv9DMYd9ZLxDcbx//nFo4RTlT1OU/BeO+kHvbvqcstrJPMTLjhoTjW
         nvbYBqAv+AJ3KE65iWnDOi5H6rbEzagh8VUEFO72xLpdg/aDudY9E6/hprXPae1zVBt4
         6q+/x3Pv12UCQl8/0dxZrrINaM9v2bS2GDBcIL6bXEcSZ2ieTvAo9mzIL9qxn4gxgzLj
         I6YPO8XCLcixAyYVwkF38S76Id9lcEw+nbu7xE/Gd+1fyQK0ebEhVrquWrN9kzA8lJ4v
         DekI/2lIeoGsKYpGxE0yzAg8LkVyp95TFunL9M9f53DZA6glJF9sxAe1mGzK4PVjN3zQ
         alNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        fh=G6tlAdx6nBKG5OOQMZXEQKrq0DxVEPoXr36UH9LJmVg=;
        b=dTBBIkA55JlA3i9cR7n9saMPqFa/7Bim/byWOjvmBe8Pl+YJvJkWJEeKWiX0s82Mgr
         9aFMXpNLUnYLO0RONl12POkJCjl6LUS5HAlyve5YOIQmmzOoa0L20Fmjhiv6LSOi5/HD
         7r6iEVeBTWUUm8SV92AbHlDNuYZXEGMifW0rjtSdEnPAQtCtl89wqH4Mjzr4GGHcbSgn
         Axs3HhAxha2/Cp/VH5BtzReEfYabMzYjowlQvtlv8mZO8cv9Wh3FWrdnCKEdBJ5jn323
         s7wmQuvbM+CV7Ea92zULZ6QVFu/te5iq1xf6sPDNd19otoekWV1/pk4JPZo9xNbk7GYu
         HGVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795358597; x=1795963397; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=qZWAl87RrK85MJeBbrKWdQci5CnV+8glBuAqwT5US16HXoeenxoNpWQ9UwONNocqFN
         3WkXxfnv/fgp2mQu+2b/ouWuPAXabUWo7m6InTSXik3RUT8xOPmUyJufiK+WpsDjgKTj
         xkLQolULfC7GL4LqnhVa3tpst+xreZ+plH/uC8sRx23dUm3TFj92WHb6qhGllUgGmhz4
         wdOfWrgvnC/jDrBY0CCl5f6fOlVIaCl4eIqWdLqQFpzek+9ZrlBV+zOLdt8+fnq4NMZK
         HBxVUv4alXCyveqlPhCCUofRf2IJ520les6E6mimNIHj4cQpgpzuX5RJb8gGUkfDXSxd
         I5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795358597; x=1795963397;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thouv/Iugv9Ibk1c9KzTk8Zsgx+FoM9fM+m0l2bDqdk=;
        b=ZKsIcLZYQ7xJi+WGjwO7LzHiKJlPYWK1RsbuSOyJBp3crv66qptrhhmoQG5zLCICyV
         ZZm2axreeUF05r0lnu7GB/q86RW9dHDdYEASfznl+HB1ADTd9RmKP88LehwiXaO4fsN3
         T47E1xrMx8edrBT7NpOXN2Vcgp9VlPgaHL6/Xg6OZJ7vy0nVvqtR/oSoI+fY/YNEYmU5
         Bn0UR/8SIHAiFUZsR9QdKAMc97NhNqOImXMNSRR2eoEtUIp+Lm0x1uTcWf5J1l5jwV+W
         QsTkVUGzQFdAGby0b1g2Rk7BKIZaXqs8chIMCKCHYTSg2CVd5HnUxIG0eQKD9mzekZzP
         ngLw==
X-Forwarded-Encrypted: i=1; AL+hErG0nDZ9hIQBup5UBZyKfAZylSq5Y5iE/qR/5CA4t3q3x/CDy/iYaeY0CWOIQ1YKi2/bG2e30Uk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/qNwOwAiJmkmpHF5RwU/7Xm3SAdU8vjfMinzQnsrASaenyt5Fl
	5QQWTRm22YVUCSRFQdt4IH3++5dBJ0tswGI8o/BufOYIUZgbFAT4GbVnenVrg8EqrrovoF7Ijdn
	UbIcR3QQB1C9PSMMCVuE6Rp1zjzkJR5+qpEJ1Djjf
X-Gm-Gg: AZFdTZdpuZHxqEi36VSPf4k8oYazT16ZgcYjOCN607yzW1gJX46JJRTR80uvO0yAytH
	om9Nn2JOgEY+2ygZ6wQnldCG9DsQfDJ1kxu4J2+mPJ4vJnkSohRIWEmdkhIsh6T7Ag8HRrzP8AN
	FTKZS75mzDXUGTS/brlC5FOU9nCuzhx4mdouKEk2h0xFglQIQpiC1pqOxZwYFDwym+w9RaK6GwX
	UNFPmkma/ajNUP3kERBqEziZFWLi2dJ6imU9z88XVsPFkrMKQCmCMhwTf5BnDFXYNSFHQMLEcSa
	0D3fo/6p0P5axiHUHiOirKef6m8ryXkBL8d4ghkbvbt/lRScUN+jZnonIENgSg5BgHj4k+TcYlI
	GmAxre4Jcp64h8HP0Tn8TmWZ88qX60q7j3AgvYFZRQLjhj5BMLFH0Wc1+hpj2mGT7ciLxLrBB5L
	NVcBp/YnBjDXieg0R1eLIEGS8KiCTdJjDgu3ZvsR2z+Fq6jWIYhPBftZMjjbPOfLcPj6cLcXCi7
	oQAAIMXIOerntxxf++DPngACTJ+LtlguLQpgqNpfS1rs5u6G4GGce1j7aUr3hU9T3ENnOE+mr1j
	bmSac8EshA/MxfZoH1i6mez7L116G5amLKP9jqV0W3uX0eEN2/zzuRJjmcZ5phetFD/zaNt+gzp
	sQAaUaiAGRkC2fEzVFkBWLh1Z8LtB0pM=
X-Received: by 2002:a05:690c:a:b0:8b1:2db3:b845 with SMTP id
 00721157ae682-8b520435b3emr29200087b3.14.1795358597254; Sun, 22 Nov 2026
 06:43:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121175402.644803-1-julius@bairaktaris.de>
 <20261121175402.644803-2-julius@bairaktaris.de> <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
In-Reply-To: <CAFEp6-2bg_2o_bjNNsAA8WNUkL8Xng-tMoY5awJa_OeHd0rp5A@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 22 Nov 2026 14:42:43 +0000
X-Gm-Features: Aa3M54o5gEPUswAYHgd42TPsZL6s492wQ5gYbnXvCBHvlFH15c_NQ64WYeVIsGI
Message-ID: <CAC1t37JxedSiRn4rjGRSV9a4N-Wm0mvGQW_WGhpitq9qJSgs3g@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt
 mode when probe fails
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_064318_944232_1AF89FB6 
X-CRM114-Status: UNSURE (   2.48  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks!


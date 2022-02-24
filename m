Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C093BC433F5
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W513E7AL5DAlzhJ6InWwhoaNwLeD9157gue99LX30BQ=; b=iHWHZ8zUpTYXtb
	NAK4YuTzreRN9C2oJwvqWXI9xTKysHS2mb/tMvUciXc0fZWZMVLtFvVudCzeFvagLDdb/fTVFO+Kh
	7CyL6A4EqghE7FjzYQwbFVtOZY7Q5HFpChl3aRAU4YNtssvjV55TXqdsI0isa0dsbU+/7+0b+uLFB
	GO/Y15vraBxYK+GcSElo0XHnyjyuqIAnLpN2JRoSzYXsaVrOxi5Us7W11PgcAqlJjUN48rwTcL8nf
	bMVk6lPNzBDXPL9l2CHG8Tjz8DqX33WfD/35+2CBNQVMqj6WSa8Nuy/ZcIECUpGqYpbYAIUg9ovyP
	XUBDAEPFt6lyPeVXA5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBPP-000Lkg-Ef; Thu, 24 Feb 2022 10:31:39 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBPD-000LcL-6A
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 10:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=QJ61GVuJyclCnz18nFi5Rw74fGs3hl5irEBRqG/1OMo=; 
 t=1645698683; x=1646908283; b=auImOVcyqLZeeFrXHz9NoqK0AwuS3JKu5p06cBimNRbXnrj
 Gnd8rGaA7FqNaa89FSofucpUil7Lx2nq2tgckGdAA0RVNQIYIxI/0WgLwprJwrzLvZc5KZhEzB85m
 eE1PwNmzfJvlmvDXXsctoEuAn7opfoynVD+ipGDlQuP1cSce3pH5lLn/oih7dFYnkSMs41gtzzvW/
 pQo/DRBZ92z6iwrMzVqTokMHKOBmk5sMm+6COAqzI9MMWl42sjPEj35YGfXUSWmz8ja787ixlYkH9
 GeaOz8PzDskD1YrhtV1Diz/AdGiJ1ONBcyyKfK7DJWdh/F2+waE/o2iiedJHLRTQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nNBOz-0057ZC-Uj; Thu, 24 Feb 2022 11:31:14 +0100
Message-ID: <2fd265ec46a8b582b7c5dea9524185b6fe1b0322.camel@sipsolutions.net>
Subject: Re: Use of void pointer arithmetic?
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Francesco Magliocca <franciman12@gmail.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
 rmanohar@qti.qualcomm.com, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 24 Feb 2022 11:31:12 +0100
In-Reply-To: <87fso8vb3w.fsf_-_@kernel.org>
References: <20220221122638.7971-1-franciman12@gmail.com>
 <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
 <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
 <87o82wvhtk.fsf@kernel.org> <20220224075346.GL3943@kadam>
 <87fso8vb3w.fsf_-_@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_023127_299380_8753485F 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Thu, 2022-02-24 at 11:59 +0200, Kalle Valo wrote:
> 
> A good question. I have always just thought we should avoid void pointer
> arithmetic due to the C standard, but now that you mention it void
> pointers can indeed simplify the code. So I'm not so sure anymore.
> 
> Any opinions? Is there a kernel wide recommendation for this?

The kernel only enables it with W=3, which I guess nobody uses anyway
... Originally it came from commit 4a5838ad9d2d ("kbuild: Add extra gcc
checks") with a pointer to

http://marc.info/?l=kernel-janitors&m=129802065918147&w=2

(which is offline right now due to an expired certificate ...)

but setting back my clock it seems to point to

https://lore.kernel.org/all/20110218091716.GA4384@bicker/

but the thread kind of revolves around -Wconversion.


FreeBSD does enable -Wpointer-arith which is why we've been trying to
keep iwlwifi clean as a courtesy to them, but for really Linux-only code
I dunno if there's much point. Although of course that applies also to
FreeBSD ...

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

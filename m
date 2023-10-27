Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE3C25B47
	for <ath10k@archiver.kernel.org>; Fri, 27 Oct 2023 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EXLfJUI+nPrvMfj3zLbbK8GwXoqiRhRwKeiCVnlwu18=; b=OQNekTZ7HnBycT
	yOI1FZ6gj73PkvVouH1rON4VHal8z3gA5UGho1d16cT4rrLkgKoSBOBWjSEKOdzkLl6rkjoi3cgcD
	aZwqXu4O/VQrwcPpyJ/KIsUpFBvlda8dpuN41XTjrhxWVkBjVuDexZl7vMD6J2+DVl+Hz+SiagBnR
	3Dm1+Rk5g6u9fg3pKXlnz5iAYU0subomWLnMSnR/5KsCO0YxlHNnU+ldAxp7LPki13eJd0avgdlzs
	RqcX1f11TfZHej7GDgKEtMTedkDM9O9m3bCap4MQibsbCFXdkFU1VU5PiozaEvESbuykdR47rnW1w
	iVVHym4xZrYQsj6GolZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJX2-00G4Mo-31;
	Fri, 27 Oct 2023 09:53:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJX0-00G4MQ-0K
	for ath10k@lists.infradead.org;
	Fri, 27 Oct 2023 09:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=U1bDbJE+lcrP5cgqiyYJYmwzGghCUhM8XYVnQVM85N0=;
	t=1698400409; x=1699610009; b=mr1KTKTmQHETQCFvy+JfYB4mDHvfemKkvVxXDnCn2HWxv/d
	jUl4qW+R+6X/rmD2XYNf5bGhRcz1FlcRMmkmc7DK9Df/7mjgWP8hrG6HqOn9ou5Vi0diabI7AUyFR
	qe7E4Pxjpu1y+Sq4bRh+kT7YyqaxFIyaVKodHbOMN2t39Jj70SzT+WRG1+lsZIx6ajqHxs3b2ltKP
	SxVgNmpbsYaTqvDGWrylRy8Tv4WwLvtou6PdBsvOBTi5bdEREgnHh+4eBkCCfFdPjamsRfreeWOb3
	UbtY8AppdLIRSxcO+XfrPuDzlQHCvGoDGuk9Nu7vlkq8kwkCbYsQ81iqdLjgZLPw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97-RC1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qwJWx-00000004gFW-2bep;
	Fri, 27 Oct 2023 11:53:27 +0200
Message-ID: <8d5af24635501d1ae2e0a54f7196fc476241f894.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: ath10k: prefer stack-allocated __le32 variables
From: Johannes Berg <johannes@sipsolutions.net>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 27 Oct 2023 11:53:26 +0200
In-Reply-To: <79560f97-4f42-455d-9031-a2c1eed736e0@yandex.ru>
References: <20231027082325.126606-1-dmantipov@yandex.ru>
	 <f26cee40e10be4fa91862d85a1c3054e1da909ce.camel@sipsolutions.net>
	 <79560f97-4f42-455d-9031-a2c1eed736e0@yandex.ru>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_025330_137665_1753B9E2 
X-CRM114-Status: UNSURE (   4.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Fri, 2023-10-27 at 12:50 +0300, Dmitry Antipov wrote:


> Locals can't be used for scatterlists/DMA/etc., right?

Well, a scatterlist by itself doesn't imply anything necessarily, it's
just a data structure.

But yes, you cannot do DMA from the stack, which seems to happen in this
case, or at least can happen.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

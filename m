Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC37C64EC7
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEJsabUBBIrXSAfEGMeMgaei0EdG68Xhpz4NHY2sdLE=; b=bL51eaAz3pwNRP
	zo5aw+Hbstjut2GiY8ev67sEacJuhDiDq9D5IFD24A805qrE1ALsqJXASJYP58bFo3u3Sy7cv/2R5
	/e7KlWZylu9wM32IqVxqDERO65C5nS6LKI8kBrVTUVLKsjif60Of6VjB4k7xXbjZ+ZSgN+aibTbac
	a67febDYQldZYTlimctdEUa2OdnTijyNI5d6I280Cz6WY6yYH1QQItYSSRwrbbgM/VQ67eiLUUWf9
	CmlS08ZQcEOgGFFhWdm2C/jDYQtFwPfFiv5b+JUNMLDVwf1HrntB2VelhaR9g6dyu2hZt6XtCbcAG
	u64RSFjr9r3AKyGF8eKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk3r-00B9Yh-2v; Wed, 22 Feb 2023 08:01:11 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUk3k-00B9Vl-CF
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 08:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=nD5YTheoN2joTFd6duTOfgc+Ix5+mCDUPt4PIcBtH30=;
	t=1677052863; x=1678262463; b=Kfi9VKY67AXCRhVrvTzo1Vlp40HtmC6W8vz7qcWjcKMFok+
	RVzKHn03wDpu6GobqJbn/9zdahdDkiBkxcpWR4fobvIXTLFKmsUpStdLp6qpYhbq5T3/DNkg+YW4C
	d49SlkrpYfeJthxGoe+FLTpBJqPCch+vqmFuF3gA5zivbFUuFRMQsBnakZMD8f8duP5yk1EjMZIfj
	u3W2ppEPYyfcs4VYtkaV6mie39Db3P6Sy/cT2v0+SSpoWzP1G4RzxpZBK1oILxB+DZpCoOVT3W8Vv
	FHT3k/tHt+OY58N47X9PjOiwsQOTFGmaCjjFMmTcw8XwZI0cM4hLD/tZwGt983Cw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pUk3g-0029Iv-0X;
	Wed, 22 Feb 2023 09:01:00 +0100
Message-ID: <934e866942bd8d413bbb4570741e5d8d1537f211.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: cfg80211: Add beacon hint notifier support
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, "Youghandhar Chintala (Temp)"
	 <quic_youghand@quicinc.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_mpubbise@quicinc.com
Date: Wed, 22 Feb 2023 09:00:59 +0100
In-Reply-To: <9ae693f2-b19e-ff1f-851c-c3d09db4d9d1@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
	 <20221222124221.30894-2-quic_youghand@quicinc.com>
	 <1df59863e78e8ddbe7eb3a74e6dd4c8f0bd7f098.camel@sipsolutions.net>
	 <96cab5d9-9090-4cb2-ff17-eadc9da12f50@quicinc.com>
	 <0d4b99ab0a5bedc82f35bc1e548a611564b010e5.camel@sipsolutions.net>
	 <9ae693f2-b19e-ff1f-851c-c3d09db4d9d1@quicinc.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_000104_439829_81C0FA2D 
X-CRM114-Status: GOOD (  12.80  )
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

On Wed, 2023-02-22 at 08:22 +0800, Wen Gong wrote:
> On 2/15/2023 11:10 PM, Johannes Berg wrote:
> > > > Why is this even needed? You should always get reg_notifier after this
> > > > anyway?
> > > Currently when channel flag changed through the beacon hints are not
> > > informed to driver.
> > > 
> > > reg_notifier will be triggered for regdomain changes but not for channel flag changes due to beacon hints.
> > > 
> > So maybe triggering reg notifier once would be sufficient, a la Wen's
> > patch that I recently merged?
> 
> My patch only take effect for this flag, not for all wiphy.
> 
> if (wiphy->flags & WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit?id=d99975c4953eb79e389d4630e848435c700e2dfc
> 

Oh sure, I meant this patch could do something similar, instead of
introducing a new notifier callback.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

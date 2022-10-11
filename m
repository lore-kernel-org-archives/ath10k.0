Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77322C433FE
	for <ath10k@archiver.kernel.org>; Tue, 11 Oct 2022 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMK6Ma3Aqms9bDMJfWEYIPd8UzklXo9hDslJZng5ErA=; b=kPLidND+IlexS/
	gJfCHkywZ3a5yHiiius/5hAiiUTsZwM6G1t2I7IHH2f/n5zFjj4BjfDePICDoDRhMALuxEYRXfsNr
	MOQj84Tkb1/HYjucx3xW8IBBtECpo1XhjKo7XxSjnlnJtFqr/nfCviwz+HgfH1FZUYJhMlakhpMCN
	LV7+6u/6mZv013uK6nJ2yHide1YNFmxXafMz3RdDyVyEF9K1EqOFNmYwFd6fTQZuvyxrxlX6gz+nH
	tpRfYj7tLAc1kQuIv842UFciXcn9LiLU62qQq72EH19cPv87QaFgN5mTxiHLDbhQzuzV79iFU4amj
	syrrTfWP5pZUn1mYlG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBFo-003oVo-7z; Tue, 11 Oct 2022 09:08:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiBFk-003oV6-PG
	for ath10k@lists.infradead.org; Tue, 11 Oct 2022 09:08:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63A3CB80E34;
	Tue, 11 Oct 2022 09:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17554C433C1;
	Tue, 11 Oct 2022 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665479322;
	bh=V07c6zERjtkGzCyja5fYGKCrw2kdM5CZDpl2KPEbxi8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NJ/Y9oX5WGsnB0nZbiY/HTUxU3UDYROI6xe/whhhJ+t9Kaq7rXFCXaI5xlc9w8uKR
	 Ks1VX6c5G5XPoDFtlosoBivJ2nq79YQiYko+zsHG95C5nvAENGYRUOHcg+lZa0Lzyt
	 F8Arbh4FHgiLIF6fdbhaOklklWdPjqFCbKsbvRGZ9Q5GdvvmTulcyH0v4aUUASdGrc
	 82I5D1BxvldNEvRsSkTx+gX8cvfVafMgMAdbDt0cir/2Q4wLHoqzgSEAtm8Gos5h4f
	 qFph11900KX/MCeTck5Xz2Phxo+6cd8T5WPDWAWKvqfl+P9yN2B2+ny/oTmAqDsRYn
	 /CFTSRzC9DXZg==
From: Kalle Valo <kvalo@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] wifi: ath10k: Delay the unmapping of the buffer
References: <20220816044310.19101-1-quic_youghand@quicinc.com>
Date: Tue, 11 Oct 2022 12:08:36 +0300
In-Reply-To: <20220816044310.19101-1-quic_youghand@quicinc.com> (Youghandhar
	Chintala's message of "Tue, 16 Aug 2022 10:13:10 +0530")
Message-ID: <87lepmohgr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_020844_982112_6CC856F1 
X-CRM114-Status: GOOD (  11.40  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> writes:

> We are seeing a corner case where host receiving copy completion for WMI
> command though copy engine is processing it. Once host receives the
> copy completion, host is unmapping corresponding memory which results
> in SMMU fault. To avoid such conditions though host receives copy
> completion, as a work around we are adding a delay to unmap the memory
> for WMI end point.
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

Please describe the actual bug in more detail (symptoms etc). Basically
I would like to see information so that if there's a bug report I can
easily pinpoint that this patch fixes it. Currently I have no idea how
this bug affects the users.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

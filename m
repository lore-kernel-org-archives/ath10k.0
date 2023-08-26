Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C0DC83F16
	for <ath10k@archiver.kernel.org>; Sat, 26 Aug 2023 05:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7SJyUGD0g5ilR3az7/NmSfA5GwdLkGixqLnRZIvakw=; b=DJYwX6Fdi9sE4r
	PkUJwySz/aj8wAWaxXdWADvZjewayD+hHK2hcQbsR3GCHW84belh3I/bkXxJleBauQQYJypSDoU0s
	AE0byiRIVd/1Ug/+1QLsCzMg2FI1TOw3zIp02diHZcKQ87wIBScxwSH6lIqY0BxAcHTXlj9HTaxx2
	EtKx2DvTZvu76i5oQ9Naphqmt+apDhyWDVCAVNU8EcZ78BlLy5hDDL7cBDXP3l7KdhG6ffyckrAjb
	mtQJHShlBdVlym0d043WiLWqRiAV5RbPDOgtRZiypp3dO71xnvv2anQxUxOo69QzF0hHKn/6uNxiI
	FHf7TMeXgFiObLsutYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZm5z-006Sw7-2K;
	Sat, 26 Aug 2023 05:44:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZm5u-006Svk-18
	for ath10k@lists.infradead.org;
	Sat, 26 Aug 2023 05:44:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 826E560B3C;
	Sat, 26 Aug 2023 05:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AFCC433C8;
	Sat, 26 Aug 2023 05:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693028660;
	bh=iiyTHPtsH0r2NOwXQ3GIfftBWZLfSVf49/SdaJ48fkc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RNDwK038a5Ls9IG2WkwXtN3l3/S5in1DeLWusyq54rshtrYON4ieLWm9xvdM1tBkD
	 nZypuJ/TWeho9EEd3bH/mw5OgerKEWtm7cvU68+5LjlZS69BGDRcjw4A4l8jV/Crak
	 VLOTrhLUPeFm1YDWH5AybsRyX5U6WCF779w04iotyhevEcEKKqp9aRNC3yI2XGbrV4
	 bnkZ/XJC+COIEfx/mQNf/ryk+5Un+jleybPB1FkdyQYIf0TbEFMPGXuMUTn6v4lnf5
	 Myxd+ZqHTe41TR2FtGtxJjivWv4G2B9pKaxz5aU0onVdtMByAp5nr9PNXkxdA80HrE
	 9adhCOz81zabg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] wifi: ath10k: Default to board.bin for legacy board
 data file
References: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org>
Date: Sat, 26 Aug 2023 08:44:17 +0300
In-Reply-To: <20230825202610.1580132-1-dmitry.baryshkov@linaro.org> (Dmitry
	Baryshkov's message of "Fri, 25 Aug 2023 23:26:10 +0300")
Message-ID: <87pm3afjda.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_224422_456596_4E02782D 
X-CRM114-Status: UNSURE (   8.74  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Default to 'board.bin' for the legacy board data file, in case the
> hw_params array doesn't list hw-specific board data file name (e.g. for
> WCN3990).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Could you provide more background _why_ this is needed. What are you
trying to fix?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

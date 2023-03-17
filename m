Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC28C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LzKkbD34nC1cFj8m9aQjgEopiAlzFSk+aOfXpQMiw40=; b=yg+n+F8P5VgPfu
	AN/zJpDvgoTbSs6ED1W6R4WvOG/TuiuH00Zv3/qrp8TFHjCJCX5pPjamq06KQXyJJgeplLkfYcz3d
	Hg+A5L+TzC2Xg38xL9fQttIIbEbRRBO6nhAtMe4QObs8s2ouszHoV1PsThCpUCFzyKgvWxuN8hmak
	y9CWsGEc9Wpyr3foKQo2csSmCFQxIna9kRcmyVFIBLecJyP6pK2uFTeYwdIt7E4xVEdBpdqE09XG/
	TDgcPmRgn9JMgLaq7kaBFK2f1ruoKaem7ovN8s+Tgn6gE/3LkY5qEohZ3m0iSBanyGRPmLzyzzet3
	4J3pGeN8ZPOiB67U5LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Wb-0027JA-3A;
	Fri, 17 Mar 2023 11:45:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8WZ-0027Ig-0L
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:45:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0277B82560;
	Fri, 17 Mar 2023 11:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C483DC433D2;
	Fri, 17 Mar 2023 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053528;
	bh=NuBvN8CpEhCqXLQ+bR6a7ml/s88cUa7/EKoAEHqMAXA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gwNKFYFhsDSBqKQ2ZVfVpbvb1HSnrkM7bUyWkiWIAcjlQwCgMRHIzAAP2zuRIBn45
	 sKWsMANYRSqSnWUDojLki9i5zL85W8V5pW/NSA6NTqb3EMhUMeUrtLkPn8xmeLCzpF
	 o3bmE0ak55Cb3OKFhQcJMV1K1zsA2bXblLRAIcXPYtJrx1is9o9TXD2XdMP5rJqUNq
	 UKVm7r1ww5C7/XJfrG6y/EjPk9er18FCeWqoRwuTIgD0hMD1kyW1agcPMalbX77xzi
	 pnSZuBwnalQqY09jKGCuUkUNc+eo2zsGv0BV8Xulg8YL8TxH5rwWA7qbDPAQ3TEm0e
	 eqpMWdmkfX0cw==
From: Kalle Valo <kvalo@kernel.org>
To: Mantas <mantas@8devices.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update 8devices Habanero specific BDFs
References: <3dcf3b55-b461-5b2e-d123-371533134d44@8devices.com>
Date: Fri, 17 Mar 2023 13:45:25 +0200
In-Reply-To: <3dcf3b55-b461-5b2e-d123-371533134d44@8devices.com> (Mantas's
	message of "Wed, 8 Mar 2023 14:38:48 +0200")
Message-ID: <87h6ujk3e2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044531_299077_4511B528 
X-CRM114-Status: GOOD (  12.22  )
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

Mantas <mantas@8devices.com> writes:

> This updates 8devices Habanero BDF to fix temperature sensor readout.
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - updated file myself [1]
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
>       md5sum:
>       16b805bd273526cdae8650931ff7c24f
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero
>       md5sum:
>       02f6f427acba54c19fd609045d097834

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=8devices-Habanero
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=8devices-Habanero

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 126 in total

https://github.com/kvalo/ath10k-firmware/commit/df55e3a40d15fbdad3c3236ab6f23a672bcab6f6

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

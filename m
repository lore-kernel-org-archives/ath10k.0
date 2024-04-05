Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED58CD11C2
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XHI5i8U3gQG4XDfPHCf0bCZe/qM1zTKqG/hawnjyro=; b=t+hO0uYdJp0QF/DtJ5S9MBaXaR
	oKodzCLsPO2wHdeWrf+gDynCZfSaNTwJp1y4lWh3V9/0kgRaL9J1Hub2IZEIsC36RR9YofyMYiP8s
	MWQhi0QG/RSiy2o8jG9XI2RhjKA4c53RO/B5tNydaBBPU8w7MWcJyRzEwRHpVPkf2DbQauNeJa3dR
	HqShvx+PbWKXhVmJJPDZJQSUFKaIyVI5f1easXvRJcXegPfpPIhK7hKoDIrjChp5q+/XY3g4icaBl
	Bjs1ambP2+OaRhQaXS9sBUZv0oy0ybdIxYdLixybbI1ynRR4fEX2cKRPILhit8p/fLxc4xH4wJ+I6
	K1RhlLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiBx-00000006m8v-3NqH;
	Fri, 05 Apr 2024 11:57:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiBv-00000006m7s-0PfG
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 11:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51DC4613DC;
	Fri,  5 Apr 2024 11:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E76C433C7;
	Fri,  5 Apr 2024 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712318226;
	bh=EyPgOz5gZ3ITDc/ApJcrZJOJ71Fn77fOpA59i92QI5g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GSGnHcLJbJVUx3kuCJ5JfvLlDybMhC76UtK6/GlxaFOm8YEPPW5Mi8tsnp8Z2xq3x
	 4O1e2Vd3VIJyELnSlvY+A2Qzz63DBl5Lm1EKA5Ww1W2s+tVh4RQyNWPkjZvV+Ehiog
	 KGLa0EY7EBlWlfzKMcwMqbYuecjXhStW60s5Kmwp2Az9XuhjnBuxnLQVgBO1Tk+uzO
	 MxIprh9ePYROGXkidAbQQmG6GJ3mbaUYOlQ8nCwjNXht+2+BsjnKsua08zSaQVndAi
	 +6hvF9TM5DGYBomCRX3NvD4IDqZOx1cfy5C3aMJmR6m3xLhBO3kW+VU3v+1mpP5WhH
	 EYlY7EgfmQySg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Yongqin
 Liu <yongqin.liu@linaro.org>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990
 devices
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
	<CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
Date: Fri, 05 Apr 2024 14:56:59 +0300
In-Reply-To: <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Sat, 30 Mar 2024 06:48:35 +0200")
Message-ID: <875xww3tv8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_045707_230284_8403CCC5 
X-CRM114-Status: GOOD (  14.03  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>
>>
>> The ath10k driver fails to properly handle fallback from board-2.bin to
>> board.bin for WCN3990 cards. This happens because the
>> ath10k_hw_params_list doesn't include .fw.board* parameters for the
>> WCN3990 platform.
>>
>> Add board data configuration for WCN3990. While we are at it, merge
>> common pieces of BDF support: drop .board and .eboard names from struct
>> ath10k_hw_params_fw and use the common name instead.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Dmitry Baryshkov (3):
>>       wifi: ath10k: populate board data for WCN3990
>>       wifi: ath10k: drop chip-specific board data file name
>>       wifi: ath10k: drop fw.eboard file name
>>
>>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>>  4 files changed, 14 insertions(+), 45 deletions(-)
>> ---
>> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
>> change-id: 20240129-wcn3990-board-fw-a2d97507a712
>
> Kalle, Jeff, is there anything pending on me on this series?

This is in my queue (Deferred state):

https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date

Unfortunately there is not really much time for ath10k nowadays so there
will be delays.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


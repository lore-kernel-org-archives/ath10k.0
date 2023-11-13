Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A91C4332F
	for <ath10k@archiver.kernel.org>; Mon, 13 Nov 2023 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJkDpLfa/FViBhIiyVOhGPSnmlWBF1p3iyDdf1xbjbo=; b=yolQOg/MDMTH5b
	ruy/0js2k0k0Skxdf0SScfkRXJvuVjXe0gV5yNoDqd9TkZvjmApvVnds6Q+vxRqzq/ncWknq7R5c5
	ZWSIMbyhzE3LYNgY/0bSWqC8SvBFdhLFxMcOPt8wkKth4DzDa8nIJoqg3NpOCgLnmK0eprvh5KHjS
	JtavUFyCXsj2lbn3mnTFAzKBEgjX3FIt6eNV+VQZdX7W6oB56oo0p5Pa8gk8ne5PkgnZLknvyaXE2
	W301ca0t2iRubD292JytBSmmnzoLgml7WhU2wNnI40u8lzbrcdTheMo+ONr0KkZq0yWi23R1b4Kku
	tViRw4uBW9SSfHJQacWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZCr-00EGsS-01;
	Mon, 13 Nov 2023 15:50:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZCo-00EGs8-0m
	for ath10k@lists.infradead.org;
	Mon, 13 Nov 2023 15:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C84C60F8B;
	Mon, 13 Nov 2023 15:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4A5C433C8;
	Mon, 13 Nov 2023 15:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699890629;
	bh=1RionFtnSpOWW7o/YkL7qWHsAndOMy/fEzDSsI29GyY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=l14qTkClnv23z7dwoUV0IrByBgqhpqmRjvktjRHdbOQd5mAojRYtndqHbyEYei7h8
	 s1l/2qF7LXzNvrAjLkbFY5fJpaUmtRwgPcz9MND73EfpXs+LnW9sNVXO62yZvGN/XF
	 GNU9qIp7SUHwC1uYjKjv3MAzNI7iuFqeqIAe7SK30mfdgmk+6qPz7XDBISyuPi0Pfn
	 8PIV/tM2oqNaEKKu3bzXFqsqGR73koq+Z4hKZd1f3zOUD+YxhQSA+UyXBw6+8odf5S
	 7KNV3Ob5/ZLQ9NUcjmuZvmn/wOmrd/jwoASUbMlPIsM3/tQ+ufYQz+97oK2+D2gJ1y
	 k/a7TRu/KqhHA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: add support to allow broadcast action from
 RX
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231017165306.118779-1-prestwoj@gmail.com>
References: <20231017165306.118779-1-prestwoj@gmail.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org, James Prestwood <prestwoj@gmail.com>,
 ath10k@lists.infradead.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169989062657.3473659.188127753057713210.kvalo@kernel.org>
Date: Mon, 13 Nov 2023 15:50:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_075030_341324_4C1120BA 
X-CRM114-Status: UNSURE (   6.04  )
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

James Prestwood <prestwoj@gmail.com> wrote:

> Advertise support for multicast frame registration and update the RX
> filter with FIF_MCAST_ACTION to allow broadcast action frames to be
> received. Broadcast action frames are needed for the Device
> Provisioning Protocol (DPP) for Presence and PKEX Exchange requests.
> 
> Signed-off-by: James Prestwood <prestwoj@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

On what hardware and firmware did you test with this? As there's so many
different combinations in ath10k we use Tested-on tag to document that.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag

As ath10k hardware and firmware can work very differently from each other I'm
suspicious if this feature really work in all of them.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231017165306.118779-1-prestwoj@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

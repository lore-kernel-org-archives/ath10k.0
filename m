Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC088C433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Jun 2022 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9TGLoTUEb7XQEdKwSflNL5BlfcFRVqD8XZu1Dc2T9vc=; b=qtv7WlGo81bFuX
	Il2LRupAGrIMLof9zWrGYRwXF2XRxox7GHkNL2vlix4wUcg+OTsiz5L8XD4VnsK31dU5vqv47FRXt
	AnZoByE3ok3pwYzfruRujKaD6utQyVDdcd86slnjiz/zdaEIf4g5TmJmTOAuDgQd/eDKqV16oJ6yn
	rKTlOGsH9RmfSfYO5zn3d+1XlZ2PVJrZ/oxuGTSi6c0zkMo7aHnJp+hPPgZxOdHQ8NzsxCS76O+Sc
	zJfW9VerlMwrkHOGpvAGPnuMqe8TcIZR/+juRGXV5Wp995T6A1XdTU/w5k/vxb2BHGz+y5mOh+Pst
	VuWeQpoysnd6uonC5j3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqvi-00BuYc-Cl; Wed, 08 Jun 2022 08:20:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyquM-00Btnw-KL
	for ath10k@lists.infradead.org; Wed, 08 Jun 2022 08:19:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05C9261671
	for <ath10k@lists.infradead.org>; Wed,  8 Jun 2022 08:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9E2C3411E;
	Wed,  8 Jun 2022 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654676357;
	bh=zpm7uxvBsWJE1tU+qeB6zg+UGt82gdSLolzqIx3w+G0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GFRyTl1QkwsC6VvNCCOhckTKVZWucKftsgm6gvlMUYg9KhsrEFldX+qCP6gDFrVmI
	 WdpnuB6y05ugEuennjGNVlz6L11C0fY7dI83kX52m5a02TAhTtJA1mr3UgOLnzzl+j
	 G1f8cXvca09xD2hkB2RWEo3RirCaVBHTA3wXDH2Qj2SjcRrx2ZRtPIqV6gtJBPuoaV
	 3Uv9pFPUy2S0nPTnYZnuwmGGEHT3CKEQct87Q1GIeaxvOHsEVPtG9oATafR6rVzt1q
	 6e7YlGA8eE3aZWOLbvO8d4PpUZw6haqy4ntKsKST6AM+Fx69VamskMinXaf0H0B1RE
	 3VYyhyIixrgbQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix recently introduced checkpatch warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220606142957.23721-1-kvalo@kernel.org>
References: <20220606142957.23721-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165467635481.2601.7190623758576823593.kvalo@kernel.org>
Date: Wed,  8 Jun 2022 08:19:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_011918_826073_613CD09A 
X-CRM114-Status: UNSURE (   6.32  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> I updated my checkpatch and saw new warnings:
> 
> drivers/net/wireless/ath/ath10k/qmi.c:593: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> drivers/net/wireless/ath/ath10k/qmi.c:598: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> drivers/net/wireless/ath/ath10k/htt_rx.c:3565: Integer promotion: Using 'h' in '%04hx' is unnecessary
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

cc2609eda698 ath10k: fix recently introduced checkpatch warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220606142957.23721-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

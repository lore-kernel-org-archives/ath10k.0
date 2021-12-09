Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C23C433F5
	for <ath10k@archiver.kernel.org>; Thu,  9 Dec 2021 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlduMZV6VN3H58+63qJbTN5V7r2H3JKzH3rrfTvKu7s=; b=H48c/ne840H0rm
	WwL+NIf+euwyQUgPq3L7pDC6K15lp5ojzgioTDOKe7pyq4E8P0IRqVK+CLBaO5sXHoy22B37n1BtM
	3q1Ho3h8qtu1k5lPEVOParjCAk2/u58yEtSjMKoexbTeSNppr0+Q5IwTjlPuKxd1nCKl6CsWI6zCb
	icym0v/MxpHX2xrthGwwU9k10k97cP2TB4b7EvfaUc6iQRx6mf7Zw5JbRUPB+Q4aXHItzYyvzZb34
	gKXeKRadp6ZXKhFq37gUGBovZLG2OH4T9G0eF3PAhcIBtzg7ef7FOXHl00HxzVx2tCeL96exu8QIo
	my1JGnlu+5ot5/ly9lGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvEbW-00FE50-4g; Thu, 09 Dec 2021 08:16:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvEbT-00FE4c-Fs
 for ath10k@lists.infradead.org; Thu, 09 Dec 2021 08:16:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 044A5B81671;
 Thu,  9 Dec 2021 08:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE99DC004DD;
 Thu,  9 Dec 2021 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639037792;
 bh=hHIZzJ4ztLVFhIuazZxbc+tg62aR9GAkzbKw4gDmRzI=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Xxz+Y/KwpHITbp/Xl3DyVSL6llXh8JeZQ2TyRgY5BKHLJcVTj/Zzrofvk5lIhC/R4
 pjBHaDIECnn9qENEptQG3d1b8IaZiP8sbmRBIlPrSY7+JiKo2lPelA5B7uoBr3Hya6
 ReuiJBhR1ZD+1uTCOcWpBUpsxjiCwchhNqgGqSUEBjczN39XR5MuSyEZ4CbeKXmfn8
 2KbPlfwhr/l50XxooeTnM9MOH/DsyDIdKcdVbCcRnAppqzQn9tj2UtWZNvJ6guFYl8
 dYFWaOq5/7KIR4k61AFAhXenMTkvXV5FBZRylqZLMPkfHAnWlaGQZM/tYWQUtu6oa4
 UzwZhTnkFMI4g==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: drop beacon and probe response which leak from
 other channel
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211208061752.16564-1-quic_wgong@quicinc.com>
References: <20211208061752.16564-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163903778980.12588.4204363037879005735.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 08:16:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_001635_711182_B4A561A3 
X-CRM114-Status: UNSURE (   8.96  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> When scan request on channel 1, it also receive beacon from other
> channels, and the beacon also indicate to mac80211 and wpa_supplicant,
> and then the bss info appears in radio measurement report of radio
> measurement sent from wpa_supplicant, thus lead RRM case fail.
> 
> This is to drop the beacon and probe response which is not the same
> channel of scanning.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3bf2537ec2e3 ath10k: drop beacon and probe response which leak from other channel

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211208061752.16564-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

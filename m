Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D888C433F5
	for <ath10k@archiver.kernel.org>; Tue,  7 Dec 2021 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3s+7TfMjJK1KvtR9lLxMlwWDENSL/aH2Ed6wHoiKwc=; b=ezoCcftSJMP4M1
	xeYaQ5OFsqE8z9BzfGSkvb5choQgwphJv893GmugBg1iUMRmU4lQkSHyxuK5DLTVnTtsTx/IdXHHm
	IHD043OPBx0OapdSGxNPHfGJcOxDBd8tuuF2hI3Intr1jPKyxxRrYcY9MRHrZ/zboOqykIe+YPT/e
	BXg9WKnpPq99dXZS8fxj/pog3kBpA2aCxE5IX2E20Vn60Sw8Uz+i6ibHo/MiSlOUgJF+3ut95kMiD
	ez9SIDcljdxuIRfVI0TW28J1zul01rStezbd2HOMuOmnKCY9kN+porlKelLb+nH3yePSOtOQxJvD0
	gJjhEq2IdAnluLBYKDaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucNE-009Cut-NI; Tue, 07 Dec 2021 15:27:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muc6m-0097KH-TB
 for ath10k@lists.infradead.org; Tue, 07 Dec 2021 15:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 293BACE1B7A;
 Tue,  7 Dec 2021 15:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99596C341CA;
 Tue,  7 Dec 2021 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638889815;
 bh=TpCeGBjQ3MUWVEA4q7VntxzPfqsdrgI5h/iHZsSD7fc=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=BtiDYtKPoZuZdaSwVe+gVAmimmwPUBzF65uJ4fBsuhfHSS0CiQBJBVK0xYlWUAY/6
 WbqO+EgJx9HrUBE9ctkmr5PInYoxuyH35oSydaGvVaJbI7sDuvCvTN0KX+WWuUmGLl
 5BPbbQpIEmVpvveN8v5i/XhNiVsI9Z20DiSdXSjjRwC+/m4z4I8tGyWHFuFCsOsWRc
 BBlPkhiCGohWi+kHgh0wEnD7MwlAshMweAin6VTJfTNwgeehlv2KCUwN3mmIsbKNo+
 IZU2IzHuBzTDXxsbLjoyh+4iuZqw93Tmf3Hx0GVIGShdpuRH61kduybG1lTI6t5H+v
 FMoYP1PNRL/jA==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: Fix the MTU size on QCA9377 SDIO
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211124131047.713756-1-festevam@denx.de>
References: <20211124131047.713756-1-festevam@denx.de>
To: Fabio Estevam <festevam@denx.de>
Cc: kvalo@codeaurora.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wgong@codeaurora.org,
 Fabio Estevam <festevam@denx.de>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163888981163.18601.16356465928600024719.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 15:10:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_071021_182383_2518A490 
X-CRM114-Status: GOOD (  18.26  )
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

Fabio Estevam <festevam@denx.de> wrote:

> On an imx6dl-pico-pi board with a QCA9377 SDIO chip, simply trying to
> connect via ssh to another machine causes:
> 
> [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> 
> , leading to an ssh connection failure.
> 
> One user inspected the size of frames on Wireshark and reported
> the followig:
> 
> "I was able to narrow the issue down to the mtu. If I set the mtu for
> the wlan0 device to 1486 instead of 1500, the issue does not happen.
> 
> The size of frames that I see on Wireshark is exactly 1500 after
> setting it to 1486."
> 
> Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
> the ssh command works successfully after that.
> 
> Introduce a 'credit_size_workaround' field to ath10k_hw_params for
> the QCA9377 SDIO, so that the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE
> is not set in this case.
> 
> Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.
> 
> Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

09b8cd69edcf ath10k: Fix the MTU size on QCA9377 SDIO

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211124131047.713756-1-festevam@denx.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

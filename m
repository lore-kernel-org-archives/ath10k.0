Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C13CE784AB
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPZb4FvfMdFhpMJrzHRC31sF7X1IKbqDGW7sIvGNr5E=; b=be6Fsn7RD5vO80
	KCI7/tnXifA9T/ZKb9cpZ5rn2K2AYVusY2OLvwmNnrUAPO73D5NVvwIZudKz9g4uShpmtASEm08oz
	K4guFEJ7gHb+vPyd5Q+t51Q2BN+zDf19sAmjUpU6jZBfHOU+Oh4KkBSpkUxzw/GO+aAJ98lY/bD8S
	xQsrNOmOcunkyYZWKJiYQmOCF/phtFFuxfdflTtE6QOJNGs3kGwEKIYJvkA4h0b2Z+cHw+XDVKayS
	51FgDMp6yKHJu0dOVj1n5GO9EZuvmctyBsRVKT0yqmeY/+7JgeFESziw1KxRjdm+eXuZo05ppc7r1
	Uf+64FPwKWWia/yWWjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMGe-00D73I-1o;
	Mon, 02 Oct 2023 16:59:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnMGb-00D72x-2O
	for ath10k@lists.infradead.org;
	Mon, 02 Oct 2023 16:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 62237B810F6;
	Mon,  2 Oct 2023 16:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9390C433C8;
	Mon,  2 Oct 2023 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696265971;
	bh=Zo9c2Ppi/WpONYzKUs6UGR+A1VsQtNmDXzGoZqUCFqg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QGJLEx8C4gdUQrc+7f1dKhMSumXSjzwiMhBppKwQUOImwi773cJVeauJ/z0Myfxcm
	 VJPNukKOXPXKZFfzMf1zsn1E0SinzjIYDit1s5PSFf80HctxZccNuIZgfcwK9Km92I
	 6zSzeo9Q38OcG4LLBU8mRLr3RX8H75vLKnlD3DK3qwx9k8l+x0NMUXkTUV+QQo0VIb
	 wUQ1R6RhOn1Ecdlaj9CZbjEaN92BaxJQpjd009ZLaxYfKUKll+y8SLK32W600lQVzZ
	 zh6ZY1Q7ZP93OWb+s1xHXCWsmU3IgrnN7wPCtFatxrOEvd3ap7SqX2idSQ+F6vkI8O
	 1OSV6ZS7iK82Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: indicate to mac80211 scan complete with
 aborted
 flag for ATH10K_SCAN_STARTING state
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230626024232.15579-1-quic_wgong@quicinc.com>
References: <20230626024232.15579-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169626596907.3936351.16766976807544333414.kvalo@kernel.org>
Date: Mon,  2 Oct 2023 16:59:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_095933_945752_5FD2F82D 
X-CRM114-Status: GOOD (  11.34  )
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

> Scan failure can not be recovered from when running a loop of the
> following steps:
> 1. run scan: "iw wlan scan".
> 2. run command: echo soft > /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash
>    immediately after step 1.
> 
> result:
> scan failed and can not recover even when wlan recovery succeeds:
> command failed: Device or resource busy (-16)
> 
> reason:
> When scan arrives, WMI_START_SCAN_CMDID is sent to the firmware and
> function ath10k_hw_scan() returns, then simulate_fw_crash arrives
> and the scan started event does not arrive, and then it starts to do
> recovery of wlan. __ath10k_scan_finish() which is called from
> ath10k_halt() is one step of recovery, it will not call
> ieee80211_scan_completed() by logic currently because the scan state is
> ATH10K_SCAN_STARTING. Thus it leads the scan not being completed in
> mac80211, and leads all consecutive scans failing with -EBUSY in
> nl80211_trigger_scan even after wlan recovery success.
> 
> Indicate scan complete with aborted flag to mac80211 for
> ATH10K_SCAN_STARTING to allow recovery from scan failed with "Device or
> resource busy (-16)" after wlan recovery.
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00174
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d876188ab807 wifi: ath10k: indicate to mac80211 scan complete with aborted flag for ATH10K_SCAN_STARTING state

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230626024232.15579-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

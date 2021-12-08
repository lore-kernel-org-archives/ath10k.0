Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960BFC433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P43++RuU9ewbchaRAodj5MZmpCS+S6v506o8DR9VT2E=; b=TCraWpSeJdvEyF
	LJIYq0S43Gg591B2pVxlcxXUElq5samIpKu1wvS0hTk0t0pB5UKIqHZqf5DRH1Gq/yWRC3MMg6EEA
	FlHFtZcc4DKiONf+3yTz5bWc5ZyfMVeocelu244nrrRB5Ip+m7tTi1JzszPqSqBTlJbxU/fbw1pe1
	PonQhz7xes6h112kAZPAq2bfbt1AUGOx9dmewO5ySLpPFGsqOyjxifS/PYa2TOgaOAIRP7iUWKXev
	QWsLs+Dc8CVI12XuuwDVCekGdv7BkoEGLsetU2uy8ki1eaxqJjWCAVmTlblAlt+1p79KXKsmQyR68
	VrXvJaJ+ZTpDvA8KykNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musSt-00BkGV-RX; Wed, 08 Dec 2021 08:38:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musSq-00BkEa-In
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 08:38:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53600B81FDA;
 Wed,  8 Dec 2021 08:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A65C00446;
 Wed,  8 Dec 2021 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638952690;
 bh=031cFlVIWHAdjAyO7ac8QoUiJkrzGitfCrvbYxsd4K0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=WlTu2E5yPbnvJbA6UbtJ0yNDzq7MY0gBlwJWLJIYoDv4z68P0Y20T3RTQ8QSxGq/Z
 1+cGNrBuqjxazyaSQ6Wfvbx6NbdiLtxF/Oz+txei1pNOY4d4eU2t3+1eKlJcuYuhCh
 FhQ7DhVE9HNJKZnOqyexfseyu1IK/utdjpBpxRAhKy0NO9Vh1EEqABPnv2rpgkxLyR
 UDjIvc4BU2JCzWrgEVutC1nfA87GHr4/9lf2VvDeOFn+YAxLVxu/iyhbpnnePBKBxb
 k7yVZnuPn1JnoI4T95d+dBcE3USnsxKZwIScGcehDtIv8yPSGuaE4q0ZNzFFH38voc
 P6Q9wRbFLlRnA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix tx hanging
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20210505085806.11474-1-s.gottschall@dd-wrt.com>
References: <20210505085806.11474-1-s.gottschall@dd-wrt.com>
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163895268758.29041.1351445152557933914.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 08:38:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_003812_810026_8F21FE18 
X-CRM114-Status: UNSURE (   7.80  )
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

Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:

> While running stress tests in roaming scenarios (switching ap's every 5
> seconds, we discovered a issue which leads to tx hangings of exactly 5
> seconds while or after scanning for new accesspoints. We found out that
> this hanging is triggered by ath10k_mac_wait_tx_complete since the
> empty_tx_wq was not wake when the num_tx_pending counter reaches zero.
> To fix this, we simply move the wake_up call to htt_tx_dec_pending,
> since this call was missed on several locations within the ath10k code.
> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e8a91863eba3 ath10k: Fix tx hanging

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210505085806.11474-1-s.gottschall@dd-wrt.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

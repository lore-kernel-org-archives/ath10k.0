Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364E9CF6493
	for <ath10k@archiver.kernel.org>; Sat, 28 Sep 2024 09:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3LGslptGHS6WGkdPoPtR6spQHrvSJABxZ7esNpimCk=; b=dYq1BUTHuTLmfS+HlARXVp0l/f
	fCg34cRA43/jVb+L/8kFMXzXl2snNXoVYL8y7Jkh/VBLoACGWPRJMa6mUrHpM3zWJhTvv0JISz6EA
	AmZmrk8hZFoigbUR48bWqkID8898mP2dbELPOH65TUVTSMOq4QrZfcuj1I0cJuWQw4ab6yLbabYxa
	/eszsbbjO7pCydkTyxZT+ptiCf+YTHnuxEHBFKTME36NROdKFrzobW2wrj9PR/v9Wa1k9DzNxcEef
	IiYCcah1/E7DCSFawS+mThM7VSz5G0C3RmDw5nKKBnb0PyWc5YubPq0xw6yB5vr/9C3zdD466uIJ4
	ukLGORrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTWd-0000000Crie-3ZtL;
	Sat, 28 Sep 2024 09:14:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTWb-0000000CriD-0jWU
	for ath10k@lists.infradead.org;
	Sat, 28 Sep 2024 09:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 394FDA4016A;
	Sat, 28 Sep 2024 09:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22CCC4CEC3;
	Sat, 28 Sep 2024 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514840;
	bh=MuoyHGLE+6W/2kYjgGiz6aPF6NyGFpk0q3YTEbhJ22Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TlIvXf7ImSnY4yM5siqqjl1q/xZydstwz7wwTCtuS3iomiFU7tR948oHz2bkvdtbd
	 M3x9r2vWhFEc0N64RkMhJ/TZY8zcURUOyl8lMhX4TCP7FXkf0n6zTknUUYexAH6r+6
	 y9pukfTvAl6GuxAfVXFR/g/FkHGnfJM5MA0ZW1FvODaI9nplOoHLlRDOZEN+RjGKQ0
	 7yuHaE7TjM0IdWKrod04AVACpsuVFx2emkkfcAcLr5j74HccsDy0c2qLZF5wL9/tVM
	 jfJNJ0IpgrOP5vcz1s/dkk5GARD15v86rOEOLbOAy3vlq1XyZ1U2hFjxIovrSGc/sD
	 6IWXZOtNsIZww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath10k: fix the stack frame size warning in
 ath10k_hw_scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240830015649.1083758-1-quic_miaoqing@quicinc.com>
References: <20240830015649.1083758-1-quic_miaoqing@quicinc.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751483707.2249584.11310873270275618668.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:13:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021401_298117_7463CB17 
X-CRM114-Status: UNSURE (   4.88  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:

> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function ‘ath10k_hw_scan’:
> drivers/net/wireless/ath/ath10k/mac.c:6468:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Compile tested only.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

acf8304b58e8 wifi: ath10k: fix the stack frame size warning in ath10k_hw_scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240830015649.1083758-1-quic_miaoqing@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html



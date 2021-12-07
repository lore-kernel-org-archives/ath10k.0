Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A05C433EF
	for <ath10k@archiver.kernel.org>; Tue,  7 Dec 2021 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUDZcts/aWxP8tojTslq1/TUW1ZvjN8ZS6RQAjoWmAQ=; b=ujHALe+C2a6xyy
	tFvtnH0jIE8zi55s2soRm9dADb+VM0jkor/2fQOdEPHiUwLqB0QkgfiOqCkZinbxmwh1dNd76qvqg
	D/dV8rXshsorJRl86JgQMI6ldhb36Ijd3wZoH/qMmOUlOEyePj1sHzQu0pXoLmbVcMMz+CouFiKfo
	bf2z9NTOy5KF5SVZ9n8+faBHRRoK09FB30j0Cp1NpFWkPWLg1VQJ1cWDUqDQU9WaNxBVdOVHGAAA0
	uxe4q98Y8CQHenDMGTr/L48hSetD3UekiPW45VelFJcRZhMKgZ4oDRkD5UWPGSchA2A9h4UJkBu4v
	WrUYK7nDzbH3UrStUzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muer4-009e2F-Q6; Tue, 07 Dec 2021 18:06:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muer1-009e0m-Di
 for ath10k@lists.infradead.org; Tue, 07 Dec 2021 18:06:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9FDA9CE1B1D;
 Tue,  7 Dec 2021 18:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B6DC341C1;
 Tue,  7 Dec 2021 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638900371;
 bh=j9hWvmDnSHhLayK/S4LB2G5JlhTIiHuWMU7YUw+Jl4s=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=qvwmJpCYS2z63ywOJoiE/LKGUBCvwi1+d60H1ZyiJ/EX2TXn8fddEdk15mWGZ8IoL
 9s0i6h+vnFXZxaxuRfodg4OECnKP+YRjeT97gSLxlHWAMi03MCv9O6OWUAmmCMuSlk
 uWRITrqocUk6CnIsxkubxOnAh5c2rLkzaYwrxoIFMDDRb92B/rHNXtc21rH2qbkwQT
 swPXvzzvOQoqt+ze0guZZbqCWtzN3uxMkgL5ZwiyrC0DpHyWHpglb39WIevVu1ajx2
 WkpNHJoBFNIT5vHUeuOX1h8gxqlu8+c0lZ3jSrvpMWXETJtAsIXaljnqCbo9e4QgiJ
 deRLDJ72/DcHg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211009221711.2315352-1-robimarko@gmail.com>
References: <20211009221711.2315352-1-robimarko@gmail.com>
To: Robert Marko <robimarko@gmail.com>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Marko <robimarko@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163890036783.24891.8718291787865192280.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 18:06:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100615_689389_AE99FD20 
X-CRM114-Status: GOOD (  16.00  )
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

Robert Marko <robimarko@gmail.com> wrote:

> Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
> BDF-s to be extracted from the device storage instead of shipping packaged
> API 2 BDF-s.
> 
> This is required as MikroTik has started shipping boards that require BDF-s
> to be updated, as otherwise their WLAN performance really suffers.
> This is however impossible as the devices that require this are release
> under the same revision and its not possible to differentiate them from
> devices using the older BDF-s.
> 
> In OpenWrt we are extracting the calibration data during runtime and we are
> able to extract the BDF-s in the same manner, however we cannot package the
> BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
> the fly.
> This is an issue as the ath10k driver explicitly looks only for the
> board.bin file and not for something like board-bus-device.bin like it does
> for pre-cal data.
> Due to this we have no way of providing correct BDF-s on the fly, so lets
> extend the ath10k driver to first look for BDF-s in the
> board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
> If that fails, look for the default board file name as defined previously.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Can someone review this, please? I understand the need for this, but the board
handling is getting quite complex in ath10k so I'm hesitant.

What about QCA6390 and other devices. Will they still work?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211009221711.2315352-1-robimarko@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

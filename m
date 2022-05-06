Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D4C433EF
	for <ath10k@archiver.kernel.org>; Fri,  6 May 2022 06:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHP6dQyCdLnKn+qjGoDG8pGll/I6n0jlZ1lFxGA0I5g=; b=bV4uDPKTb5sH4X
	3/U+xMo/3cIJucZOSHYbDUfunJxqp+PK+IMPL57OTbsBdKzNi86MbDuHnxHWdxc9OGRs99SLmY/em
	kZvjP3wRnWN4tBxrZ35kSAK+X5pY7CEghwoI7doMwmlBRjuof+xZuTPVu++5v3n0hzonVaB9OaFoZ
	8hQyy0KawmtR+rE48ALmodboCDVzeREg8yftRlSbdoobFmVkoo/eGQRFatvXvpaVMeufZtQ9PMtoZ
	difTIeOpv9JbY4ZXwsnfvxj1VdFMJ7xK+XTFZqlQJHHq1QUpZAnqwkybGgp81pNZwz/u+qp2b2994
	PAzl2dZ2K0QZhQ4TvLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrJo-001YzT-IK; Fri, 06 May 2022 06:20:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrJl-001YyY-JJ
 for ath10k@lists.infradead.org; Fri, 06 May 2022 06:19:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10876B83335;
 Fri,  6 May 2022 06:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8924C385A8;
 Fri,  6 May 2022 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651817994;
 bh=V11+LAWJ1d5l67vnmx/JvBJkQlrT/ck1awnxoU+USPo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Td39A2a6SjBgRUPWf5cFiqwthdL+PTezWMG3cVnxsMqzDIghnZwRiSVZCCJluRK7d
 D6qfreohXvGy0Qu2Zq89EgecScEo+tIgygb7sO09B514YTaxy6OCPPUx+hZ8iocr8Y
 0I0ThOa/ryEEViBVJ1sajMCvuuJQycWDdpBmbRIBXRTN7DoEaqX2c7o+LB867yFE0u
 A1GXvIuAv7e+OCwAQRc8+GJ/xuBdYfHzFO0DiKQaeOodZlstflCsAFHlCc58bMOCMX
 9HcKY8taN/K+ygFkfr9NDOsYexRJWSTQHB5j3XY8qVQ0EJ2oeF+oRi4TufXm5zS7R4
 4Hw3vaLXNblqA==
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
Message-ID: <165181799100.13324.13296205363993224857.kvalo@kernel.org>
Date: Fri,  6 May 2022 06:19:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_231957_811862_7FDEBD5B 
X-CRM114-Status: GOOD (  15.67  )
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
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f2a7064a78b2 ath10k: support bus and device specific API 1 BDF selection

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211009221711.2315352-1-robimarko@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

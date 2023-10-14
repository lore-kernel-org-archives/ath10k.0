Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9634ACDB465
	for <ath10k@archiver.kernel.org>; Sat, 14 Oct 2023 05:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qfi8D5IL1JYw5PLfCOB3bv5RtNCBtAX2JO40ZLLvcIc=; b=O0mrcf7dp1Uoau
	Sw3gmayxC4UGtvbw+BkaVgZ8ZEgF4qa7XJIfjUryb0Uz7GSvZPErOliN5vtiVssfQMAveLYfgWxiQ
	JB0Rj37JU6JmUsrBj/8RE/vaZlYsd14fRDPe8X854asXSm3oUvFro1qLOtNLKFA16lFeLEoIVDgaM
	BRorel9RV5DuenjvDnufjEnrETJ/cg1YbMyTdeaoJnOZ9td4D+8fC47dh2zTxCCycuBE9gfF5fJFE
	NAcgIfnkJ9Qhew67Iuj3IbWrTXDR3OVoK8yuCCtcofpNwxBO/Y69ZodrIDputps3PmD9tyYe2uQG4
	wC4kL/vZRsBogkxe4Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrX4U-004o49-0x;
	Sat, 14 Oct 2023 05:20:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrX4Q-004o3n-38
	for ath10k@lists.infradead.org;
	Sat, 14 Oct 2023 05:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84BDFCE31E1;
	Sat, 14 Oct 2023 05:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838B0C433C7;
	Sat, 14 Oct 2023 05:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697260809;
	bh=Ytj2/J6JoBkWt+fErmzSJIMEUCzhsog0az/dPrYSoqI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ICYTGHBrHoTDiCb37W1wDlaDlK2hb/Usrv/wIXwmxTCIWFzfO9QvRdHfeAbkk45gm
	 OtFGC3aMI5oB9BrXLw5R675UrRIvEZleHHRci0z0YyJaAxxHmHI/eNdGcYSQMbxXvk
	 YLu9JKXVZl/AZ3mfmFT0q0FyYyBjudqMVgdOhDYF07XRNDENqcCOqdNfkvAJBUXs1x
	 aSOqcfKQK4oY4fcBsv9vsR4oUCAKoNw1LmLpFV8o5NXLHe+4VDpZPNJo5CWLgpDi8k
	 NDFu6b2/fgdUCusNpdKVD8TemfPcRWlfp+cNascn79BgHfWV5a9cACas3mSKLjrj6h
	 C5hreUQFnu+qg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>,
    Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: johannes.berg@intel.com,  linux-kernel@vger.kernel.org,
  netdev@vger.kernel.org,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/2] ath10k: mac: enable
 WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON on ath10k
References: <20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid>
	<169634426707.121370.9448850980134728319.kvalo@kernel.org>
Date: Sat, 14 Oct 2023 08:20:05 +0300
In-Reply-To: <169634426707.121370.9448850980134728319.kvalo@kernel.org> (Kalle
	Valo's message of "Tue, 3 Oct 2023 14:44:28 +0000 (UTC)")
Message-ID: <87il793hmi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_222015_244553_7B993EA1 
X-CRM114-Status: GOOD (  10.34  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Abhishek Kumar <kuabhs@chromium.org> wrote:
>
>> Enabling this flag, ensures that reg_call_notifier is called
>> on beacon hints from handle_reg_beacon in cfg80211. This call
>> propagates the channel property changes to ath10k driver, thus
>> changing the channel property from passive scan to active scan
>> based on beacon hints.
>> Once the channels are rightly changed from passive to active,the
>> connection to hidden SSID does not fail.
>> 
>> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
>
> There's no Tested-on tag, on which hardware/firmware did you test this?
>
> This flag is now enabled on ALL ath10k supported hardware: SNOC, PCI, SDIO and
> maybe soon USB. I'm just wondering can we trust that this doesn't break
> anything.

Jeff, what are your thoughts on this? I'm worried how different ath10k
firmwares can be and if this breaks something.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E634C4332F
	for <ath10k@archiver.kernel.org>; Thu, 22 Dec 2022 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C80t96W1guGdmWPjaxhIRifPj5Nvfl7dq8wX/2JcdIU=; b=t8BI/bvq6AeZ5X
	+C/cG8qi9ZjiJzGzsEzYaZrPSjT5fbMIJGMcJ0eGxImRyt4lCnP6pHOQKK32/WDll6Li/YIpx+Qyu
	kNFDX0g4dGwA/VWURwVVKFTb+fvQv5G7lUV3ojcHZ0Bl6f55IXxCFvYAz8blCO8C1vZTwFyvRWBho
	hw6L7sSBM2Wst9IVnc6HxJs6f+VYt+0VkOOgJfiSpaG3CxvW1vDDIT1ZbRY8gVDz83zrcVSf7bVI6
	6thpZ6jgMbaE7EXuftQ7aW4VEJDUeMg205+x38do665HaQid2/6xDfMt/vLR1Y1VmlLAU8EMNl24+
	n1LP+P3qS7OXqa6snhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8MPp-00Csle-JA; Thu, 22 Dec 2022 14:19:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8M81-00Ci5a-Bb
	for ath10k@lists.infradead.org; Thu, 22 Dec 2022 14:00:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CCF33B81DA4;
	Thu, 22 Dec 2022 14:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2805CC433EF;
	Thu, 22 Dec 2022 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671717654;
	bh=mMJUumurLoq9HMhtBSrfesshi3z9lboXd0zA00aEbJo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=H9iO/VvWX3/N2WbTe1LCDvEzmt74OnGoRy50zSDRYaJpFyqpM/OAI4tkTN65bcFXk
	 yFA1F+wEtKHMZUOOmn1asFEf9pnfjsBM+vXgH9DYPQ+iTbOiluGYo06xNFxjxh73Py
	 szLLA92w6W22PedGGV6+x+TJDN9VOEFpWk1Rm7GWxJfPMDvR9rd1gvCOtYQnY3RKBu
	 rVz53/OqyyfXcSnvtM70b4sxyurUM0rpNbNEDqg3aZcY/66Re7JByeqwvbwZbeaJWO
	 gvEgNJdV4768rgbI6w+ZQSx2Zl4XmEqcnKfXniW9447/5hQkdRYN7vdL1TD68ctXyI
	 wkiKPUD4m0Bpw==
From: Kalle Valo <kvalo@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <johannes@sipsolutions.net>,  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  <quic_mpubbise@quicinc.com>
Subject: Re: [PATCH 0/2] Update the channel list if the change in channel flags
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
Date: Thu, 22 Dec 2022 16:00:50 +0200
In-Reply-To: <20221222124221.30894-1-quic_youghand@quicinc.com> (Youghandhar
	Chintala's message of "Thu, 22 Dec 2022 18:12:19 +0530")
Message-ID: <87fsd7zgfh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_060057_606189_FE2BC9B8 
X-CRM114-Status: GOOD (  15.91  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> writes:

> There are connection failures in hidden SSID case when the device is with
> default reg domain WW.
> For WW reg domain most of the 5 GHz channels are passive. When device
> listens to the beacon on that channel, the driver is updating its channel
> flag but firmware is not aware of it and firmware is not sending probes
> on that channels.
> Due to this, we are seeing connection failures when the device is tries to
> connect with hidden SSID AP.
> Whenever the driver detects a channel flag change, send the updated channel
> list command to the firmware.
>
> Youghandhae Chintala (2):
>   wifi: cfg80211: Add beacon hint notifier support
>   wifi: ath10k: update the channel list if change in channel flags.

If you submit patches again, please _always_ increase the version number
(ie. this one should be v2). Now there are two v1 patchsets and
difficult for maintainers to pick which one to take.

But don't resend the patchset just because of this. Hopefully this mail
makes it clear that this is v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

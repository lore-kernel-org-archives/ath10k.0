Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C3D729E7
	for <ath10k@archiver.kernel.org>; Fri, 29 Nov 2024 16:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IctVdeL53Qnwh11oA+U96b5MaLBOX2K54knitT6yn0=; b=JBNzDtNiZ+M5vuyQZHEtNtceIz
	awBmNt7WHyTny5qAgMrIB03lDMjbMuqFk77oN90m7rIYUfC7+GJSWxphTvMeLus7k2LPDbbr0mP1G
	46rSEzW+fm8D90UT2lhwlgWbUztxwDLIHBcB5N1v7CtAyHDFNdJp0Y2o1l6kKQitEEKLlbBSw0iYS
	JNh+Wqz7a2To5DYld1xy0p3BxDRU0PRIfiLaVsdaS2pGnzhdiwfpS18X43cPLu9qja0dRFivEWcn8
	eSsJ6MUyetBV6kVsL8YGoz5DsiPO1b1H2XYYHQsHZTZjSBEpUSXm7XBge14BpmWoMOdYiVR+sOhpB
	U143SAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3wl-00000000cWm-2IF9;
	Fri, 29 Nov 2024 16:34:23 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH3w6-00000000cGQ-1bl0
	for ath10k@lists.infradead.org;
	Fri, 29 Nov 2024 16:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1732898909; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=+IctVdeL53Qnwh11oA+U96b5MaLBOX2K54knitT6yn0=; b=fetcorSf6PJKKxy6dDxjCJhEID
	5D3FHFW3yJ23t5u9PpyY+Z+RulEKPGoeZO8DGsosSxeSGrExYlHvnm0bhMRR4O1GsGaFDnFTHNojQ
	vEXtJtTuxLuu59B4IqCaP0n979uOI9RppANCqFiloNe5SrOggLs6N/huVBUTKGh03XJavbXjj8bAd
	HPsKAfX0jCw3tlxN8mJV/Qgd4j2soKph0XYT6K5xGIotaeYs4Wjt8e8yA09tXPDQZC6DayuMtvMhh
	QTUkFur5VBuYFGZUBTKSvOgxQM/UP8nleGxch/O9uj89n0UjPg2ZE7leqEb68YkkHA09xW5RjoIky
	1M4JQ1Ww==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1732898009; h=from : subject
 : to : message-id : date;
 bh=+IctVdeL53Qnwh11oA+U96b5MaLBOX2K54knitT6yn0=;
 b=myy9rZtafxw05E7+gjLnhFmIwBRsNC7ak3K4yoBOtd2CTydvWHbrBA0vPIAnKJWHWDLGq
 6madFljP60Ho2Iu//nh5NGgYt5/uOhssPQVgIkB65czaNWqq9nsVkgkFDVo4wMtbieDOYiu
 rPgg85RpWPZNRCaWFDny+TrsghitQMfYHYC8XflbDLkPa9ZZNyJded5U6pAgHBnTT4K2iZE
 r60vtBin788hWGZrjxM38AJeN11/K6YHoVKppUlvOTAqx03ZZO98oP9pa1fhIA8rk5MQM7i
 k91aSobX2z38z5BzsZHMLqaF+BS/901B6slga0O9gl/Sgpk2hyNZMP9B0vbA==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1tH3vp-TRjzld-Ag; Fri, 29 Nov 2024 16:33:25 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1tH3vp-4o5NDgrmzk3-oOOG; Fri, 29 Nov 2024 16:33:25 +0000
Date: Fri, 29 Nov 2024 17:31:58 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: James Prestwood <prestwoj@gmail.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Subject: Re: [RESEND PATCH v3 0/2] Improve ath10k flush queue mechanism
Message-ID: <Z0nsfoiPOHiKIXvH@pilgrim>
References: <cover.1732293922.git.repk@triplefau.lt>
 <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20215f63-e2e6-4f9a-bbbe-d7535c5ce9d2@gmail.com>
X-Smtpcorp-Track: tgXGquF8eO2A.z4bVPIitmJ5w.h0QnDgsu7uO
Feedback-ID: 510616m:510616apGKSTK:510616sMuY_9l13u
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_083342_816724_3BE5ED0B 
X-CRM114-Status: GOOD (  39.06  )
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

Hi James,

On Tue, Nov 26, 2024 at 04:57:36AM -0800, James Prestwood wrote:
> Hi Remi,
> 
> On 11/22/24 8:48 AM, Remi Pommarel wrote:
> > It has been reported [0] that a 3-4 seconds (actually up to 5 sec) of
> > radio silence could be observed followed by the error below on ath10k
> > devices:
> > 
> >   ath10k_pci 0000:04:00.0: failed to flush transmit queue (skip 0 ar-state 1): 0
> > 
> > This is due to how the TX queues are flushed in ath10k. When a STA is
> > removed, mac80211 need to flush queues [1], but because ath10k does not
> > have a lightweight .flush_sta operation, ieee80211_flush_queues() is
> > called instead effectively blocking the whole queue during the drain
> > causing this radio silence. Also because ath10k_flush() waits for all
> > queued to be emptied, not only the flushed ones it could more easily
> > take up to 5 seconds to finish making the whole situation worst.
> > 
> > The first patch of this series adds a .flush_sta operation to flush only
> > specific STA traffic avoiding the need to stop whole queues and should
> > be enough in itself to fix the reported issue.
> > 
> > The second patch of this series is a proposal to improve ath10k_flush so
> > that it will be less likely to timeout waiting for non related queues to
> > drain.
> > 
> > The abose kernel warning could still be observed (e.g. flushing a dead
> > STA) but should be now harmless.
> > 
> > [0]: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
> > [1]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
> 
> I saw in the original report that it indicated it was only for AP mode but
> after seeing this and checking some of our clients I saw that this is also
> happening in station mode too. I only have clients on 6.2 and 6.8. I can
> confirm its not occurring on 6.2, but is on 6.8. I also tried your set of
> patches but did not notice any behavior difference with or without them.
> When it happens, its always just after a roam scan, ~4 seconds go by and we
> get the failure followed by a "Connection to AP <mac> lost". Oddly the MAC
> address is all zeros.
> 
> Nov 25 09:09:50 iwd[16256]: src/station.c:station_start_roam() Using cached
> neighbor report for roam
> Nov 25 09:09:54 kernel: ath10k_pci 0000:02:00.0: failed to flush transmit
> queue (skip 0 ar-state 1): 0
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
> notification Del Station(20)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_link_notify() event 16 on
> ifindex 7
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
> notification Deauthenticate(39)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_deauthenticate_event()
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_mlme_notify() MLME
> notification Disconnect(48)
> Nov 25 09:09:54 iwd[16256]: src/netdev.c:netdev_disconnect_event()
> Nov 25 09:09:54 iwd[16256]: Received Deauthentication event, reason: 4,
> from_ap: false
> Nov 25 09:09:54 kernel: wlan0: Connection to AP 00:00:00:00:00:00 lost
> 
> Other times, the above logs are preceded by this:
> 
> Nov 26 00:25:25 kernel: ath10k_pci 0000:02:00.0: failed to flush sta txq
> (sta ca:55:b8:7a:91:4b skip 0 ar-state 1): 0
> 
> Note, the above logs are with your patches applied. Maybe this is a separate
> issue? Or do you think its related?

Thanks fot the test. Yes this patchset is here only to fix the issue for
AP (this caused AP to stall all traffic for every STA connected to it).
So while this issue is interesting it is not addressed by this patchset.

Out of curiosity I tried to reproduce it currently trying to roam an
ath10k sta back and forth two APs (same SSID/psk, different channels)
and wasn't able to reproduce with wpa_supplicant, didn't try with iwd
though. Or maybe the AP the sta is roaming away from has stopped
responding, in that case I don't know what can be done here as it does
not seem we want to drop pending frames (as we would prefer to deauth
cleanly from AP in main case).

In any case still I think this is a separate issue and it is also way
less critical than the AP one (one STA can create ~4sec DOS to the
entire BSS vs a STA took more time to roam away if AP crashed).

Thanks,

-- 
Remi

> 
> Thanks,
> 
> James
> 
> > 
> > V3:
> >    - Initialize empty to true to fix smatch error
> > 
> > V2:
> >    - Add Closes tag
> >    - Use atomic instead of spinlock for per sta pending frame counter
> >    - Call ath10k_htt_tx_sta_dec_pending within rcu
> >    - Rename pending_per_queue[] to num_pending_per_queue[]
> > 
> > Remi Pommarel (2):
> >    wifi: ath10k: Implement ieee80211 flush_sta callback
> >    wifi: ath10k: Flush only requested txq in ath10k_flush()
> > 
> >   drivers/net/wireless/ath/ath10k/core.h   |  2 +
> >   drivers/net/wireless/ath/ath10k/htt.h    | 11 +++-
> >   drivers/net/wireless/ath/ath10k/htt_tx.c | 49 +++++++++++++++-
> >   drivers/net/wireless/ath/ath10k/mac.c    | 75 ++++++++++++++++++++----
> >   drivers/net/wireless/ath/ath10k/txrx.c   | 11 ++--
> >   5 files changed, 127 insertions(+), 21 deletions(-)
> > 


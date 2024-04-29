Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E0AC4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 16:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWVUVDiezh3AYD276Cwq3u1xzZOVsqMpzyzltwIEln4=; b=bKfgm5uqMPrMWdhzrapxkBBeax
	q6j4wTG0OuuAmE2im8R6ChxEl4T+MRTQ94GAuRB3PuZka2aVK1gbTa2ph9jpieWlVBFMRFvHGcGnO
	HNXiiqf9UEnMy7ATsuzRfHKlrGxQH0I5thruppQDnhIvrXhmWx3p2xT9+tD3LGX94MoGAH0xRWoQ/
	qcrUcUoA4gO5sZLuPbK0HbD8k7XrJ6gwWsC5Ld0VCqiizXr86e2PFkMsSkSzvunxjX52oCWJJ81Rw
	VLY0kuqZwG0w1CYTvfJPZAN7i98lpFS30xwVzWgDywfb6PDEaOCSmsW51BbNFB8Od70a9VC0+4gl/
	+Pwhnqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tvh-00000003asG-04Mc;
	Mon, 29 Apr 2024 16:32:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Tvd-00000003arK-3J83
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 16:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FDB3CE0D01;
	Mon, 29 Apr 2024 16:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8E8C4AF14;
	Mon, 29 Apr 2024 16:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408350;
	bh=hLFKbkwGlDA6FS4rREGwqxgTc+PGZNjUXyhWZmDKbAE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=E0fuhGbVgjkMfyWgX2ooxWR8oT3ll33clq+Mp2G0zuygMua5yC5X5rX0gR8nAdaNM
	 mdFWUz+t66w8/aLMkOgtAtjl+1hW849n4wGH2o/P/XZazEyFZHkYWlO9dEhuT92Zq5
	 75zMKzPOkVP8Ep5aZ4RgDx3/8dkF0xlP8bDbPCdmQqu0kXM/pxPUGy+a6SkInEfoB8
	 L1D37l16Rix7kyNlYndmjy/235GQv41pdh1AzlmoXDLgAgdLYOPnL4y6Iqh0OEtmwK
	 7OFkJ8RppGUyIIRqG/hQk0Rb7t0SGRnpa81r4LCiEaGyLKStCPqzx2LzsLwkzofIN8
	 t+I4csPxPQXhg==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
	<87wmolsrcc.fsf@kernel.org>
	<eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
	<87o79sfjlf.fsf@kernel.org>
	<483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
Date: Mon, 29 Apr 2024 19:32:28 +0300
In-Reply-To: <483bc3022513fd0740b5342b59ce94ad@ericswpark.com> (Eric Park's
	message of "Mon, 29 Apr 2024 15:26:28 +0200")
Message-ID: <87bk5sqgdf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_093234_236001_45157AE7 
X-CRM114-Status: GOOD (  24.39  )
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

Eric Park <me@ericswpark.com> writes:

> On 2024-04-29 14:18, Kalle Valo wrote:
>> If you run wpa_supplicant -dddt (or similar) you get a lot of debug
>> output, I'm sure it will also include the cipher.
>
> Good to know, thank you. Will keep this in mind the next time I'm
> troubleshooting WPA-levels.
>
>> Very good that you found this is 802.11w related. What is the make and
>> model of your router?
>
> I'm using a GL-AXT1800 (Slate AX) router from GL.iNet.
>
>> I don't know how well ath10k 802.11w support is tested and then it was
>> last tested. Do you happen to have other Access Points supporting
>> 802.11w? That might help to pinpoint if 802.11w is completely broken in
>> ath10k or if this is an interoperability issue with ath10k and your AP.
>
> I unfortunately do not have access to any other routers I can modify
> settings on at the moment (or any other APs to connect to, to test on,
> really...) I may have some routers to test it on next week, but I'm
> unsure whether they allow me to modify the 802.11w settings as they're
> mostly proprietary and don't run something like OpenWRT.
>
> Do you know if it'll be possible to add a flag to enable/disable 802.11w
> on ath10k's side? Even if it turns out to be an interoperability issue,
> it will most likely be useful to have the ability to switch it off for
> APs that don't play nice. Especially for public APs and proprietary
> APs where the end-user can't realistically turn off 802.11w for the
> entire network.

If the problem is on ath10k side I would rather semove support for
802.11w altogether (until it's fixed). It's controlled with this flag:

	ieee80211_hw_set(ar->hw, MFP_CAPABLE);

Alternatively if it works on some hardware and not on others we could
make it per hw, for example disabled on QCA6174 and enabled on all
others.

But I found some old documentation claiming that 802.11w can be disabled
from Network Manager, if it works that sounds like a good temporary
solution:

"pmf int32 0 Indicates whether Protected Management Frames (802.11w)
must be enabled for the connection."

https://developer-old.gnome.org/NetworkManager/stable/settings-802-11-wireless-security.html

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFCAC3DA7F
	for <ath10k@archiver.kernel.org>; Wed, 31 Jul 2024 18:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ60FMBpQIvI/iz1ZX4y4tp4DOClkduLx8DxPQBDf7w=; b=2VgMf9XkCxCK0PthkXpKNJlBIv
	1f1xKhM6nWPskqsBaJBiiG45X5QO3J8Ca9ULOFO5/GfLFJsFAm3TET4EHMeKhmMWqnRb2a+6VnDKH
	DO6QDLiI4tm4uIXz/gZdvdBr0MBSj7augGR+OEN4a19a9liKOspfzoL52Rg2R+8bKxnm5LGTWvUh+
	iwNwyvrvEk1tkGke9MW1KzGC3mqBTAj9vJqW9nd7ymh20SbqCj9YbJ3EhtAdOh4FmuX7uSd0+vs+a
	cVbnYPXMb2y26nqIgPC/CRl4/Zf7thCLREc0Wl0kpTXwnZElsix8IMRQWMS8itWNz5jVCEQ+mOGeO
	ibyjVlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDpM-000000026An-2LaK;
	Wed, 31 Jul 2024 18:13:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZDpJ-0000000269b-10CA
	for ath10k@lists.infradead.org;
	Wed, 31 Jul 2024 18:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 93B0ECE0AB3;
	Wed, 31 Jul 2024 18:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD1AC116B1;
	Wed, 31 Jul 2024 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722449606;
	bh=/mWtXWuhFymOY0cwkGyAdgtXGxbMeCBxXQjOP6ErTbw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EUBeAoJs3VI+ln9p7cspWwUEnZrumGooIoqDJ7rFwmrW7HBctaSpirQ2RRowt1DVy
	 SOi+ZyRUr/w02MF03t12H5gSS9hVKnCTbCilhBwLjXBZRkkWqH1na4ahenbe9Xr/Qa
	 D/Vo9QrFXEl9HvYLxUlXpq1E3G1XpiXnD4u5kE8gMpfOinqai2bNZjnX08xMPbhh0d
	 yobVRIZdv0fD/n1ErAU1caskQM3X9CVL7DRyPF5QPSFBJieOEjVrPWi/yHkUbOnhSF
	 Tm24MIXNJjfXnW4+cXw2xBM1ojOTsoqYDMJHZD9wH+S898eWnf9HI92jDRmdpkBeDq
	 zogY+YfHwBAaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Cedric Veilleux <veilleux.cedric@gmail.com>,
  linux-wireless@vger.kernel.org,
    ath10k@lists.infradead.org
Subject: Re: [REGRESSION] ath10k: failed to flush transmit queue
References: <CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com>
	<1df0c5cc-ce58-450e-9f91-7f8f599cb11d@nbd.name>
Date: Wed, 31 Jul 2024 21:13:23 +0300
In-Reply-To: <1df0c5cc-ce58-450e-9f91-7f8f599cb11d@nbd.name> (Felix Fietkau's
	message of "Fri, 12 Jul 2024 10:08:10 +0200")
Message-ID: <87le1hjupo.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_111329_475663_7F87F30C 
X-CRM114-Status: GOOD (  14.53  )
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

Felix Fietkau <nbd@nbd.name> writes:

> On 12.07.24 04:23, Cedric Veilleux wrote:
>
>> AP mode.
>> Both 2.4 and 5ghz channels.
>> Using WLE600VX (QCA986x/988x), we are seeing the following errors in
>> kernel logs:
>> [12978.022077] ath10k_pci 0000:04:00.0: failed to flush transmit
>> queue
>> (skip 0 ar-state 1): 0
>> [13343.069189] ath10k_pci 0000:04:00.0: failed to flush transmit queue
>> (skip 0 ar-state 1): 0
>> They are somewhat random but frequent. Can happen once a day or many
>> times per hour.
>> They are associated with 3-4 seconds of radio silence. Full packet
>> loss. Then everything resumes normally, STA are still associated and
>> traffic resumes.
>> I have tested with major kernel versions:
>> 6.1.97: stable (tested for many days on 10+ access points)
>> 6.2.16: stable (tested for few hours single machine)
>> 6.3.13: stable (tested for few hours single machine)
>> 6.4.16: unstable  (we have errors within an hour)
>> 6.5.13: unstable  (we have errors within an hour)
>> 6.6.39: unstable  (we have errors within an hour)
>> 6.7.12: unstable  (we have errors within an hour)
>> 6.8.10: unstable  (we have errors within an hour)
>> 6.9.7: unstable  (we have errors within an hour)
>>  From these tests I believe something changed in 6.4 series causing
>> instabilities and the dreaded "failed to flush transmit queue" error.
>> This is a custom linux distribution. Only change is the kernel. All
>> other packages are same versions. Everything rebuilt from source using
>> bitbake/yocto. Same linux-firmware files.
>
> I'm pretty sure it's caused by this commit:
>
> commit 0b75a1b1e42e07ae84e3a11d2368b418546e2bec
> Author: Johannes Berg <johannes.berg@intel.com>
> Date:   Fri Mar 31 16:59:16 2023 +0200
>
>     wifi: mac80211: flush queues on STA removal
>
> I guess somebody needs to look into making the queue flush on ath10k
> more reliable (or even better, implement a more lightweight .flush_sta
> op).
>
> I don't have time to do the work myself, but hopefully this
> information could help somebody else take care of it.

Adding ath10k list so that everyone see this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


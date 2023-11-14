Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C147C4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKOYtP8zhRHWYWLACNWfoXNba27ybxWIijriDsDV3g4=; b=kShB2IenJSpc/F
	nkzbIb2dBTYXAN8jGvCVGdTBHD7bIpeU/49FBuAZKCHcrteSotUOCS+shQsODia5qe2FpOyUV0LJm
	AvSBh9he6KOp2lymX6sGjnq2/M8ajrr1+iACVb/Vf+DD0UGkgYUz7zTOvHp7fPCiUQb8wivS3a2v4
	apcuXA+1BA1OYy85HDWcVRzeGge+x7vxNHTUyx0M/NDCntEo23LiYU8efpf5B3nAvk2le6wGdroqM
	lvSRL+3qEYfQe5Lp0Bzi6BA9C8rN/Le+MwfHKVQJCPwJohHqH38zZsBfb8TXyif/3MU1A2163LheP
	9qaBpL9dSeifUBBQ5qag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oee-00FNK7-0f;
	Tue, 14 Nov 2023 08:20:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2oec-00FNJd-00
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 08:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F6BD6117A;
	Tue, 14 Nov 2023 08:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37345C433C7;
	Tue, 14 Nov 2023 08:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699950013;
	bh=4N7GVjwSCjPbc2a2ptNOVzUWfFh28n3fXrbaDbzETxw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HyNQGQlMwK2poFbIMOD3ONv7+FrAy5XYxL/MdEfQa/ZxGjzAc1CjGOrZHHDtdER8I
	 dpjezoUbcEw1FjEIIj72QIgnAx1GmAdqVuYQy+FjEqMFZ02IEGpdejAXnQ1VwrFtPs
	 GZWe73tG1PfgDrmifm9XHqqeQbdJgkvVkj24pkcHEimueIMd2nrTV+Hk7fAIdOuvwl
	 45QSNPZ07r3/J9YN5ziUJyCaaRBCk+YMOKQP7arHsN9ByEfSg+MSuKLHh+g/ILOr+G
	 XLXLPTynPlVohfxpPGfsQOEjeJ+DXdhRr5nznKvypzVfzJqttzIn0O8VwI3gDfVoNX
	 2tH6NunlnSGQw==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath10k: add support to allow broadcast action
 from RX
References: <20231017165306.118779-1-prestwoj@gmail.com>
	<169989062657.3473659.188127753057713210.kvalo@kernel.org>
	<2033c16c-4d9a-4592-bb81-7a9ad7821576@gmail.com>
Date: Tue, 14 Nov 2023 10:20:10 +0200
In-Reply-To: <2033c16c-4d9a-4592-bb81-7a9ad7821576@gmail.com> (James
	Prestwood's message of "Mon, 13 Nov 2023 09:27:59 -0800")
Message-ID: <87wmuk926d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_002014_083826_31AE54AE 
X-CRM114-Status: GOOD (  18.02  )
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

James Prestwood <prestwoj@gmail.com> writes:

> On 11/13/23 7:50 AM, Kalle Valo wrote:
>> James Prestwood <prestwoj@gmail.com> wrote:
>> 
>>> Advertise support for multicast frame registration and update the RX
>>> filter with FIF_MCAST_ACTION to allow broadcast action frames to be
>>> received. Broadcast action frames are needed for the Device
>>> Provisioning Protocol (DPP) for Presence and PKEX Exchange requests.
>>>
>>> Signed-off-by: James Prestwood <prestwoj@gmail.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> On what hardware and firmware did you test with this? As there's so
>> many
>> different combinations in ath10k we use Tested-on tag to document that.
>> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag
>> As ath10k hardware and firmware can work very differently from each
>> other I'm
>> suspicious if this feature really work in all of them.
>
> I only tested on a QCA6174 (and I'll add Tested-on for that). This
> makes sense and maybe enabling unconditionally for all ath10k hardware
> is the wrong way to go about it.
>
> Since I don't have the ability to test every hardware combination
> hopefully someone from atheros can chime in.

Heh, Atheros is long gone. But your comment made me remember the good
old times and smile :)

> Is there some firmware/driver value that can be queried which tells me
> if broadcast RX is supported?

A good question for which I don't have an answer. Does anyone else know?

Do you have a simple test case for this? It would help if people could
test this feature on their ath10k devices and send us results.

> Or if not is checking ar->hw_rev == ATH10K_HW_QCA6174 good enough? 

BTW instead of checking ar->hw_rev our preference is to add a new
boolean to struct ath10k_hw_params. That way it's easier to enable and
disable the feature per hardware version.

> Or are there sub-variants that may or may not support this?

There are several QCA6174 variants and you can check the variants from
ath10k_hw_params_list. For example, hw2.1 or SDIO firmware may very well
behave different from the PCI firmware. To be on the safe side I think it's
best to enable the feature only on the hardware versions we have
verified to work.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

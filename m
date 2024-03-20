Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D738C54E58
	for <ath10k@archiver.kernel.org>; Wed, 20 Mar 2024 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qblYvL+8Q1RrDqel0i7CO0djad3/mdPRjr4pcjYAvGs=; b=zzvqIDgLaQgDnUnQJshm9F1kue
	uVaDuLKzz2iVd84/+HrtZ+lKepk+o1CGdTi2vH21UJeB4JdwHZLu8kRnpm//JCkKNCcD1WI2aAV0b
	yvck6hBittOPjGMHWwNQM6DG5w5E/x7bppNiV3ey6if7vTEULpnjAaigsrTan3R2SwCb+OVwoN6j0
	cxRQK/Z411hKS0O2fPdfbhszKHVIMdiUL9LMRANBl0CJtzb+RbFMPKYln2kTIy8RZ5/wP4X3Buy1i
	GRO4hVAgYjmvKXuTpMZC1Azet7T0mNTIu4pFCNqpHWaiP1h4anr7OeuxBryQq3vxKoMQY3FRr2jct
	T8DToKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxpH-0000000043c-0k77;
	Wed, 20 Mar 2024 15:25:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxpE-0000000043D-3euk
	for ath10k@lists.infradead.org;
	Wed, 20 Mar 2024 15:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2A7D61027;
	Wed, 20 Mar 2024 15:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF0FC433C7;
	Wed, 20 Mar 2024 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710948355;
	bh=0UWHhH7UBptN7bELngpHg4QMteISn0vghq9W+vJ512A=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MIuESAPtRv5GCgirO/qyzmRLvHHXJCOrd8plPAqUfLX2iR/7j7XUgPTzp85BLcf2t
	 JUMAxHHID/F3grlo60zxh7IOHAutVwv2Bw77Nh3uF94JTl3HeBxVN5CXrHNqJkLEoZ
	 RZ2WsXwn6RnI53FjjkCIqecI8Wlj8s6/U0RxYanVFyy80rQlcARHCa7kGsGOfFZLfi
	 ayJKHO3W78VYlmjzB/4RZ0ZgSAPONOi6qYKHVHcX8TujvDzcyL861ms/7HGtAOBnrf
	 I+4BubwtX/3n36arXTF00LzJ4meYKBO5jMgH73O07HuFOPPdgBGCivkYaBRdy2rIGI
	 W++pT72selqRw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Breno Leitao <leitao@debian.org>,  Jeff Johnson <jjohnson@kernel.org>,
  <kuba@kernel.org>,  <keescook@chromium.org>,  "open list:NETWORKING
 DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>,  "open list:QUALCOMM
 ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>,  open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: allocate dummy net_device dynamically
References: <20240319104754.2535294-1-leitao@debian.org>
	<9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com>
Date: Wed, 20 Mar 2024 17:25:52 +0200
In-Reply-To: <9fcdb857-da62-4832-ae11-043fe993e4ad@quicinc.com> (Jeff
	Johnson's message of "Wed, 20 Mar 2024 08:12:46 -0700")
Message-ID: <87wmpwaprz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_082556_981407_66A0065B 
X-CRM114-Status: GOOD (  11.63  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/19/2024 3:47 AM, Breno Leitao wrote:
>> Embedding net_device into structures prohibits the usage of flexible
>> arrays in the net_device structure. For more details, see the discussion
>> at [1].
>> 
>> Un-embed the net_device from struct ath10k by converting it
>> into a pointer. Then use the leverage alloc_netdev() to allocate the
>> net_device object at ath10k_core_create(). The free of the device occurs
>> at ath10k_core_destroy().
>> 
>> [1] https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/
>> 
>> Signed-off-by: Breno Leitao <leitao@debian.org>
>
> NAK this based upon the ath11k patch results.
>
> As suggested there we should just use kmalloc/kfree to match the existing logic.

BTW if the patch is not tested on a real device then it's good to
document that in the commit message with "Compile tested only" or
similar.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


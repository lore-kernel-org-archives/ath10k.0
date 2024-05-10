Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2076BC25B10
	for <ath10k@archiver.kernel.org>; Fri, 10 May 2024 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW08TWDWJNMOnhrLaRKGIj1DjiWU+GwGvnTdxEio1Ac=; b=4m8sbyK4soC5krWYi8naBkJX9X
	MlpsUzjlBBSGWe/znzsLv+o/1Ikz58I4/YkAVK6As7yub/sEORqmtPuZJJ9wzCfOGfCSyRwfJH2Vv
	1TcdlMJd+v4fDOG4GZo9rJo1z9jnaO/gjO6jgX0XogZAY0Wr9CtqxfVACApR2A2GZrZyVJ+2yYdwV
	Ru+kX/DZlenbdOYxZUlP6eJ8MISLI5f77E41/G2kq8qBkSuBs8ZpiaVRAFL5wLCRvM8WSToD2Cagr
	WmAHZAXoH0w5a8F+SbDObFUNfkgtwcXaRGTVGHU0Oa8V5OIu63BinGQRJUj9F6qkSfn2UfuqKGfAu
	QHhFvgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Qfc-00000005SHq-0ddX;
	Fri, 10 May 2024 13:52:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5QfY-00000005SGh-27yf
	for ath10k@lists.infradead.org;
	Fri, 10 May 2024 13:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF0B461EFB;
	Fri, 10 May 2024 13:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0484C32781;
	Fri, 10 May 2024 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715349135;
	bh=P03mPsNFGR0/RNBmpmCMETYGOpewXcdJhDQnp92x98U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CdTIbV3p+4e9dZYYzb9p0raW2kJxdErUtvbB2gTyAlJgbePLaNavSF0S+hRtzQvJv
	 giA7CUdN2YZIOrk7XANyrFY5jsFCDzKxHXQZpHQGR1fp1Rod9/9XPQEuumQYSe1sZA
	 1nAY/DLONdV+kC3ws88a7/6D5wCLzwQzyIWzG36sWz3EQSt2g6X8RsArbllW9jORcJ
	 XJjrNAh5Hlv7JwWB+zX/POAWBGZglSTpJ0O8FqsYHc6ZBnHv6wY4owV2OOVdyv2zkx
	 bXo/67Gzzo878XtRdQDgTa/2OViokNXOj50RP4qPSvGeeXyzfBT1/JPujSSXHzU6ca
	 WZgiTxD7fU92Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  <linux-kernel@vger.kernel.org>,  <ath10k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <netdev@vger.kernel.org>,  Sebastian
 Gottschall <s.gottschall@dd-wrt.com>,  Steve deRosier
 <derosier@cal-sierra.com>,  Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
	<878rcjbaqs.fsf@kernel.org>
	<648cdebb.5d0a0220.be7f8.a096@mx.google.com>
	<648ded2a.df0a0220.b78de.4603@mx.google.com>
	<CA+_ehUzzVq_sVTgVCM+r=oLp=GNn-6nJRBG=bndJjrRDhCodaw@mail.gmail.com>
	<87v83nlhb3.fsf@kernel.org>
	<7585e7c3-8be6-45a6-96b3-ecb4b98b12d8@quicinc.com>
	<cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com>
Date: Fri, 10 May 2024 16:52:11 +0300
In-Reply-To: <cce2700c-e54f-4a50-b3f0-0b8a82b961a4@quicinc.com> (Jeff
	Johnson's message of "Thu, 9 May 2024 09:48:08 -0700")
Message-ID: <875xvllqpg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_065217_503099_1E999D70 
X-CRM114-Status: GOOD (  13.91  )
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

> On 5/9/2024 9:37 AM, Jeff Johnson wrote:
>> On 5/8/2024 9:50 PM, Kalle Valo wrote:
>>> Sorry for the delay but finally I looked at this again. I decided to
>>> just remove the fixme and otherwise it looks good for me. Please check
>>> my changes:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=688130a66ed49f20ca0ce02c3987f6a474f7c93a
>>>
>> 
>> I have a question about the copyrights in the two new files:
>> + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
>> 
>> My understanding is that Qualcomm's affiliation with Linux Foundation via Code
>> Aurora ended in December 2021, and hence any contributions in 2022-2023 should
>> be the copyright of Qualcomm Innovation Center, Inc.
>> 
>> 
>
> ok it seems like Kalle's v13 had:
>  + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>
> and Ansuel's v14 has:
>  + * Copyright (c) 2018-2023, The Linux Foundation. All rights reserved.
>
> So Ansuel, is your work on behalf of The Linux Foundation?

BTW in the pending branch I can change the copyright back to original so
no need to resend because of this. But I'll need guidance from Ansuel.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


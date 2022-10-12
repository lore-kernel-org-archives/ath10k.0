Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712D1C433FE
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ls5iiVoytzWmznf2FCi0jWR8+l5Gq4WJmuseI1gDM1s=; b=dGk8myeGpdVlPn
	uoHOexiPSAHgoXVJQnM9entAG/uEPdm26ZuNDBdnUi0ox/szHeaQCz83rix5UCHz14Y7jRyxYTmu7
	6YkOM/1ny9/rETl5//83sb991ZIBiZyfoikkjRQjHjZMtwrHb+a6ajsi6HOgxq8aLA7olKkrPBSb4
	3GVyZ0JStJiaeD7Vhrudyh3gqVkVXl/mg1KIzFEX955T+t0J24S0XqAK1kMf5ZJt/mYW0q7YRw4uq
	zmM/hv4eiB+FB1ktx1LZzSZSxqgXdInggpUxov/InxVI/pgxH8EH+2pb1A7lG95cVe1TTI16CTg7A
	23WMhzPF9Iie7cDGFR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidhF-008YRx-J3; Wed, 12 Oct 2022 15:31:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oidh9-008YPx-IF
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 15:30:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF4FD61475;
	Wed, 12 Oct 2022 15:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED87C433D6;
	Wed, 12 Oct 2022 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665588654;
	bh=XbTyHiZP7iedmm7OWxyWL6XwynJZBsCOZXG5smQEDEY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=h5VkM9g3xva3tcH4oVEQmiSC6yrFLJ6fc30XwacHHqWZNmEcAVOPKAoKaCxAy24Fw
	 kRqYXi9sD80EzZxNB8iDFt8iqFx3TSqAYKqN8/faBZNH3LLCq6y1lNIKZ3WxfnPTmY
	 neGfZbH03nibY1yUoQ3NfVWuFr9r9YPiS7dlGrHs1SwMTSGRo/5WBg/+BRgqaUwv7h
	 Yg5I79txZK6MXHEAq1MvodRBu/wlGsHOtte2WQ6MTC8mNm0Mg2BQfiB1airSknOQaY
	 FUq4jm0qYS2s9H/m6lMggAZOpP+GmDrXAtkRd2ulEP+TxxolnxSoJ5b+QbA1yfb3vg
	 f9CMJXJB6Enkg==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Youghandhar Chintala <quic_youghand@quicinc.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] wifi: ath10k: Delay the unmapping of the buffer
References: <20221012142733.32420-1-quic_youghand@quicinc.com>
	<1c64fe906b36438d63a7fc3fc9d0ab010b6db42f.camel@sipsolutions.net>
Date: Wed, 12 Oct 2022 18:30:48 +0300
In-Reply-To: <1c64fe906b36438d63a7fc3fc9d0ab010b6db42f.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 12 Oct 2022 16:49:03 +0200")
Message-ID: <87a661njo7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_083055_660419_E1CB7931 
X-CRM114-Status: GOOD (  11.12  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Wed, 2022-10-12 at 19:57 +0530, Youghandhar Chintala wrote:
>> 
>> @@ -418,6 +426,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>  		.dynamic_sar_support = false,
>>  		.hw_restart_disconnect = false,
>>  		.use_fw_tx_credits = true,
>> +		.delay_unmap_buffer = false,
>> 
>
> All the false are unnecessary and just distract from the content, imho.

In this case I actually prefer having explicitly set false (and zero),
it makes it easier to maintain the correct order and compare between
hardware values.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

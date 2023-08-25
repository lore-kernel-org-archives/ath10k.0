Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF89C3DA6F
	for <ath10k@archiver.kernel.org>; Fri, 25 Aug 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prWAM9oQyT3Js2+5/SixocHiqsCCXDOO2ly2tg7kdbg=; b=in+BUSF50EnMuX
	XVcB9tsxOOr3cq+QwLxnioHty+oEvMNRRvBCJgr830hxPGEWYg0aaHOPZAV22oA1wBugUVAEb4pzt
	lDy4VoRx/eOhv8E73TRz1az0cg0N+iIyszVY0XRbfhhKhTa4AgLTldTqDWfH4S12XrdEiyOwOhlOC
	Wy7maRQ7OXdnCdP2HDye7XIJltWBbypH4FR4Au41Lyafun+zpG5f42bZQ+N78jzGMSAOqRpfLolzk
	tKseBshMTDUuKmNcjj6AFoO+IlRTik5QNIP2crAiVS4BjdCCZjk1yQuIuPbECIZMEIUrmlrgAy8Rt
	iF8tT2j7MPcMO/F7nbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRXA-004ZHg-1V;
	Fri, 25 Aug 2023 07:47:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRX7-004ZHF-2h
	for ath10k@lists.infradead.org;
	Fri, 25 Aug 2023 07:47:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0580C63FE1;
	Fri, 25 Aug 2023 07:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D856EC433C7;
	Fri, 25 Aug 2023 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692949624;
	bh=vpWMNFFp37Wpc/BeG4cbX3GZ7yuXUNsmebR40KDAuQE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZGvUD6VGqiJ/BD7tjRLo1958ecnJZ7TskDnxXNTE6kaDO+3U64RtsJkJs1jACIAkN
	 x8CwsfPGtR3ZhtqORzfatpuFtzrtrJje6pkkmLP0jL3+D7jmfKsISDxmI6OLFRwoL4
	 /tDP1bzxIqJ40xRYTyzDYcsEfTZgY9eaoMsMbBrU3wJHmWBOzUfskHtRxsLUFdHKK9
	 UdurmTi2H4xenoyQOWYn/qoEgn9RXDIDhlq8Ck/KuKNX+UDyRFK+1cun30DzKEn9Eu
	 B5qevSkF1wLsYHKhQ2nm4/xzoCiQ6UzcjMpOOkazvFlxzN9mrKJ1D1p6JZL2h2kIKx
	 2ibaX6NcIvS7Q==
From: Kalle Valo <kvalo@kernel.org>
To: "Antipov, Dmitriy" <Dmitriy.Antipov@softline.com>
Cc: "khoroshilov@ispras.ru" <khoroshilov@ispras.ru>,  "dmantipov@yandex.ru"
 <dmantipov@yandex.ru>,  "quic_jjohnson@quicinc.com"
 <quic_jjohnson@quicinc.com>,  "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>,  "ath10k@lists.infradead.org"
 <ath10k@lists.infradead.org>,  "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>
Subject: Re: [lvc-project] [PATCH] [v2] wifi: ath10k: cleanup CE initialization
References: <20230823095008.50515-1-dmantipov@yandex.ru>
	<fb14be76-c3af-8ede-38aa-8b88f3cea7b7@ispras.ru>
	<0eed7a68c03555cc815959b9fa32b37657f8aeda.camel@softline.com>
Date: Fri, 25 Aug 2023 10:47:00 +0300
In-Reply-To: <0eed7a68c03555cc815959b9fa32b37657f8aeda.camel@softline.com>
	(Dmitriy Antipov's message of "Wed, 23 Aug 2023 10:13:01 +0000")
Message-ID: <877cpjh8cr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_004705_961821_D2E64730 
X-CRM114-Status: GOOD (  12.48  )
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

"Antipov, Dmitriy" <Dmitriy.Antipov@softline.com> writes:

> On Wed, 2023-08-23 at 13:03 +0300, Alexey Khoroshilov wrote:
>
>> > v2: adjust to match series
>> 
>> Do mean that nothing has been changed in the patch regarding the
>> previous version?
>
> Usually it is, including the cases where some patch of the series
> is changed so the following ones are applied with offsets and thus
> better to be regenerated.

Saying something like "no changes" or "rebased only" would be more
understandable. It is assumed that when sending a new version of the
patchset that offsets can change so saying "no changes" is good enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

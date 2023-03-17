Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51353C74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWsqJndWSzkFfBWBMMV2w23D1nkhIk7B1CWVUPR38cw=; b=DYWI2QkF43Bw5j
	kv+pWM15wryxQsniXrwfOvyI3S2WDbM8yVvKoBNHY4Cdmtq2hCjrA4oPC+2NdrhjGpTMhZuDyO6vH
	22s5MeGDsa5AUQzovRc9x1Xi71tXNbGazyudhL+bb9wwWhHnIq3hy1ZWiYmh0Z5MSE6gvxWSg0srM
	0hZpJapOAN4uECEAiIBAkGadnz7P/LNjF8nYPmrJ0IcJw1hWOpwNFmZ9R6HFpTYcF98u5EJ8WB6Xu
	N7wmD+XNftU86AxfhWxUd6cV4XTFnURW568S4ThlAi3/96RkWjKTTkekVV5KzMYI2Lq1Oga5wTr8D
	4HmTaPsE/XDbCGOs5kqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8NZ-0024lw-1G;
	Fri, 17 Mar 2023 11:36:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8NW-0024lG-2m
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 70C37B82586;
	Fri, 17 Mar 2023 11:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEC6C433EF;
	Fri, 17 Mar 2023 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679052968;
	bh=gwIhvyrdH9CodX7RW4zAhiZ/+gVLqeaBsA/69oxOyeA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RzmTQnfpiWDGyKzmlge/EqUCe6Vmr7tdWphBdZRilewFBC8ZEcwYUtgC75VN6y15L
	 H0YKeV/zbB1PhL28enPSm4mT/CZ31WbpYaMPlIgQ2MM3UVK0wrib22L6nsU53TcIQ4
	 WiwH7p9T85o54iWDw+iIXxLhKeMqF3MkBdRKH2wjFXr3EZe7mDlwPle3SX0VjvmIAy
	 DC/BOyhvIy6sXI/pzXv52pyRjgNg37/nOAmGWCycsEg2k1m8eWk6PL+SkCFVElshwU
	 abQD4m60aijgE0F/RYtB3zX//CsVDPMtXiyNhrLBn5iWLusyhpPelyxAMKVhTtLsYR
	 Us8JkWhmX3ADA==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org,  gowhdok@mailfence.com
Subject: Re: [V2] ath10k-firmware: QCA4019 hw1.0: Add P&W R619AC specific BDFs
References: <2d06065e-a7c9-bd6d-cc95-52e350fd413a@gmail.com>
Date: Fri, 17 Mar 2023 13:36:03 +0200
In-Reply-To: <2d06065e-a7c9-bd6d-cc95-52e350fd413a@gmail.com> (Christian
	Lamparter's message of "Fri, 1 Jul 2022 13:25:38 +0200")
Message-ID: <87fsa3lie4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043611_045568_091496FF 
X-CRM114-Status: GOOD (  10.78  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> From: Tim Davis <gowhdok@mailfence.com>
>
> Hello,
> This is the board files for P&W R619ac, a dual-band wireless router with an IPQ4019 inside.
>
> The boardfiles are extracted from the stock firmware:
> /lib/firmware/IPQ4019/hw.1/boarddata_0.bin
> /lib/firmware/IPQ4019/hw.1/boarddata_1.bin
>
> The MD5 hashes are consistent with the ones included in the pull request.
>
> ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>    - QCA4019 hw1.0
> 	BoardNames[0]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=P&W-R619AC'
> 	BoardMD5[0]: 05f6d61550d5ba8a0626fb7fa63703fe
>
> 	BoardNames[1]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=P&W-R619AC'
> 	BoardMD5[1]: 9265da348a1294c326cd0156fd92d0b5
>
> Boardfiles are attached with the appropriate names.

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=P&W-R619AC
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=P&W-R619AC

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 116 in total

https://github.com/kvalo/ath10k-firmware/commit/3f8e37846c88ec6173c912ef878732e26663d36a

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9728AC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8fFcNRZG0OLpipt1OheYjVyogu1IGvFqFrRg+vZG7c=; b=DRHGbkvUG59CqS
	kPaPrQXzBKHTPdEnSF6FwvyRrFgqhPMZNp+WOCW4d6O8rAfETzeyvlIbkhqo+3tS49/0UtV7WoO86
	60DVWNqk+lm7e/t+0fzWOKVnStMP4+aCooYR1tdP6+9/IFm1hzILXksMqvjQV17/En3ahmWLEC/rR
	oX3wWoXxBybMFQyGa/I2cIarn2TzW2ODme41cBGjVtgjOCMNzIKmmhmh8b2lSfpd6qNSV9TcvTL/7
	PhdNAUJcEZHIYYX47mIVeU8Hde9IVK3CqQBvyOaKPEWO+Q/KRtZZfOgQ+DmGc52RHdk/5IqPnglDr
	IqCEiEjq8RvIkpiC3CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuOv-00FFKE-8H; Fri, 21 Jan 2022 13:56:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuOr-00FFJ1-Ec
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:56:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F34A0616F9;
 Fri, 21 Jan 2022 13:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA62C340E1;
 Fri, 21 Jan 2022 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773380;
 bh=kfpQpUeYYfg+UxJc2vHsEc2DtQBFlX7uiNPVz/7kOGI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=CJuPzO6lsXnN3oBjkFrJWT56jqxxqUsJUU0SfvpuZCxBd+VKYvqfVZcIdB+nH0gGr
 vZp2j2xfHZuky7Ozv9jJRdJqkIOzK26VC7uE0L8Mw7ctgWrLT+hza99Snhzwdhu+Mg
 v7m3rGdOEyNbjn6VJzmYbmJv8EwA/aUfB7CYilzzN38BEe1ewm8KxLqhGdED+53Nd0
 nU3c4DmWxvV80NWp1RhEXYSP8ttlCuRuVRBOe9Ld/ooOOAmHDG73XbkmoxkLCfQ7E7
 gTLFtlGqhIybELK351gk4xkpNhaZNs7eN1QEWzTQ6WfoUhubl1ssPfuViyyx/r2oRQ
 HldUC7ZtjzYlQ==
From: Kalle Valo <kvalo@kernel.org>
To: <gowhdok@mailfence.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA4019 hw1.0: Add P&W R619AC specific BDFs
References: <1357387574.1374587.1636642784281@ichabod.co-bxl>
Date: Fri, 21 Jan 2022 15:56:17 +0200
In-Reply-To: <1357387574.1374587.1636642784281@ichabod.co-bxl> (gowhdok's
 message of "Thu, 11 Nov 2021 15:59:44 +0100 (CET)")
Message-ID: <87tudxb3b2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_055621_564076_54C7ED2E 
X-CRM114-Status: GOOD (  13.00  )
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

<gowhdok@mailfence.com> writes:

> Hello, 
>
> This is the board files for P&W R619ac, a dual-band wireless router with an IPQ4019 inside.
>
> Relevant pull request on OpenWrt: https://github.com/openwrt/openwrt/pull/3691
>
> The boardfiles are extracted from the stock firmware:
> /lib/firmware/IPQ4019/hw.1/boarddata_0.bin
> /lib/firmware/IPQ4019/hw.1/boarddata_1.bin
>
> The MD5 hashes are consistent with the ones included in the pull request.
>
> ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
>   - QCA4019 hw1.0
> 	BoardNames[0]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=P&W R619AC'
> 	BoardMD5[0]: 05f6d61550d5ba8a0626fb7fa63703fe
>
> 	BoardNames[1]: 'bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=P&W R619AC'
> 	BoardMD5[1]: 9265da348a1294c326cd0156fd92d0b5
>
> Boardfiles are attached with the appropriate names. You may substitute the & and space with something else saner if they prove to be problematic.

I see that variant has a space in it, does that work it correctly? My
original idea was that spaces would not be allowed, but didn't realise
to add a check for that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

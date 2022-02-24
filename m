Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2A6C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbgBoI5JdCKfzEG7GhzYuBzyx372ykQgetcn8xfElGc=; b=iSp+e8jTnfd+xP
	jPdqMsXu7Y6bILoetMi8HPs6hsMd+nHfMSodwUqDzRqUmKaWPGDIVphusZrjJra8yCdQr3P+chLWV
	bLDLah8EiMUaLNE6OToRL4NWdSBU+vIcxq/H0vaUBqBvH+HJEQmUQqXsOdoaNbYVKyOez98TRFTAx
	maBYJV9kn+e4n6FAg6MK948cIskIKg5b0M5XqKTCjWM70tlFQh2kU3yuL4UsmFXfC0M5Za6Iu9ejL
	xaMgxNqvJVUcf4+DSHhCfx4xXR4iKdKbfd3qePaSmoD4xRDsb8pEc3s9Xq136czDFS0CCnSwEOPHY
	0qiHG+mb2aEvnvpLd9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN8eD-00H8mK-Kz; Thu, 24 Feb 2022 07:34:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN8eA-00H8ke-Ry
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 07:34:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CC86615E1;
 Thu, 24 Feb 2022 07:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DF3C340E9;
 Thu, 24 Feb 2022 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645688076;
 bh=hCx4bfRDSPHmPlJNCzGAjut5sDcvgiG2vT3x1XsbKF4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=kc5MgOdbz3o5uijwKLzpywe317WhUh01lpH8gp41ErSC+ykSrqaM4u3o5wNi+OHVW
 V36mY7kZ3C2FRNJWXS+2YTUNOFTiL7gg4P8zBz906nRClh/qwniswXCRcVfNkz4PiO
 uTvy3pZB/IQpmi+huOiaPq+35gc8j+tSyKrHbkx4YMMv//oyiCe7SPjgo2m0wKIzpd
 nCq0mPhQwJdgbvLFD8+4mE+bPBfg9n+kXpsw4uAmwYZ1ZvJ/nXRA3HjtesRHbgyZdp
 TEPB5PvM7L6k3g+bJYxqQBCwnwuSi62KR87fExRzLfEvgL+glScd0rpq140kJ1shMn
 s2ovPgbuoDKGA==
From: Kalle Valo <kvalo@kernel.org>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>, rmanohar@qti.qualcomm.com,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] ath10k: fix pointer arithmetic error in trace call
References: <20220221122638.7971-1-franciman12@gmail.com>
 <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
 <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
Date: Thu, 24 Feb 2022 09:34:31 +0200
In-Reply-To: <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
 (Francesco Magliocca's message of "Wed, 23 Feb 2022 12:48:36 +0100")
Message-ID: <87o82wvhtk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_233442_999878_DAD05095 
X-CRM114-Status: GOOD (  10.09  )
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

Francesco Magliocca <franciman12@gmail.com> writes:

> Hi, I picked (void*) to be conformant with the other examples in htt_rx.c
> For example at line 1431:
>>    rxd = HTT_RX_BUF_TO_RX_DESC(hw,
>>                    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);
>
> But for me it is ok. Maybe we should fix all the occurrences of this kind.

Yeah, it would be good to fix the void pointer arithmetic in a separate
patch. I have planning to enable -Wpointer-arith in my ath10k-check and
ath11k-check scripts, so patches are very welcome.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

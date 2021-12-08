Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EDBC433EF
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Ktp9dyXuGFtZ0fF81+ODRPDL06mXF95DVVVXQ9JiTQ=; b=GTClcYV+0tzjQz
	4XEufyIzhEVqHWqSVSs++ihL/VF3vJNUGW5FoAuHYoU0eIeQ32ls3bFmER5W88iMRKdEj5/0v7KxN
	q1z4vJI7JFpFezyrF826p5TKNGCJ326kvfXhTKDv53ExwpjVol/ZinRtowRGbYoVkBLVfkoreD1yZ
	Z4WRHOo0MaumKi9iYzgNSNkXV166rsjmtpByfCOh5IR+vUfaMxxxUcBXq0EAdpU+VyfF+IXieS2Gd
	KRF5R2cPprFIrDiAABxfRMf0dudcr/GL0TdkoEkQWxlJ6iTGpTspv+xVoEOhq73RxscUPdy2tRnxJ
	OtemMPhaLGURQrWmpi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1musSb-00Bk7s-Lh; Wed, 08 Dec 2021 08:37:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1musSY-00Bk6B-J7
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 08:37:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5D867CE2048;
 Wed,  8 Dec 2021 08:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2C2C341C8;
 Wed,  8 Dec 2021 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638952666;
 bh=7x+7ugH2AjWqMoowMPRzNp8VW4hURUYt0U0WtBtaVmg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=aj2N5BELsn+R1GzrhfmU3EAgkKbfZ+0adFw0+ACM4nauUXuV0FDJZgiTcGLGJhfcl
 N6EmZJKb/XpvmpnFx/OXsa8zMQzAOLldauMRxYa1abOJdQs1rHK8fxdXgOIiuHjTA3
 pM5DBscqpENqYnG5605oMGH1rJA8Jr41d8Vfq62Ms/5e4yfKaYWG83M+VEiTxH7+5g
 3ygPCC6EaJQrv2qGUysqP0bkDNDXrQkT6y6HH/sYp+mjhpubs/yBXLCmjXvjMp8UEh
 b12kZhjTtefAA7HgxcyW5zONy5bng8Ibhysr16n8xLV1ilVvXc3gdtn6SnxDuxXo7q
 f8Ih3QJtc4adg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath: regdom: extend South Korea regulatory domain support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20210915185611.6195-1-ebmajor.dev@gmail.com>
References: <20210915185611.6195-1-ebmajor.dev@gmail.com>
To: Peter Oh <ebmajor.dev@gmail.com>
Cc: ath10k@lists.infradead.org, kvalo@qca.qualcomm.com,
 Peter Oh <ebmajor.dev@gmail.com>, linux-wireless@vger.kernel.org,
 andreas.tepe@debitel.net
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163895266361.29041.5797831485020437683.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 08:37:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_003754_861010_9A11DED0 
X-CRM114-Status: UNSURE (   6.60  )
X-CRM114-Notice: Please train this message.
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

Peter Oh <ebmajor.dev@gmail.com> wrote:

> South Korea manufacturer, Samsung, has extended South Korea
> regulatory domain pair with 0x5F and has used it for their
> devices such as Samsung Galaxy book. Hence add support
> 0x5F as a regulatory domain pair along with extended country
> code, 413.
> 
> Signed-off-by: Peter Oh <ebmajor.dev@gmail.com>
> Signed-off-by: Andreas Tepe <andreas.tepe@debitel.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

dec05cdf78af ath: regdom: extend South Korea regulatory domain support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210915185611.6195-1-ebmajor.dev@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

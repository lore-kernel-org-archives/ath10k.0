Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5464BC433EF
	for <ath10k@archiver.kernel.org>; Wed, 24 Nov 2021 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4KOcn9+D4t5Iee/QyBFvwOXWIqbZLLV0yWt8/Z4sWs=; b=aC0P+GZyJGvKCHcYp5nKXh5J47
	6yd/+vehPdVZk8XQSuikvpE8vPGkUw4SDoxhaSROxuwxRM7Gy8uKjz6LALUpxwkTgSaVzNCOncG7F
	m4lqoJnAWih4iw+4u/GXYdxU95PGWhHYT+s25WcqtxNG5DmxukWpzyxpCUpyXndEvjeJWIeD3iT6G
	02JbBYd92Yqjd6Uo8mS0eu/8fT4UhPJHEli5NuE08oHNlc6XQRnAchWlBsp3f6p9fk0UGNJ4p5EKX
	lkHYm7pLm/+vx7yEygDtNr27OCC1r3KjZGGMaf4Z3dI2Qiv/Je1s9jkHsw9Re88g/lTQBEggm+wW1
	OPuJcMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpriz-004lNn-Gd; Wed, 24 Nov 2021 12:50:09 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mprix-004lN2-0l
 for ath10k@lists.infradead.org; Wed, 24 Nov 2021 12:50:08 +0000
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9546582FA8;
 Wed, 24 Nov 2021 13:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637758205;
 bh=zbYWMVyBGaGWXHJvm/teZQMBCLTITZf7ywToqsz9XHQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=llm55hIdAPJDCRRqtFBfGRz8e9G6DsTg9u695E6ZCT7sL1U4ivKqu30WH2uL1uwS8
 j9VkjszKmEuAoNkflWWGvC0Niy2FWhUA4aoNnfCZXInI0eb5fQH57O8Uc/V02gMfFx
 EfJX+cdu3JoCmZTG18lfgApQ+6qzye49Woor5mKgX2VWpCqCkhxkUWpPQd8UCgoUKA
 jx/hH81xSxS/rEBM6PPFTbnAnjGMa+gn4Ohpla/GMeSpz90I9fLb2B9JLVuWZi7Ihe
 bdRanFmQv7slJ5VtDd+zg1c/liAw6XOVtZ4MLYbeA9mjgAFrjJxh7NyS0mfx2u10Ps
 foxNws4sAPM2g==
MIME-Version: 1.0
Date: Wed, 24 Nov 2021 09:50:05 -0300
From: Fabio Estevam <festevam@denx.de>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Wen Gong <quic_wgong@quicinc.com>, Fabio Estevam <festevam@gmail.com>,
 ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>,
 erik.stromdahl@gmail.com, alagusankar@silex-india.com,
 kvalo=codeaurora.org@mg.codeaurora.org
Subject: Re: [PATCH] ath10k: Clean the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE flag
In-Reply-To: <87a6hu6ksf.fsf@codeaurora.org>
References: <20210915160422.2839595-1-festevam@denx.de>
 <CAOMZO5AYUxJg4bWudT3L1P=qNR2UBcNR1zmjCf5O9_ExyPw4ww@mail.gmail.com>
 <CAOMZO5AJ8q06YTHP=p84nJnKOYU+=MKVqJ3qz3XnUGcAg0xo=g@mail.gmail.com>
 <87ilwi6lo4.fsf@codeaurora.org>
 <5dc61605-2ada-3c0b-64de-ea16ad31efbc@quicinc.com>
 <87a6hu6ksf.fsf@codeaurora.org>
Message-ID: <12399c734dbe4867d1ea4569a192ecb6@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_045007_257350_B3FEDBB4 
X-CRM114-Status: GOOD (  10.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle and Wen,

On 24/11/2021 05:05, Kalle Valo wrote:

> Thanks, I was worried it's something like this. One way to solve this
> would be to add a new field to ath10k_hw_params so that the workaround
> is done only on QCA9377 SDIO.

Thanks for the feedback, appreciate it.

I have done as suggested in v2.

Thanks a lot,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

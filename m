Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944AC433F5
	for <ath10k@archiver.kernel.org>; Wed, 22 Dec 2021 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSyvDBviGYDKA/pEgZpDCgeOsmnx75Vo/V2JVYlYwAQ=; b=11DPybIhYRwD0o
	64x/It8InaorAmAr/OS4Fy869j9ziE/b64pnOWRiZ3vVHzUYM1/Kkn50R9GagZ2XGookYcgtQ4B6C
	qaXKRIsadzF/4xqmlGz6rjvEnYePxEEzg3AqOA/sMOYnMkApAltdDcjEYOP/9sQnNh8vbnRbi5/QI
	k6Nwp1hoKYkhrR1XDTrVtYHfsGYT0KUFI5hS8EGZ4svj7OEP/wr7Vez+1LblXdvINyRFy2s/23RuX
	vGdxSnwxTRac4MAFIv96o4C2AjPZFLajiAtGVvJ5M5Nl5zSUEA2tR0fFKeYTbFRCe6b78U4t/C3ij
	T/RAT0NK1K6IdePVt3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzvLH-009MRl-67; Wed, 22 Dec 2021 06:43:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzvLE-009MRP-0O
 for ath10k@lists.infradead.org; Wed, 22 Dec 2021 06:43:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9E90DB81B0A;
 Wed, 22 Dec 2021 06:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30216C36AE5;
 Wed, 22 Dec 2021 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640155389;
 bh=Z6mkk7Vo2fTpBswx9tgs/mZsMrVgsubgbLVn+u4gtlI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=czGnMuR2/N2xlzLIFHtEwYHnrBaJVld0jWlpQREg5k74T6THJ/pKHTFVeq59WR56J
 m7ehoCep0HjfeCbBs4DKi7Hkmk4QfNHo27SoSRtGozsoTRtF3mkgf2sPATnmpM+ZPr
 hE/oacS8517AaB1dW8jWcDYhRXUX8JG+eQAmGS9LcQQ4vfeD/d0GwxABORKy6WMUSH
 I8AfJ7zLwc8QbvDToC4Ptic7/WdPFcvLu/2d0Dm41kCKUPngWPiCl0zDugrHXlcBzm
 zIzr3nop6iGQQDMIsvfHShdNu8J8FmephObZ3ftUIe5xo+E+/OgLbTqixxQImLV5O/
 LmCh5781R9Fxg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: briannorris@chromium.org, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, dianders@chromium.org, pillair@codeaurora.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
 <CACTWRwtn+xwVfdFC_1ZAEGC41+gqjDNpTk46vctejnF74Pf+AQ@mail.gmail.com>
Date: Wed, 22 Dec 2021 08:43:04 +0200
In-Reply-To: <CACTWRwtn+xwVfdFC_1ZAEGC41+gqjDNpTk46vctejnF74Pf+AQ@mail.gmail.com>
 (Abhishek Kumar's message of "Tue, 14 Dec 2021 14:48:13 -0800")
Message-ID: <87k0fx2l8n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_224312_215294_C2DCEB88 
X-CRM114-Status: GOOD (  12.46  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

> This patch is to trigger a discussion on the best approach to enable
> threaded NAPI on ath10k. Threaded NAPI feature was added in (net:
> extract napi poll functionality to __napi_poll() commit
> 898f8015ffe74118e7b461827451f2cc6e51035b) and showed good results on
> ath10k snoc based solution.
>
> If we come to a consensus with this as the best approach to enable
> threaded NAPI on ath10k, then we can moved ahead with the
> implementation and enable across sdio and pci, or if there is any
> objection then we can discuss it here.

Few tips:

It's a good idea to mark patches like this with "[PATCH RFC]":

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#use_rfc_or_rft_for_patches_not_ready

And you can add a text like the above after the "---" line in the patch
itself.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

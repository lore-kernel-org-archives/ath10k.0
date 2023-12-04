Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5D5C10DC1
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=221zh4IOLtkIXU38ct1GP4E7eL9GzsVg+38qi2nKCKs=; b=KOQAcYJRnqdNhco8PeD8UiXoFq
	2A1WEspj9YpfXjPro0yXzeeg5NzFT/3OZQ22DmRCSISTPtugbhaS2SOUNAGnt0HFodf7AJzi6TtHf
	V671K02PJDoSrf+1d5YIliu48R9yq6SvpvzxK1g1PADDw+caTNOvpNjjTklkXhjY/LFJRgal9XsJg
	zLafPo3FoeuwhMfOHj+ewidbJu9Yd+JGVc6tpU7/RW7aSZb/b1jkTJZaidIQMMnpDjDF4Tc1wR4pt
	rfQ7mnsWWti9QKitA+XQCG+1gmrBi/JhbcLlRevA8U2ZeXH8/UTvBx4AqhRx8K7KpWN7yM7kWfbv2
	hCPYMOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAP9-004sd7-1q;
	Mon, 04 Dec 2023 14:58:39 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAAP6-004sa9-1f
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 14:58:37 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-db3fa47c2f7so2898338276.0
        for <ath10k@lists.infradead.org>; Mon, 04 Dec 2023 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701701912; x=1702306712; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=221zh4IOLtkIXU38ct1GP4E7eL9GzsVg+38qi2nKCKs=;
        b=uyIDzPzTro6/5328eoVVGsvAguuHTLMZ01uMaq7GbId3nvlQMwu+1YXUD142rhZ1NT
         GKHhOvd3u1lNAbciTke0s9NfD3wUl5jkccilWMs6H+BuzhAxzR0ud23in3/CDYCSKZxf
         6xe/0LaKTIcRuR/1XU3SRMr7XwtTRl1AHoWBVGs3Gwi52FTfX6sYfKEu9c8jtnS6NQBQ
         VShwuEMIxoCY0uYSZx/83Czh8oFyHcbkGGpvR8zh5b88R8BdIR1NxPnqiP25hOzco1M+
         UdnCV+iA3BbcJxJUYLjQM7PeiS0xQvhCWYmqJlrDlP7RkzIjhAPQpLrIbwtwcOjesECX
         Uv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701912; x=1702306712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=221zh4IOLtkIXU38ct1GP4E7eL9GzsVg+38qi2nKCKs=;
        b=dp/eclxyIPgmFT8TF1jLjZBVvQ1WlPV3L8cs27E67KTAjDnTUIIh485kcErmzJ0ZBG
         h7hudHUJchLXDqS7qg6Var7ww/ru2xvijI7uLJ50C4BfB31/OPTlOY+N1EMm415usgbv
         z9OAFr9PJ0kUbx5VPGoyqQNimNWCDkG/8OPNM6xzY5QXK2SCFwLkt0CbwxHP3OXAOB9Q
         RTlTGxHMN3M8ixEeo8AM5WIaPu5Ggd8Z5Jape2kWhGs/rv68t93wY2KR2OFoNLti01Qq
         hQm716jVaeWKCWNPphv2TgPW/pSgJj68QS5sNj3qWhIHnQ4pm8nRNeeRsw3g5U9Raw3e
         BsOg==
X-Gm-Message-State: AOJu0YygF+CAlSMMEVTPihyAIjfQYx5uJRFTDovv54gXr1FrTfisb3u4
	pN1RgMceXK/imTkuEWeiOGzbafaz29CUHMaaNHzM0AFEdbsKWrZx
X-Google-Smtp-Source: AGHT+IH4pbMW5+H7L0bf3+QpoTYGCUhqdgrnb3nLU5HZJk1aedsfv/CfUppqPIHXfBi8A2rgtlyOIkvxiRCgCHczTFQ=
X-Received: by 2002:a25:2383:0:b0:db7:dad0:60c2 with SMTP id
 j125-20020a252383000000b00db7dad060c2mr2936215ybj.79.1701701912471; Mon, 04
 Dec 2023 06:58:32 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpp2XeATTauOZJeU92MHTGYj_CK_MTAb0A3uVTO_eGebjA@mail.gmail.com>
 <87h6kyqazk.fsf@kernel.org>
In-Reply-To: <87h6kyqazk.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 16:58:21 +0200
Message-ID: <CAA8EJpr9gLB=-DgT4gcRaGAOaGkMm8FMtFF0jTL7Y8r3jqms1w@mail.gmail.com>
Subject: Re: ath10k/ath11k board data
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_065836_586217_B18D7CBE 
X-CRM114-Status: UNSURE (   8.22  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon, 4 Dec 2023 at 16:49, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > I just wanted to check whether you have plans to update ath10k /
> > ath11k board data files. The last update was IIRC 9 months ago.
>
> It is very high on my todo list. I was supposed to start processing that
> already last week but it got delayed as usual :)

Thank you. Please excuse me for the noise then!

-- 
With best wishes
Dmitry


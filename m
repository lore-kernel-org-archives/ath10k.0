Return-Path: <SRS0=591D=LR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1BBC4743C
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9A9461075
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9A9461075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxXA+4EtnSaUKxcZ9rZGX2FQDTtC4yKJ4gp0LyQU14w=; b=eepxix8S2Gz40C
	VZrdRMQfTdxlKpKee/Dln6a+IAISoS+xmmqAGYILdrk2HkoIBuFfImNwRJICM1V3BJLInr8go7BRs
	BvQhO2pCzo1vr35zX5VrfzVtbVm3sOy/nm4E1GFfEINBzHmGAFkTRSTnglIEw4YgU1A/lK1uhlc7M
	FDTna1E+g4sCKzxMA/BSCPKqLVhUWaRif3jqNUAhzKLMT5XuvqfhPbxoj15zYZS/6gnlUThOeVfLa
	r20idjwMgHQL0VbZI7gqcnWGzsrmgtVkStp3l6jcaLpBBFTLvNMEV7TkhOy7LnWFwQVlSVJFZK2ES
	mnUCQPS1igQdJrjLI34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw8W5-00Bmcx-8i; Wed, 23 Jun 2021 19:26:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw8W2-00BmcV-Dy
 for ath10k@lists.infradead.org; Wed, 23 Jun 2021 19:26:27 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u13so6017971lfk.2
 for <ath10k@lists.infradead.org>; Wed, 23 Jun 2021 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1mws8JTsPd9+atb1/JRjdmcWQnXTwDM12m7T79JCDYI=;
 b=QKbruPrK8+r9Z6CHz8ZcBN91/61A8PbpooA0sGui9NBKFgMuuMLoyIVLMKCtsLHdeO
 O3otQ5Z8TPQ3mNDvuIah4gK6NE2M8mDny2i0V4zqrPkmEBomA/Q7hJUhNY5LSAfNWeyk
 YCakA62FspbPtZEMfcp4uNba1bU/SgJV8zIImpK/P61wRhP8ktrcdMoNxNzCdNm4skYf
 +PJ5wjDyv90wNzAAJe1kLHVXvj+bfKbj94AoZT2J5y2wMi78x/Otyg3O+4MFiv6cdEAh
 wnlBsPoAqJq+QtplRzV921rSgv7G2ohU7KVABXL9i5kisZGcI4U0MgFg/v98SChDv3Ry
 axWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1mws8JTsPd9+atb1/JRjdmcWQnXTwDM12m7T79JCDYI=;
 b=QmWNe/W11vq3hzkL7nufRwSrYYDk5qcgTMSkZNDnkdQwEpRidpdJy5XNKccfBV750z
 NhdOmF0/eg7EL0HVKzoHBS7DGMbGO+SJBrho+jZw1AITR3Z+fHvMsTjISLEXNCralCaF
 1QNMu4a7tbWIZvcLEVUoRIdIL4L+FLKnB1D2bfNOA3EfknN8/WWDiRt87cqQ8V2iJZ4b
 hFVwTC/SRAOOlrb46oj4/PWq650Dcw63CnvvkKqBqemAUX8rKC/5J84+AraMeaYQT7+T
 fErip3vA0rtchnKsAZT/vwx9TUauEpiSHV/45W2NlQZenacJV6mwA3LzZhs3+NmepdHK
 6wgw==
X-Gm-Message-State: AOAM5337Q9RJQ9Jp75Q53O0y0qkfB2e4Wbt6ZV09cOT1er7iiBKJVHms
 A4j6lcWJqzX+cinEA5WzwQ8=
X-Google-Smtp-Source: ABdhPJx/y3z1NxEj0i19lW89L1QoDy9Hp6WsBpHJ7H8yUQyHKJpyoJlgX9mJBjXKMibgHc5AndiiIQ==
X-Received: by 2002:ac2:4c48:: with SMTP id o8mr876420lfk.332.1624476384620;
 Wed, 23 Jun 2021 12:26:24 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id p5sm50912ljn.109.2021.06.23.12.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:26:24 -0700 (PDT)
Date: Wed, 23 Jun 2021 22:26:20 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: kvalo@codeaurora.org, davem@davemloft.net, Yang Yingliang
 <yangyingliang@huawei.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] net: ath10: add missing ret initialization
Message-ID: <20210623222620.06b6335a@gmail.com>
In-Reply-To: <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
References: <20210623191426.13648-1-paskripkin@gmail.com>
 <a0805010-788a-5ff8-2e6e-34e7ded8c34b@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_122626_527566_119C71C8 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, 23 Jun 2021 21:23:27 +0200
Christian Lamparter <chunkeey@gmail.com> wrote:

> On 23/06/2021 21:14, Pavel Skripkin wrote:
> > In case of not supported chip the code jump
> > to the error handling path, but _ret_ will be set to 0.
> > Returning 0 from probe means, that ->probe() succeeded, but
> > it's not true when chip is not supported.
> > 
> > Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> I think this is already fixed by:
> 
> commit e2783e2f39ba99178dedfc1646d5cc0979d1bab3
> Author: Yang Yingliang <yangyingliang@huawei.com>
> Date:   Mon May 31 17:41:28 2021 +0300
> 
>      ath10k: add missing error return code in ath10k_pci_probe()
> 
> 

Ah, i didn't check linux-next tree, my bad :(

Thanks for pointing it out



With regards,
Pavel Skripkin

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954EC433EF
	for <ath10k@archiver.kernel.org>; Tue,  8 Mar 2022 18:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/9Ev+KQcsNZoHKNN0NhhdJX/6NZJ6XjNeS/ZXiOPfg=; b=URDT15eoG5zlxU
	sdGrCJyVmUVN6jSRq0jPXqJJWMzfkM+U+kQ9tJDAiIJb7lW86npINDe7W2fv/6loNHMRg426p2SYx
	oit0t2nB27BB2I7t+r8qRS8MsfdFJP7tp6BTmpPw2Qb1GPcNMySWCfJL4CcpClwxrjFngKkw9bP0L
	onGqvih8tjxZRiU+vfJHA8Hairp0O7FZksh1mIB+Pi6biyIl8f3zVg8RaGT4b5kwm6fl+In/wnxne
	S/LVGocKklqBJ/qu1G7RroGg6fJkCPEN6YNmBaROi9JrG7sIyp847A7SMY4Dw9z/ED3av9048EpTa
	o0BPI4xbhkAVzQTawYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nReL3-005kj4-Mb; Tue, 08 Mar 2022 18:13:37 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nReL1-005kiN-0m
 for ath10k@lists.infradead.org; Tue, 08 Mar 2022 18:13:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id e13so17821625plh.3
 for <ath10k@lists.infradead.org>; Tue, 08 Mar 2022 10:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qZoIySMENoA9ziiqo0hyYo14ox8nz/iNMlsEajYbI3I=;
 b=c0xmYOIdDm9vlz0qMUc/V0ZlfmoCH8U6Qj/f2i+6Bx2tNBVy0JjwHErobuvQb1eqzk
 yCVl56gnZqJcsYOUlZrA3V0/t1W9nuycz+/Cn9uA36GLmvMHaPHAIfclW4FnEZ8nxbKy
 cdpBBG1jY5qsliF5gb1aRSgE7HJ5WP2nl/AC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qZoIySMENoA9ziiqo0hyYo14ox8nz/iNMlsEajYbI3I=;
 b=FSxGiy0YI0YzJ8/Uju2P+jYq2PdohG/CGg9Mw4OenH7Y3r1AwCE8JWtAGxTrM5dmps
 VAjnNW0i/sfa7Fd57Q6Zh0z0ELwFy/N4wCxs05pRYclvktXnKo/YMB41y1FuIJXYbyXJ
 uFUSqko/kgayMl3a1ll29WK1z8AZAYS80R7yTFbJwviwB5fyXiphR6wJJYCuGfwAGZo+
 zH/LHpJ9nAR/wNJXnsvAgJTcBg7DIWa7WC32rD2arlpAJy4AgyFlLsBXad1G1ElVl6PI
 uzQRxiSJfeEIBiIQcfTR/hZiHFQM1eqR2C0Vpe9BJd0LlF6XP+WqDg9AQzzZfOzMH9hg
 MnjA==
X-Gm-Message-State: AOAM5327Ky53rLhXc/dEe4oH0W/IGvolEjXdUrxyUiUEjKp+tetHx8OU
 2tNGgXx5UOxMc1vaayAYVbsqXw==
X-Google-Smtp-Source: ABdhPJwilIhINV2C1yNo+ncdU78v1nV0cNUJh9IJkLlXw2PDwEPLXQQndLofRT6SMzd4daBG3RLotA==
X-Received: by 2002:a17:90b:4b0d:b0:1bc:4cdb:ebe3 with SMTP id
 lx13-20020a17090b4b0d00b001bc4cdbebe3mr6064371pjb.176.1646763213333; 
 Tue, 08 Mar 2022 10:13:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b3e3:a188:cbfc:3a0e])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a637f0f000000b00372e075b2efsm16003944pgd.30.2022.03.08.10.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:13:32 -0800 (PST)
Date: Tue, 8 Mar 2022 10:13:30 -0800
From: Brian Norris <briannorris@chromium.org>
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, pillair@codeaurora.org,
 dianders@chromium.org, kuabhs@chromium.org, mpubbise@codeaurora.org
Subject: Re: [PATCH v5 0/2] mac80211: Trigger disconnect for STA during
 target hardware restart
Message-ID: <Yiecyl7Dd6AXJhN+@google.com>
References: <20220308115325.5246-1-youghand@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308115325.5246-1-youghand@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_101335_098835_147D036D 
X-CRM114-Status: GOOD (  16.96  )
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

On Tue, Mar 08, 2022 at 05:23:23PM +0530, Youghandhar Chintala wrote:
> Currently in case of target hardware restart ,we just reconfig and
> re-enable the security keys and enable the network queues to start
> data traffic back from where it was interrupted.
> 
> Many ath10k wifi chipsets have sequence numbers for the data
> packets assigned by firmware and the mac sequence number will
> restart from zero after target hardware restart leading to mismatch
> in the sequence number expected by the remote peer vs the sequence
> number of the frame sent by the target firmware.
> 
> This mismatch in sequence number will cause out-of-order packets
> on the remote peer and all the frames sent by the device are dropped
> until we reach the sequence number which was sent before we restarted
> the target hardware
> 
> In order to fix this, we trigger a disconnect in case of hardware
> restart. After this there will be a fresh connection and thereby
> avoiding the dropping of frames by remote peer.
> 
> The right fix would be to pull the entire data path into the host
> which is not feasible or would need lots of complex/inefficient
> datapath changes.
> 
> ---
> Changes from v3:
> - Fixed commit text errors
> - Remove excess space in "hardware  restart"
> - Removed blank line between the function description and the arguments

For whatever it's worth, the series looks good to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

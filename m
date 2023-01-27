Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F1C38142
	for <ath10k@archiver.kernel.org>; Fri, 27 Jan 2023 22:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGPuq70m0AioPq/4RQCDGMuUh46QxRYw5a4B2/yRNbg=; b=0t4sYzXC/HIG3d
	giDdeYbSRg/AosoDV1pcFJLaV2no7iIrOkV6SC1iAH0R/v0EGYIxpp0mItzpnncYTjOoFxgIV8yDs
	PICWcnwcrmaVworOyIcaLI0UBmV7I9DikCXypYHrGxdwn42bHTIodX5/XGPq+0FsLbsuiW9rTWK+0
	eNu5SXpDAqH47q6iqSIygX7vz0ZR8sz7DufKVQ/8E9micTrMF1MHR+kIqjpqTHl9qUcR2StNGcEk8
	gpZZCN1g9ZfcvOkRAUEx44SueKpXYhvPn71r5TmfmZfHZSC3emuSu+vnTdkU4kwKsfgNGIVVien0d
	TbaRRI7yOiN6R8velOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWtk-00GewW-Gl; Fri, 27 Jan 2023 22:08:40 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWth-00GevS-Fo
	for ath10k@lists.infradead.org; Fri, 27 Jan 2023 22:08:39 +0000
Received: by mail-io1-xd36.google.com with SMTP id b4so821169ioj.0
        for <ath10k@lists.infradead.org>; Fri, 27 Jan 2023 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=al9oy3E79ODPhEjXEHhJKk/A8XmQzAwjko7z1WJnZkc=;
        b=NPwfv5aXAsscvOxtwXtO9484xYSoDmyOBMRHaq6lKLS61CV1IWSbgh14Mvd5VHqR4X
         bwh/qNckPyHJ3rRfcMqtRB0SQKEsB2IPGnJT/H4kwO7OemTtVM4iRqS2UZSsGlDbjn/Y
         nkENSjnV/+noRbM4zBn6bygihOczkHMzXE/os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=al9oy3E79ODPhEjXEHhJKk/A8XmQzAwjko7z1WJnZkc=;
        b=Xu8d/65HHXY2e4w1Zm4Usu/smhRvaffMzwVDKAiXGaWyNBiE0Rb9BumQiWHydisy0d
         gZ24Mfbc0SFMrik6+bhzJ1vXXPqkmSvTTasXcSg1lwacLl9FIRb/Q1ephNLw11qoLrMe
         W8malZnIvxBRaOi/hysH8XqQmXw0fVhQ5kDjHIat9h118EC4GbbI72Qoc+mrAczIl0sS
         aO25W81aFkPpRjjve3DmNvoh1+5nkXE4mm3kS31T+v9ju05yzt7W48ZEt/FqpzUPiPDm
         plmLNPGaZsQYr/+dXoHSzNzeSpR3HkBi0eiAj3AawfaZ8D4zeVlVwfl8DitLtF88W1fH
         BjMw==
X-Gm-Message-State: AO0yUKXcGH+OFJE7zzGOQ4I3+Y9oAoF4Wc3dn7SodDPb8MD2MCuv5mkS
	d/aGuqRW7D7D8SjB42Lm41blv51NB04S4O+Ho8nagw==
X-Google-Smtp-Source: AK7set/q2kaa+ypIxOjsL1soOvTsxLlm1mLlh4dFrILigvfOQioehJJTu0K8nJ8YHs49B/9ZVlPODT+AvZNEaOu5JHQ=
X-Received: by 2002:a05:6638:10d4:b0:3a9:6f3a:4b55 with SMTP id
 q20-20020a05663810d400b003a96f3a4b55mr805907jad.6.1674857315411; Fri, 27 Jan
 2023 14:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
 <56d4941a-ad35-37ca-48ca-5f1bf7a86d25@quicinc.com> <CACTWRwt7oQrCyHf=ZF6dW8TtRhOfa14XMZW39cYZWi4hhszcqg@mail.gmail.com>
 <87tu0wcb3l.fsf@kernel.org>
In-Reply-To: <87tu0wcb3l.fsf@kernel.org>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Fri, 27 Jan 2023 14:08:23 -0800
Message-ID: <CACTWRwvhRUFvdv06YkQEgnz1Zyig_FqCeJU06VypT0Lvzv5OXw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: enable threaded napi on WCN3990
To: Kalle Valo <kvalo@kernel.org>
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_140837_610758_856F075E 
X-CRM114-Status: GOOD (  21.03  )
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

Thanks for all the comments. I will call dev_set_threaded() directly
without HW params and rollout a v2 soon.

On Thu, Jan 12, 2023 at 2:15 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Abhishek Kumar <kuabhs@chromium.org> writes:
>
> >> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> >> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> >> > @@ -927,6 +927,9 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
> >> >
> >> >       bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
> >> >
> >> > +     if (ar->hw_params.enable_threaded_napi)
> >> > +             dev_set_threaded(&ar->napi_dev, true);
> >> > +
> >>
> >> Since this is done in the API specific to WCN3990, we do not need
> >> hw_param for this.
> >
> > Just so that I am clear, are you suggesting to enable this by default
> > in snoc.c, similar to what you did in
> >
> > https://lore.kernel.org/all/20220905071805.31625-2-quic_mpubbise@quicinc.com/
> >
> > If my understanding is correct and there is no objection, I can remove
> > hw_param and enable it by default on snoc.c . I used hw_param because,
> > as I see it, threaded NAPI can have some adverse effect on the cache
> > utilization and power.
>
> WCN3990 is the only device using SNOC bus so the hw_param is not needed.
> It's safe to call dev_set_threaded() in ath10k_snoc_hif_start()
> unconditionally as it only affects WCN3990.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

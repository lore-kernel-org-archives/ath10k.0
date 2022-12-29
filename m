Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26694C4332F
	for <ath10k@archiver.kernel.org>; Thu, 29 Dec 2022 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0APK1XO8acgwCEyG4aKVKuWf5RO9kkoaadYPX02H20=; b=36VU8cxfqA8fn5
	XelymXtUNo0YF8/5VYbd4BEPqvc+cdcfynmHofxeJNwjlwoGvymp/Pz0c0gQX8KzkKHscvDLLpKMD
	S7kx9ve8v3hc2WvmW2JwpUiKgzC6DfN0/VtcBOffi8FtD98nECHP/K1uJv+2pLSv/dBN6g03bITmz
	dgSBr2c0G9/GsauPWhq9Z2EmTYbc1hIIVQkl6UlCKQxVKztA73jJPOP8Ons3b5bOaGmK89kNnyaA+
	zugflBvhJNlpIVMTSE0n26kRidiDTPrLr1svIeNzol2qOvT4W4hz6otbuAkS4p6cJr0Bqb6ueoRQW
	HgdhjXSvze5WBK7icUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAgMr-009ZMX-DF; Thu, 29 Dec 2022 00:01:53 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAgMn-009ZJO-Pr
	for ath10k@lists.infradead.org; Thu, 29 Dec 2022 00:01:52 +0000
Received: by mail-io1-xd30.google.com with SMTP id e129so508464iof.3
        for <ath10k@lists.infradead.org>; Wed, 28 Dec 2022 16:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aSCl4VrRDtic4wbVqLsduJfQEHBf/GmAw6cZg1rPlfk=;
        b=OgHoTU5lLCaBSd9Lo4WB0oc7VYxKwSUFSfRaeVBEZ+3yXqG1xfrkcdMFi7hn1Uu7qF
         4z9Zh63T9AYWOhg4cBYNavlyR1nu4sprmAwGAtsIR/Mp/i9ZUN5/wMjwhjQ9s9xSLhUt
         G5ffj0yZtraSD0g3TBkIhVNkeQrilDBDw3lW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSCl4VrRDtic4wbVqLsduJfQEHBf/GmAw6cZg1rPlfk=;
        b=D51DVeb28hD+S+uP5BcJCe1NRfVx/dFgh3Y1Aw/aKxe/nsw9YelP+AFbHh+IV24YCY
         R1v7kX+F1Xlsj9qKYK3NVLo3CVxKj6kM3JmIymktppLwwr24DUP+5QcTy6RDwnKD/IYZ
         B3D63ZAw6kdr/XEH57XeF2sMW+w1dvKiDSYCgNU8EsahlFaSIg/FoMxNCC9vP6McNKrR
         WaoRy8aBhCo8klHVri2gry9PGR6vjSBOPrstXtET7EE+YQBAvn7jNE9bwY/BZdoEk22U
         8HJcCuHVIjwRtAbl9OqpjR8txLYy/giPgNyN6JhZvLyadWYa2rMqxqvrBkQlr/rXJbDV
         Qbrw==
X-Gm-Message-State: AFqh2koWuQ14x+Hu2UKxks6nr5jmTPif51Dy3R+EAsW362HPEza+FlsB
	FdojdkU8FAiZqYNieLbDp0wpovM1aOwuxMY2oFHCug==
X-Google-Smtp-Source: AMrXdXvdqpX3rGfPS4D6ZdMWIWtfuIXETCsZNb7O7AKN+w3BabEMpLDb+MUFiS0B8afGXCmkbRjSkEo2u/Zb13v/HHw=
X-Received: by 2002:a02:a696:0:b0:38a:5811:1174 with SMTP id
 j22-20020a02a696000000b0038a58111174mr2036475jam.85.1672272108317; Wed, 28
 Dec 2022 16:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
 <56d4941a-ad35-37ca-48ca-5f1bf7a86d25@quicinc.com>
In-Reply-To: <56d4941a-ad35-37ca-48ca-5f1bf7a86d25@quicinc.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Wed, 28 Dec 2022 16:01:38 -0800
Message-ID: <CACTWRwt7oQrCyHf=ZF6dW8TtRhOfa14XMZW39cYZWi4hhszcqg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: enable threaded napi on WCN3990
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: kvalo@kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_160149_980722_DA4F361A 
X-CRM114-Status: GOOD (  26.11  )
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

Apologies for the late reply. Please see my response inline.

On Tue, Dec 20, 2022 at 4:14 AM Manikanta Pubbisetty
<quic_mpubbise@quicinc.com> wrote:
>
> On 12/20/2022 1:25 PM, Abhishek Kumar wrote:
> > NAPI poll can be done in threaded context along with soft irq
> > context. Threaded context can be scheduled efficiently, thus
> > creating less of bottleneck during Rx processing. This patch is
> > to enable threaded NAPI on ath10k driver.
> >
> > Based on testing, it was observed that on WCN3990, the CPU0 reaches
> > 100% utilization when napi runs in softirq context. At the same
> > time the other CPUs are at low consumption percentage. This
> > does not allow device to reach its maximum throughput potential.
> > After enabling threaded napi, CPU load is balanced across all CPUs
> > and following improvments were observed:
> > - UDP_RX increase by ~22-25%
> > - TCP_RX increase by ~15%
> >
> > Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> > Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> > ---
> >
> >   drivers/net/wireless/ath/ath10k/core.c | 16 ++++++++++++++++
> >   drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
> >   drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
> >   3 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 5eb131ab916fd..ee4b6ba508c81 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -100,6 +100,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA988X_HW_2_0_VERSION,
> > @@ -140,6 +141,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9887_HW_1_0_VERSION,
> > @@ -181,6 +183,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA6174_HW_3_2_VERSION,
> > @@ -217,6 +220,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA6174_HW_2_1_VERSION,
> > @@ -257,6 +261,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA6174_HW_2_1_VERSION,
> > @@ -297,6 +302,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA6174_HW_3_0_VERSION,
> > @@ -337,6 +343,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA6174_HW_3_2_VERSION,
> > @@ -381,6 +388,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA99X0_HW_2_0_DEV_VERSION,
> > @@ -427,6 +435,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9984_HW_1_0_DEV_VERSION,
> > @@ -480,6 +489,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9888_HW_2_0_DEV_VERSION,
> > @@ -530,6 +540,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9377_HW_1_0_DEV_VERSION,
> > @@ -570,6 +581,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9377_HW_1_1_DEV_VERSION,
> > @@ -612,6 +624,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA9377_HW_1_1_DEV_VERSION,
> > @@ -645,6 +658,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = QCA4019_HW_1_0_DEV_VERSION,
> > @@ -692,6 +706,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = false,
> >               .use_fw_tx_credits = true,
> >               .delay_unmap_buffer = false,
> > +             .enable_threaded_napi = false,
> >       },
> >       {
> >               .id = WCN3990_HW_1_0_DEV_VERSION,
> > @@ -725,6 +740,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
> >               .hw_restart_disconnect = true,
> >               .use_fw_tx_credits = false,
> >               .delay_unmap_buffer = true,
> > +             .enable_threaded_napi = true,
> >       },
> >   };
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> > index 9643031a4427a..adf3076b96503 100644
> > --- a/drivers/net/wireless/ath/ath10k/hw.h
> > +++ b/drivers/net/wireless/ath/ath10k/hw.h
> > @@ -639,6 +639,8 @@ struct ath10k_hw_params {
> >       bool use_fw_tx_credits;
> >
> >       bool delay_unmap_buffer;
> > +
> > +     bool enable_threaded_napi;
> >   };
> >
> >   struct htt_resp;
> > diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> > index cfcb759a87dea..b94150fb6ef06 100644
> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> > @@ -927,6 +927,9 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
> >
> >       bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
> >
> > +     if (ar->hw_params.enable_threaded_napi)
> > +             dev_set_threaded(&ar->napi_dev, true);
> > +
>
> Since this is done in the API specific to WCN3990, we do not need
> hw_param for this.
Just so that I am clear, are you suggesting to enable this by default
in snoc.c, similar to what you did in
https://lore.kernel.org/all/20220905071805.31625-2-quic_mpubbise@quicinc.com/
. If my understanding is correct and there is no objection, I can
remove hw_param and enable it by default on snoc.c .
I used hw_param because, as I see it, threaded NAPI can have some
adverse effect on the cache utilization and power.

Thanks
Abhishek
>
> Thanks,
> Manikanta

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

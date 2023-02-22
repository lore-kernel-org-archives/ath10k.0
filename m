Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A256C61DA4
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 07:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgINZVwGYputJR2bldXkb5aITgK0uRz5TO35Y4fjThQ=; b=m6SaKcLoq/5bTB
	s/dlLtiLbe8/fmgURwHtP9niiWdEqQsOs/y+9q/CLaGcAOC4H3qW6RT5ZgdfDhsWVUuVUo5DSFjip
	W7ihRxuneJRtaaaWVToBkjssGNKcp2LMNdY52ALi7S3Se0JW9LVKcZmTwWA/GWhl7oojeHdjgaHjx
	kyQaTSQeL3qTQVMkP7ESIATmIAcjuvlHcS4pfdXPXGjP1LK5nxuaeZwg8Dk0nqktrOoNg3dnQN7dA
	rZJDn95qqMWoT+dVEzdazu/dxzYUT3fbSBVVOlrYKBdbsbJuIs/VBUXDfHikhQu6SyS+k2EW8ZNeG
	HgwTnVBGrJuX3v+GPsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjG0-00B2CF-Ck; Wed, 22 Feb 2023 07:09:40 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUjFx-00B2Aw-Ea
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 07:09:38 +0000
Received: by mail-io1-xd35.google.com with SMTP id b16so2242880iof.11
        for <ath10k@lists.infradead.org>; Tue, 21 Feb 2023 23:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mopGGJRWyF6lhmZLijInHJpk0iqSNEh7TvfY6xu4PPI=;
        b=MV5ydonJf5couW8XWZh3Os3P5xphPi7lmCUVxsm9irpj5pGp+T0Wh/8DJOhjZGOYZh
         Q56nUiQNIlapJCBxPC9MF6el7nh8lItNDjUWEmCxSx8hoO2SHn2kFnO1X9Ci8+1tp/6Z
         MxHK+3CHr5aAuWZQmbGxPZliuD7LTRIqyG0uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mopGGJRWyF6lhmZLijInHJpk0iqSNEh7TvfY6xu4PPI=;
        b=GqXAwEe8cv12qikUDuaJodPHO16uaPas6p0nNMbRyobQi+CFPgTSCVwEUqdmbup5tJ
         AwPVRaRfHYDYmbY0B7/ntO5HLPxeqC/wWUARcJroa0dpMMi3bmUiQrwx2wg3mUavinDN
         Zfkom+7HXxoB//9V82V7J3lHzngIaeQQHLKaoRAxNPBAbztCXkP5pwEZ7Wtx/KslmaHN
         ei04FqxJMQtpKdxzPqE5TQT7EQsMad48rnKQ45PUu0Rtp76TM2x3b6IakjH3tp2+VsWc
         9J7Cc0Ee0Yco4xQTwyCeh+NkDmDotWQZuOAMG7ms/fEa2Y/O4jBLRd7pBKrxbgTEXs62
         MSpw==
X-Gm-Message-State: AO0yUKV7g0K7ePrdxS8EroUoF9Vztln05h9NeZtewHA9VlqA+6aXKpac
	3gSipK0tPMVreR5w2YTkyDhb9IYkI3sCyOcq9NnOIw==
X-Google-Smtp-Source: AK7set+tqFM6R9VNoRneOI95BWuxBGUxEVAwGo2e4OEi8THxSuZWMYnxR5HVyRIFUqGgpXQhecv7XYy9KnG7BYIS8FA=
X-Received: by 2002:a5d:990e:0:b0:71e:2d29:aa48 with SMTP id
 x14-20020a5d990e000000b0071e2d29aa48mr4437709iol.29.1677049775507; Tue, 21
 Feb 2023 23:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
In-Reply-To: <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Tue, 21 Feb 2023 23:09:24 -0800
Message-ID: <CACTWRws334p0qpsZrDBULgS124Zye9D7YC3F9hzJpaFzSmn1CQ@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: snoc: enable threaded napi on WCN3990
To: kvalo@kernel.org
Cc: davem@davemloft.net, ath10k@lists.infradead.org, quic_mpubbise@quicinc.com, 
	netdev@vger.kernel.org, kuba@kernel.org, linux-wireless@vger.kernel.org, 
	pabeni@redhat.com, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_230937_508660_F5E99089 
X-CRM114-Status: GOOD (  18.98  )
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

Hi Kale,

Gentle reminder for your comments.

Thanks
Abhishek

On Thu, Feb 2, 2023 at 4:02 PM Abhishek Kumar <kuabhs@chromium.org> wrote:
>
> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
>
> Based on testing, it was observed that on WCN3990, the CPU0 reaches
> 100% utilization when napi runs in softirq context. At the same
> time the other CPUs are at low consumption percentage. This
> does not allow device to reach its maximum throughput potential.
> After enabling threaded napi, CPU load is balanced across all CPUs
> and following improvments were observed:
> - UDP_RX increase by ~22-25%
> - TCP_RX increase by ~15%
>
> Here are some of the additional raw data with and without threaded napi:
> ==================================================
> udp_rx(Without threaded NAPI)
> 435.98+-5.16 : Channel 44
> 439.06+-0.66 : Channel 157
>
> udp_rx(With threaded NAPI)
> 509.73+-41.03 : Channel 44
> 549.97+-7.62 : Channel 157
> ===================================================
> udp_tx(Without threaded NAPI)
> 461.31+-0.69  : Channel 44
> 461.46+-0.78 : Channel 157
>
> udp_tx(With threaded NAPI)
> 459.20+-0.77 : Channel 44
> 459.78+-1.08 : Channel 157
> ===================================================
> tcp_rx(Without threaded NAPI)
> 472.63+-2.35 : Channel 44
> 469.29+-6.31 : Channel 157
>
> tcp_rx(With threaded NAPI)
> 498.49+-2.44 : Channel 44
> 541.14+-40.65 : Channel 157
> ===================================================
> tcp_tx(Without threaded NAPI)
> 317.34+-2.37 : Channel 44
> 317.01+-2.56 : Channel 157
>
> tcp_tx(With threaded NAPI)
> 371.34+-2.36 : Channel 44
> 376.95+-9.40 : Channel 157
> ===================================================
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
> Changes in v2:
> - Removed the hw param checks to add dev_set_threaded() to snoc.c
> - Added some more test data in the commit message.
>
>  drivers/net/wireless/ath/ath10k/snoc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index cfcb759a87de..0f6d2f67ff6b 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -927,6 +927,7 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>
>         bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
>
> +       dev_set_threaded(&ar->napi_dev, true);
>         ath10k_core_napi_enable(ar);
>         ath10k_snoc_irq_enable(ar);
>         ath10k_snoc_rx_post(ar);
> --
> 2.39.1.519.gcb327c4b5f-goog
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

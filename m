Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CEDC87FDA
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWw+MjM3br4Mpju/7XqdWU9TQLJhhkihJVgJqEHEcAA=; b=IfVqGCy9Qw7DJhjTkB6/4h1nOk
	aWVDsKWewajFZncRQw8LnywQZRte5xqJ++kKdDdY5BGIjuJyeztsmRWpRd/AP5Ij3pS2ECbO6wyy+
	panB2hBsGD6PEr1cHuENXvECAogmufXdjgvbU4SAtVDdWu8jGF4L4YQOU+Ie/ONGXA/7/PjJqkEZa
	Plmlii3wKGAuKStVZqL32IHQ3IlP8TvD2N8VF7a4gYBcYXQr3UgSYCsUMuZNgYgdJ0s43bY0jt1T9
	jGxxyjGrkc/Up1KVuKMgchQNAe+aNGWjY1JFpkhJ5j7u3EaHfa+3AV8yNlweSbqPnCXrK5+8iZk7b
	VlFpDcuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfRA-0000000FTsH-3Tg9;
	Wed, 06 Aug 2025 14:48:16 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujfLv-0000000FTHt-412Z
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 14:42:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso5698143f8f.3
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 07:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754491370; x=1755096170; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWw+MjM3br4Mpju/7XqdWU9TQLJhhkihJVgJqEHEcAA=;
        b=P3dcQAaZa/IsQsUIN3X+DLMY9gl9eRkdXVUbNYXFdu5VzPgo8FjKjClQnr2Cez2Qwx
         bINFkxXmeYznB4jV1wlGVD6sTMajdJwvQ7SYoHtpKYNqyvkyaNODQkfVrDldtp2Jzit6
         v8eLUHWf6ztgATAww508D0D9WNIyAbOlmF3SfvLdSulL/gv1b7PGMUls1vcN3zAPTuUM
         O632/izUvSBbFAHe0T7Qn7IKLRhM9dtHGprlAmvV7fZrK6qz3vEzH6HW7KVFK55mRh27
         jAdahNyH1hHFKaVIQmmK0ip44TvxSIE3Y6pcglrayEV7LgJlsJ5gqY5cJHGffkxveeHK
         wO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491370; x=1755096170;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QWw+MjM3br4Mpju/7XqdWU9TQLJhhkihJVgJqEHEcAA=;
        b=tUjJqfMoB2OpWmPalCjVDTYmeysKhf7o1VYZO6j4QpZ1uVm2tN4uo8xQXGbWGQwIol
         ZY0HpfRB6UE494JsS65T1Q8TfLE066eqr6hyIGIWHG0b5DW6bbl2wuhESxagKWtUpbNz
         3HzGmUILEpPDOf/JOF0KESy/+ucXCRRzXFJGfJglMn/kBrVYcM48Zz7DKA4PG6P/qGsD
         zPUxTVLI/pM8j1Ro/Ti2687gSHCPjmbL9nfReQ35L2L0dgzzivSqungwtmUY49oZCHxN
         jGiK6lc6D6ZEAhELob9Hm83bq4lpHIlAi7EoH/rqN/wPCT6NlhH5qvytAPi8DIA1B6oc
         tOdA==
X-Forwarded-Encrypted: i=1; AJvYcCX+LA++hiInwQ+/enUQUI57MVkTSfgT57WL0yzuyPP57hqL1FKPYGeM3kSJDQxFGaMKxYKKF1g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr5I3ZAkddyCVrvjN1IqsnclECOcjw7vg/xvEDcXrnS1qLnypC
	HuiijLJE09oIOP/o03I+LgaI5pVtECagzZzHlNr6x4flxLkiJinVX/VR
X-Gm-Gg: ASbGnct7PivE+DCoMCqI8M5UaSut/0AkBvOo3F+/okVBjAIg99HgjhQ4aeAafuIixU+
	fWJDSCRX3Rai5Vx+U5GhNBipbHqnS//0f/u2MB/dQ5aFii4hDRGGlCz8jq2uRSFPhQYGuocqzHS
	9YEJRHw5s9M5TlPJq6sDiAYm0hF/CTk9UKSn7R4MvXB6bXcUT4AIhRWHb1T/t1hBuriV1jg/fxb
	75i6G3//ODz2eiFaF/jSSVI+hdNVvfst2akqw/zKZzKJxS9+yzqEt9MqRQn6f7/QOeIchyAu2VC
	mZ+LxrEPFYMvNKF21qjkhvI/3xDPiXzMpgOVTki5CRRiyIE7cpWs7HJpSxrlD2/cX5g9mT4aJHO
	2wDQuozUu6Bzs2/RVLUb1Xe9t7zTkkcBCfaZ2O57k
X-Google-Smtp-Source: AGHT+IHWeGfQXaO+4NLW4ZYjiQkn0HSH4ezZav2OEQkSkp83L62iz1a5bKsv2KyEuXbYkEeAhim/Cg==
X-Received: by 2002:a05:6000:4287:b0:3b7:90f3:cd8a with SMTP id ffacd0b85a97d-3b8f41b6e65mr2942970f8f.49.1754491369781;
        Wed, 06 Aug 2025 07:42:49 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9c7dsm23096886f8f.26.2025.08.06.07.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:42:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 16:42:48 +0200
Message-Id: <DBVFA7TPXKHU.33YF5JEOR1ZLT@gmail.com>
To: "Zhi-Jun You" <hujy652@gmail.com>, <jjohnson@kernel.org>
Cc: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
Subject: Re: [RFC PATCH] wifi: ath10k: support flush_sta method
From: "Nicolas Escande" <nico.escande@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806070005.1429-1-hujy652@gmail.com>
In-Reply-To: <20250806070005.1429-1-hujy652@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_074251_997348_CC33BA54 
X-CRM114-Status: GOOD (  18.91  )
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

On Wed Aug 6, 2025 at 9:00 AM CEST, Zhi-Jun You wrote:
> When a STA is marked as no longer authorized, if the driver doesn't
> implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> flush hardware queues to avoid sending unencrypted frames.
>
> This has became a problem for ath10k because ieee80211_flush_queues()
> will stop all traffic and call ath10k_flush, which waits until the
> whole HW queue is empty. In a busy environment this will trigger a
> timeout warning and stalls other STAs.
>
> Fix this by implementing flush_sta method using WMI command to flush
> frames of a specific STA.
> Flushed frames will be marked as discard in tx complete indication.
>
> ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
> true.
>
> Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157
>
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 24dd794e31ea..6959f20334a7 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8135,6 +8135,20 @@ static void ath10k_flush(struct ieee80211_hw *hw, =
struct ieee80211_vif *vif,
>  	mutex_unlock(&ar->conf_mutex);
>  }
> =20
> +static void ath10k_mac_op_flush_sta(struct ieee80211_hw *hw, struct ieee=
80211_vif *vif,
> +			     struct ieee80211_sta *sta)
> +{
> +	struct ath10k_vif *arvif =3D (void *)vif->drv_priv;
> +	struct ath10k *ar =3D hw->priv;
> +	u32 bitmap =3D 0xFFFFFFFF;
> +	int ret =3D 0;
> +
> +	ret =3D ath10k_wmi_peer_flush(ar, arvif->vdev_id, sta->addr, bitmap);
> +	if (ret)
> +		ath10k_warn(ar, "failed to flush sta (sta %pM)\n",
> +			    sta->addr);

Hello,

Just to be sure, you have seen real improvements from this ?
Because I remember trying this exact WMI command two years ago and I couldn=
't be
sure it was actually doing something. That's one of the reasons why we ende=
d up
doing the per peer frame accounting as posted by remi here
https://lore.kernel.org/linux-wireless/17d26d6a3e80ff03939ee7935fdc07f979b6=
1a4f.1732293922.git.repk@triplefau.lt/

Thanks


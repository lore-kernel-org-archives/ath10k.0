Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8103CC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHolckyvTdj55NsFtXNgdILdDY63PAD+0INpBoGg/+I=; b=1gUUszv+yGWuqh
	2Sx2Fgz8s2Zk9jOrI/jNfLTY4UDQhg3oqprcwAMyOs+YHeg/+bNciS2hCA1D+c6Cs86EXbZ3s3xyk
	FHjy/NoVa8K1u/zAES1RGW6G66hyHu/JyCEFPzahPJOMA3vBsKEJ2LCr95FhsKWhD3VXNr7puRtfj
	oHTwba+FoCJJNfRnIEU6N7ohWugOrH8R6opg8WVmv1Ph07/gY26s3nuFgb2kHOyVea8QpLrTqt+63
	M3jN/PVZBtY1x0cjYPJNkzJ75OGAyKu6ZdT/zk0LtuHd9mjFkhcBljGM30uXW5iILr0Qg/DVgXt2+
	Kcun1e2AMY/f/9edHDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8h3-0028g4-21;
	Fri, 17 Mar 2023 11:56:21 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8h0-0028ee-2M
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:56:20 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5416698e889so89512207b3.2
        for <ath10k@lists.infradead.org>; Fri, 17 Mar 2023 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679054173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb5o9NMW97WH6ZSWEBSm+p2LactDwm89gAf2F/3Y6l0=;
        b=vv3J8HWXGxNXIOL3WzPjbKwZqvxe4NB/4PAv486r+Z+WVbQ7skCEcqS7BbTtgZ1bVe
         Vp2Rftz06dO0Ze/MsFeH1Ejvpg6dMUxeaDzbDzKTilV1wwl81zh1UjXkf5DO3wv7/Z2H
         A986bIiCkIw9lTMoMuLyxvRzIr+OSagLvYEGl5UwOxQ6dABimZWz7yWzEFZP5GqXAI0w
         Zv0pI8JH8WSCVFy4X5j7ul+GRxoyGhU338vOdK7eKs9YrPX/uB9JJkmdimiTZIR8o85C
         GAdw/hk87fYZPREG4g5xewXyCFLpZeOhYBjU1vx8vH7ziZsQYOp134ohPf0sPLz0GeZu
         W+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb5o9NMW97WH6ZSWEBSm+p2LactDwm89gAf2F/3Y6l0=;
        b=UA4Kk2ceWVxugFwAHIrd2wGjNrMutDtnP02KBZHtk+whO0N52IlG165TF3uPsKxXl/
         0THI5cYNXSLaA9r2vIH0soV5lLXEArHOQ2iIT4/D99vh5dyq7wu9Dbww/V7e6A2V8HYN
         nXVvEPF+ZI7jaA1Rfv7+OHDgNbcbaJ/SvYOZrkDaICGwYx6wj0s+qM7aLdbXcjTVD6T4
         Oczi5fMSX8x84uookhX0dTYnL0axucOw9aXDE1GEKkyf0/HKb+KFCmk5v46+7lAj48Ji
         trquaaF/uvQJi85thZh12zAe9FGZlytnTP9+tpTHyW5VUOdS8Nm01p6yOfQNco2kv12J
         VTKQ==
X-Gm-Message-State: AO0yUKXnF1RIpIkRu3w5kfVPmKpn40aLH9GhdqbajL8MO/yODSuAR9BG
	Qjt4CB4WPA+FqBZBbsTw8Ni8XNTul2D0wwUObCeXdA==
X-Google-Smtp-Source: AK7set+tGSkTdboyNwnrvxQQd8kS2YmSjSvmZUF6A7AiTYWRbx3oGzg+DuJTelC014W0zlAGiZ7ChE7WRqPYcCKcME4=
X-Received: by 2002:a81:d84d:0:b0:543:9065:b225 with SMTP id
 n13-20020a81d84d000000b005439065b225mr4618691ywl.5.1679054173616; Fri, 17 Mar
 2023 04:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
 <87o7oriodg.fsf@kernel.org>
In-Reply-To: <87o7oriodg.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Mar 2023 13:56:02 +0200
Message-ID: <CAA8EJprAsKeQdX=6f-E9=xjfbT_Wf5h6-97Rb5Vcy2jBTVzY0Q@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_045618_765548_DD7B43FE 
X-CRM114-Status: GOOD (  16.15  )
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

On Fri, 17 Mar 2023 at 13:55, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > We'd like to ask for inclusion of the board file for the Lenovo Yoga
> > C630 laptop. It is
> > a WfA laptop using the Snapdragon SDM850 SoC.
> > Following the questions from the ath10k wiki page:
> >
> > * description for what hardware this is
> > - It is an SDM845-based platform (SDM850)
> > - It uses wcn3990 chip as a WiFi and BT radio
> > - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> > chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> >
> > * origin of the board file
> >   - They come from the original Windows partition, thus being a part
> > of Windows drivers.
> >
> > * ids to be used with the board file
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
> >
> > Note, the device comes with the board_id not changed from 0xff.
> > Following the example of Chromebook boards we are adding the
> > calibration variant.
> >
> > * md5sum of each new board file to add
> >
> > $ md5sum *
> > 6cd260ad261193fb8b3ddf5293d0103f
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
> >
> > $ sha256sum *
> > ff96e5295cc3e3fd86f04049058396cd69cd7f1bc44ef4784f13ffe48ef42a8d
> > bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
>
> Thanks, added to WCN3990/hw1.0/board-2.bin:

Thank you!

>
> New:
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
>
> Changed:
>
>
> Deleted:
>
> 1 board image(s) added, 0 changed, 0 deleted, 21 in total
>
> https://github.com/kvalo/ath10k-firmware/commit/8aa55df10c78598c8eef4a6de957474c8802ced8
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

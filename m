Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D9EC6FD1F
	for <ath10k@archiver.kernel.org>; Tue, 26 Mar 2024 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmwSVgcANgS6fYryY3emDGCDPEtDJ3DFBe5zLXj/myg=; b=b9dru3ZN6eNnXVvqrzDnrkF65t
	GeQHY5TA25GQFJYWagvWLTSPeyJl4FPAwnh6FIZt8nSVA9QD8L0OwxUBSZOvrwJguG89CDIOQhR0q
	ZVg+C0tl+bv3XOaAolqXVlXlxWd9+Ghf4XX7OtbFIi3dBan/GcAIX8kvbZy+Us7wn9IIcj9TFAeOj
	CtBEXZ3Ge1zos6b2X3aUa0HCw+winP/AwLyy02z/AQYK/3uBfcIkRKTeyZnnIZbX6dCWxS/P2jj4p
	yvCHleiW95Qxerr5kxmGaaKAu5vAS65/MtFmA5Oxb3oEoH6bLgkee/ENN3lKQ0m1MUWSv9ByqbnwX
	1LUMc9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAxv-00000005opN-1qVz;
	Tue, 26 Mar 2024 17:52:03 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAxq-00000005omI-3jXY
	for ath10k@lists.infradead.org;
	Tue, 26 Mar 2024 17:52:01 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-60a046c5262so55390257b3.2
        for <ath10k@lists.infradead.org>; Tue, 26 Mar 2024 10:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711475516; x=1712080316; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YmwSVgcANgS6fYryY3emDGCDPEtDJ3DFBe5zLXj/myg=;
        b=uyQsEijLgh5RM0cMptgUI1qEzMK8rnr7ryEmN20t0WbIoldAAUJNl/wXXdYjFZFmvi
         XrzAzz8nsenr2WBdoc42scHCyMBqgDWzj/3MeUDwerrRL+LmodTP/zJGhRLDdrCk7n1H
         whGdpIGO0ChEbdEA1D0leI4qRJ47jeA00rOtB90yvfmP3n/bAvEAgeB0BW42Bv6ifTjY
         WI4oixL3UQM3gd9VY3pmgAW8cMIjpNcWpQB4q+qIvGx6Sm9ydLXnu+eYQmexd4j6nH2I
         Zn8ep9E2KNj6iKuwBAeEGYJMCi0uduNUiDmfMbUL3jx3qW4bABJ/MZIbwHy/AP8w3gJQ
         jOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475516; x=1712080316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmwSVgcANgS6fYryY3emDGCDPEtDJ3DFBe5zLXj/myg=;
        b=v/j5kfegI2YWp7UN/jG1ooWc1PUkeGyj1oF5PbACib7qRJgvZ2DQZxYgihbLgnemgn
         u0PZn4/ZXmGiGs7+6r2jQ26YWS5lUfuROymC3tGrgN1ptc6gPscDZunmpdE3zCfaZ8FM
         ZOqJvkybESqe83+UlwgnLJ6aK8PXJ4qdRDUe8ffbaQVpTNrJGPSYxmXaGsAoDTFtIxXZ
         f7dMohhRUSjRC6/O5xOfOPSsSy4x5R1f7UoUMIlw4Y7aE3xSE9HhDbrxmAg0K/jZmDHc
         +Dv+QJaYk9HNDPUW69xO6VVuXQMxC106y5aIRInvi9GzOpAPBCXs+KYr1I/a3EMHwHcg
         8KHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+6ciQfM/2ISdSxZqyw6RMyrUigSaWGy5dcX5/HpzgPPb49T5VEjx6Z66UMecoDMrFLt2wEM5SV+0n81PAH5zrgNk/IJALST0LwA==
X-Gm-Message-State: AOJu0YyJVE5oyZeGgnmxG+DKb0GcXCWfJ2z0dNZS2CLDIgmTdkGGiKoH
	FLQErFSm5wWso1EESi6gpznGHXLxkyW9bbziri2q2zH9ktL7cS5OfNL5Ehn+x1fBVbNGqvc9Yyq
	3zlCbPhhh3tYeJyWy0k5Jrmnl+JNH7NR6uog+yw==
X-Google-Smtp-Source: AGHT+IGfkGrTI6eIz8lVv6JXkJfPdSx1LuDJEd4XH1qqH9+cdHqF0OlzCQI7DCuFGWL9YC+XktTmFPQPUArxULWXOcs=
X-Received: by 2002:a25:868f:0:b0:dc7:49a8:e148 with SMTP id
 z15-20020a25868f000000b00dc749a8e148mr8467544ybk.27.1711475516256; Tue, 26
 Mar 2024 10:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr> <243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr>
 <9293793d-00e8-42ce-87b2-05abc3b49387@freebox.fr>
In-Reply-To: <9293793d-00e8-42ce-87b2-05abc3b49387@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:51:45 +0200
Message-ID: <CAA8EJppn6M9dpzyu9d283AUtaeN-i-L=-aM5P9BEELXPLFS8YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath10k <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>, 
	DT <devicetree@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_105159_221074_6BA3A286 
X-CRM114-Status: GOOD (  16.84  )
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

On Tue, 26 Mar 2024 at 19:45, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> [ It has been pointed out to me that the previous message was unclear. ]
> [ Below is my 2nd attempt at a clearer message. ]
>
> Problem: firmware-5.bin has not been parsed yet when we have to handle
> the ATH10K_QMI_EVENT_SERVER_ARRIVE case, so we can't rely on feature bits
> to work around the lack of MSA_READY indicator.

Then, I'd say, we have to resort to the DT property, unless Kalle or
Jeff have other proposals.

>
>
> On 26/03/2024 16:04, Marc Gonzalez wrote:
>
> > QMI stuff happens much EARLIER than firmware-5.bin handling.
> > (ar->running_fw is still NULL)
> >
> >
> > [   14.547563] ath10k_snoc 18800000.wifi: qmi wifi fw qmi service connected
> > [   14.555054] ath10k_snoc 18800000.wifi: qmi indication register request completed
> > [   14.561406] ath10k_snoc 18800000.wifi: qmi host capability request completed
> > [   14.568365] ath10k_snoc 18800000.wifi: qmi msa mem region 0 addr 0x0x0000000094400000 size 0x4000 flag 0x00000001
> > [   14.573775] ath10k_snoc 18800000.wifi: qmi msa mem region 1 addr 0x0x0000000094404000 size 0xfc000 flag 0x00000000
> > [   14.583896] ath10k_snoc 18800000.wifi: qmi msa mem info request completed
> > [   14.630179] ath10k_snoc 18800000.wifi: qmi msa mem ready request completed
> > [   14.681647] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
> > [   14.681726] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
> > *** ATH10K_QMI_EVENT_SERVER_ARRIVE is handled at this point
> > [   14.690657] ath10k_snoc 18800000.wifi: DT bdf variant name not set.
> > [   14.706423] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
> > [   14.712587] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
> > [   14.722309] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff'
> > [   14.745634] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/board-2.bin': 0
> > ... snip boards dump
> > [   15.560607] ath10k_snoc 18800000.wifi: boot found match for name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
> > [   15.570590] ath10k_snoc 18800000.wifi: boot found board data for 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
> > [   15.580393] ath10k_snoc 18800000.wifi: using board api 2
> > [   15.591465] ath10k_snoc 18800000.wifi: qmi bdf download request completed
> > [   15.595786] ath10k_snoc 18800000.wifi: qmi cal report request completed
> > [   18.667441] ath10k_snoc 18800000.wifi: wifi fw ready event received
> > [   18.667519] ath10k_snoc 18800000.wifi: ath10k_snoc_hif_power_up:WCN3990 driver state = 0
> > [   18.672579] ath10k_snoc 18800000.wifi: soc power on
> > [   18.684550] ath10k_snoc 18800000.wifi: qmi mode 0 config 00000000313ae0ca
> > [   18.692591] ath10k_snoc 18800000.wifi: qmi config request completed
> > [   18.748262] ath10k_snoc 18800000.wifi: qmi wlan mode req completed: 0
> > [   18.748370] ath10k_snoc 18800000.wifi: boot init ce src ring id 0 entries 16 base_addr 00000000b9feff9c
> > [   18.753792] ath10k_snoc 18800000.wifi: boot ce dest ring id 1 entries 512 base_addr 000000005f850e88
> > [   18.762971] ath10k_snoc 18800000.wifi: boot ce dest ring id 2 entries 64 base_addr 000000002467084e
> > [   18.772375] ath10k_snoc 18800000.wifi: boot init ce src ring id 3 entries 32 base_addr 00000000ded78c3f
> > [   18.781122] ath10k_snoc 18800000.wifi: boot init ce src ring id 4 entries 2048 base_addr 00000000c9e8883a
> > [   18.790482] ath10k_snoc 18800000.wifi: boot ce dest ring id 5 entries 512 base_addr 00000000309e9375
> > [   18.800220] ath10k_snoc 18800000.wifi: boot init ce src ring id 7 entries 2 base_addr 00000000e5e3fb73
> > [   18.809395] ath10k_snoc 18800000.wifi: boot ce dest ring id 7 entries 2 base_addr 00000000c08890b2
> > [   18.818507] ath10k_snoc 18800000.wifi: boot ce dest ring id 8 entries 128 base_addr 000000006af0777e
> > [   18.827466] ath10k_snoc 18800000.wifi: boot ce dest ring id 9 entries 512 base_addr 00000000f2c0ce43
> > [   18.836770] ath10k_snoc 18800000.wifi: boot ce dest ring id 10 entries 512 base_addr 00000000269a2564
> > [   18.845863] ath10k_snoc 18800000.wifi: boot ce dest ring id 11 entries 512 base_addr 00000000f4a8c90e
> > [   18.855002] ath10k_snoc 18800000.wifi: Hardware name wcn3990 hw1.0 version 0x8
> > [   18.865605] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/pre-cal-snoc-18800000.wifi.bin': -2
> > [   18.871747] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/cal-snoc-18800000.wifi.bin': -2
> > [   18.880307] ath10k_snoc 18800000.wifi: trying fw api 6
> > [   18.889520] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-6.bin': -2
> > [   18.894020] ath10k_snoc 18800000.wifi: trying fw api 5
> > *** firmware-5.bin is handled at this point
> > [   18.904176] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-5.bin': 0
> > [   18.907802] ath10k_snoc 18800000.wifi: found fw timestamp 1539237028
> > [   18.916460] ath10k_snoc 18800000.wifi: found firmware features ie (3 B)
> > [   18.923027] ath10k_snoc 18800000.wifi: Enabling feature bit: 6
> > [   18.929373] ath10k_snoc 18800000.wifi: Enabling feature bit: 18
> > [   18.935279] ath10k_snoc 18800000.wifi: Enabling feature bit: 19
> > [   18.941085] ath10k_snoc 18800000.wifi: features
> > [   18.946975] ath10k_snoc 18800000.wifi: 00000000: 40 00 0c 00 00 00 00 00                          @.......
> > [   18.951534] ath10k_snoc 18800000.wifi: found fw ie wmi op version 4
> > [   18.961235] ath10k_snoc 18800000.wifi: found fw ie htt op version 3
> > [   18.967390] ath10k_snoc 18800000.wifi: using fw api 5
> >
> >
> >
> > I don't know how to solve this problem.
> > (If we just skip waiting for MSA_READY, there is no problem)
> >
> > Kalle, Jeff, do you see a way out of this conundrum?
>
> Regards.
>


-- 
With best wishes
Dmitry


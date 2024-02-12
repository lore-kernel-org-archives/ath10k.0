Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5630C48297
	for <ath10k@archiver.kernel.org>; Mon, 12 Feb 2024 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/A7r9NP/0VziEIfxN1XbFV9hH5pFIDQbUZtjpYFKSQ=; b=F+M9mfUGZwNMcwEQJCuH39CZIT
	OLpSPBaUIkX5SN/LRU55Udvk+G0hAWkD7QgM1/Uh4uxx1dOg/1eIewwVpX0A+5kJ//YhBZm+B2HXH
	MQ8Kw0dDCNSt4nU5RbNQAiTttUKqJJojccibC6fk+emnbs81sPiJDJhJ5kuZQle2e98WZreLRe4Ky
	SBZ6dzjZJ/UeLHc82+Rn2/iQDySkVsTVdeZ4C/eKMWd6idctMyagAyDMD9H2qh4QB4OFrGCxv0Ch3
	60Ymr4P0V7VNKa7rPoTnlEZrPTjK9DPf7ZooAAMd9OxCQDFzD0kWM/RB6RusnLx2WZqibmIAU/Uct
	KRGlPOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWHn-00000005UCh-05or;
	Mon, 12 Feb 2024 13:23:51 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZWHk-00000005UBi-1sIF
	for ath10k@lists.infradead.org;
	Mon, 12 Feb 2024 13:23:49 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso2833921276.0
        for <ath10k@lists.infradead.org>; Mon, 12 Feb 2024 05:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707744227; x=1708349027; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/A7r9NP/0VziEIfxN1XbFV9hH5pFIDQbUZtjpYFKSQ=;
        b=Pesrj68iuUBdZTPmdeNyyYHRSgVBGN/vOXU1Mx8XuitgOz0VsgLvOj2L9TF7rFg9mD
         GPPASq3Qugs64h1Ygt4LtBC+MI6BGOKJb3dJo+9wcvbaTz4A+h9P379820epVvcJZk1r
         x2iygU7n9kb8XO1sG6zM6ZH6E+JHX2SppOCw6auCeG0RK6ON+Ox0bszp0AYH3c3dRTN8
         M6MD/GpaNKQ/Ya7k+7OV9h7U5SdMB7zj1MTZBt9KJ7Lnh2f2j7D6YwfmIGvumGYReTnV
         MeD7B96DyptsNVFsKuVK4r6ILY91ate1UPZ6QODg1iGP+mZUkhXTrX/Pt4j3Q6/bc/kB
         EzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707744227; x=1708349027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/A7r9NP/0VziEIfxN1XbFV9hH5pFIDQbUZtjpYFKSQ=;
        b=eApqrbe6GlpExeNxMsrktf0/loqlFhgWAWsS29WCe0+6ff8QNr5JeoeafpOp6mCsiY
         NVnkQY6ldCV/fDn4O8q+Z8ABFeNdpJ80KJbFg6JG8IS0RkygULBXFZTNhZPUkz4I4XGW
         DAihzg+5ilQO+nCqPJp0+yCT+A2FeMR0YxrvCYCb/AijKYKh7LBNxanv9hsWQsBT9g68
         8ED6+RbqNFVhh3pKnV8/jjXx3S0S/iq+Kyx/wjpBPrU4vxc7dRe80kCHNb3nKnuLSK7c
         izMZkbxFcjj59nZfdle+t9a7zmXVf4JhSE7nQIeC5d+UfTGyk6AsofRAgVXW6ra7plR0
         W/pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUOMUVCfQcEG0lDcgKGGMdt+Y/gIKTaUNN+SyT4e6PgFM1iN/cukpUkIfeHFFK10Mo+GXj3RRxM81SmWBf24gATQNP/aAoB9kvA==
X-Gm-Message-State: AOJu0Ywh39c3In68a9xR8QF2jj35tXLjrAYxpCd+A99xIKQANOs8ni/h
	ywTTka8ObQ7kKUutfMU8f4rOitkWFlQO9UORlQg/d2twpglaCSfw4rsZduldYKGmJf4GmT25fCb
	V+v2RSHFHJqd/+xVKKGub4MlJ+pIAMMmsHUCeqg==
X-Google-Smtp-Source: AGHT+IFaHXNER64YVI2EmDGuarm5+vqB/KmhTYs8V+V8KJWqxbKjhPCsz8Bj5huKgdacRxl9V59XYT2x99P6pR1T7vY=
X-Received: by 2002:a05:6902:2489:b0:dc6:421a:3024 with SMTP id
 ds9-20020a056902248900b00dc6421a3024mr6213196ybb.43.1707744225689; Mon, 12
 Feb 2024 05:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org>
 <20240130-wcn3990-firmware-path-v1-2-826b93202964@linaro.org> <03d5d556-9477-4f2e-a737-c2f6a96d97a4@linaro.org>
In-Reply-To: <03d5d556-9477-4f2e-a737-c2f6a96d97a4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 15:23:35 +0200
Message-ID: <CAA8EJpratQH5fS9mS8mnK=c9FwHn8n8g5dj+weoyzrobVMOvBQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] wifi: ath10k: support board-specific firmware overrides
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_052348_528113_FECD8C65 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, 12 Feb 2024 at 13:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 30.01.2024 17:38, Dmitry Baryshkov wrote:
> > Different Qualcomm platforms using WCN3990 WiFI chip use SoC-specific
> > firmware versions with different features. For example firmware for
> > SDM845 doesn't use single-chan-info-per-channel feature, while firmware
> > for QRB2210 / QRB4210 requires that feature. Allow board DT files to
> > override the subdir of the fw dir used to lookup the firmware-N.bin file
> > decribing corresponding WiFi firmware.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/net/wireless/ath/ath10k/core.c | 11 ++++++++++-
> >  drivers/net/wireless/ath/ath10k/core.h |  2 ++
> >  drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> > index 0032f8aa892f..ef7ce8b3f8fb 100644
> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -942,11 +942,20 @@ static const struct firmware *ath10k_fetch_fw_file(struct ath10k *ar,
> >       if (dir == NULL)
> >               dir = ".";
> >
> > +     if (ar->board_name) {
> > +             snprintf(filename, sizeof(filename), "%s/%s/%s",
> > +                      dir, ar->board_name, file);
> > +             ret = firmware_request_nowarn(&fw, filename, ar->dev);
> > +             ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot fw request '%s': %d\n",
> > +                        filename, ret);
>
> Perhaps it'd be useful to move to a more noisy loglevel

No, these are details. If the firmware is in place, it is loaded properly.


-- 
With best wishes
Dmitry


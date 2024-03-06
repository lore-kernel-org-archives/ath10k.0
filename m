Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E57C54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE0MVDCXkFfkK14pSEGUiwKD5ySa/rN86aRvUc0sq4M=; b=CXbIE+B/q7kjXMFSZ64qQV6GEd
	HLi73BZ8v9AzgasqZIMmLLGtRsh8Ln702Oqq/geZ1kCHFbMS6vx+bGy/ogC+I1wrdmOlx2eCCne/S
	WiLe4gyfpbDuhszJNyC6DC5p0ZZqrablayN5BF2RP82bYDLjsmtG/Sdy0Cf/57AHl/ngD7keDG0Vi
	MbynAD2NwFyzqe1DQPTRma9zdKv+Ct9ApIo/l7n2G+2bmki3H/7O50+2vKouVojLxnkUXHp/YF6Qn
	Ln9UiBDAgE7krSKxAa4bn+2ZQV2RAQY+GVrkzN4tjnyY1AvgjsJVrS1YcDxkvviL34ew6GJx9on5G
	qopgVN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnUu-0000000H95H-44Zz;
	Wed, 06 Mar 2024 09:23:36 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnUr-0000000H94o-3YKA
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 09:23:35 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dc742543119so6683520276.0
        for <ath10k@lists.infradead.org>; Wed, 06 Mar 2024 01:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709717012; x=1710321812; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BE0MVDCXkFfkK14pSEGUiwKD5ySa/rN86aRvUc0sq4M=;
        b=OQOWbaSglNGTirgfslUHxCVeXTHKIUNhKRC6pZqUhd6QccdhqckZWz9pMA5wc8cDYe
         2qeASRg9feJS3VeHr28bMK0/0MCtBkWENzziqhsE0/ZgL94DrYjWbDYXq3Oda6mfqOzU
         1m1QfWO4I6BF9sUxiZu4cwLiP8KXHwEnaw4i/QeHOKIaVtvslPhxk15O2s/fsIJGELXO
         5rCGnYvzHbeylQD49WF/7PFGcH0285K2dBIasX44YI7Ha7fkkf3ABgJ2oP91nD3MPMir
         8Y5+VVRkrDJi8ptgmKePrtwONes/Lo3mIXtzmA0mJ9hit8H60vQSI1s3fNNKi0BAv+c8
         Jz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709717012; x=1710321812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BE0MVDCXkFfkK14pSEGUiwKD5ySa/rN86aRvUc0sq4M=;
        b=V0Kq0jX1UR/srkzeyJHcPFZ1RDSdGYx2n0rlhgcZ5Rgb1TEa7ph+OgRLIFSj4yVxXW
         Bk7BueT9m9llpZj73eCxKRoawOIfsGbyR02ia12pkFVs4V0xzh7ipI8T1d4Tb0WDzfLX
         CKsC/feAEvmaUzRHv1fSNtk3aANI0zYKNDpv9kwQUfwYlbIMEb3WPedAVlwf8PQ1GaGL
         TArEg3cKH8nNeCoX8v+sB5wvd2eNWlmfbll3uBGUlaDKIRFxj5rm2rdNaUJVB/VMdfdJ
         uuEnSY7CmTClePz6UJkrTw17RS6otH9YsRCWuWFTT1sHqU68/7FeHDrh3Jf5u/Pl1ZEB
         ck3g==
X-Forwarded-Encrypted: i=1; AJvYcCVt1jMOh2abp+R8goavxKCpDCBdnsktYjGUIvRBuBK3w59yK6q0Z0kw5s5+gOWF/DGwFAzVjS/qr1elRDQcTvNmnSjy54JmDRvwdg==
X-Gm-Message-State: AOJu0YxxJy3UIfdan5RDTnOkI9G9bw8zK5VzPxnNj4uLqW7Lp5XHPEdH
	1e1PTt04Pt0tWMluIAt/BaRykrO4e5TxvJ83JLNJry162+1ZDlgo5g8oYS36u3yf4nPktEPcp2Z
	1zKCxUjAwdz1M4aUvdHLvovyxR3HVN9NFMLNlgA==
X-Google-Smtp-Source: AGHT+IEqD5hpmdkgRFXRwqrSiHpbvpPVcqtrBIfSxA0UuBRxD8b9BZq6T95tN3G+N2eV2f/C5TL/xEGs2K3EFoUTu2w=
X-Received: by 2002:a25:aa8b:0:b0:dcf:b5b7:c72 with SMTP id
 t11-20020a25aa8b000000b00dcfb5b70c72mr11319092ybi.0.1709717012028; Wed, 06
 Mar 2024 01:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org> <87plw7hgt4.fsf@kernel.org>
In-Reply-To: <87plw7hgt4.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 11:23:21 +0200
Message-ID: <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware overrides
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_012333_974638_66CC92B0 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, 6 Mar 2024 at 11:04, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
> > modem DSP via the TQFTPserv. These MBN files are signed by the device
> > vendor, can only be used with the particular SoC or device.
> >
> > Unfortunately different firmware versions come with different features.
> > For example firmware for SDM845 doesn't use single-chan-info-per-channel
> > feature, while firmware for QRB2210 / QRB4210 requires that feature.
> >
> > Allow board DT files to override the subdir of the fw dir used to lookup
> > the firmware-N.bin file decribing corresponding WiFi firmware.
> > For example, adding firmware-name = "qrb4210" property will make the
> > driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
> > directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Fixed the comment about the default board name being NULL (Kalle)
> > - Expanded commit message to provide examples for firmware paths (Kalle)
> > - Added a note regarding board-2.bin to the commit message (Kalle)
> > - Link to v1: https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
>
> From my point of view this looks good now but let's see what others say.
> Is there a specific reason why you marked this as RFC still?

No, I just forgot to remove it from the series settings, so you can
consider it as final.

I had one minor question in my head (but that's mostly for patches 3
and 4): in linux-firmware we will have ath10k/WCN3990/hw1.0/qcm2290
and make qrb4210 as a symlink to it. Is that fine from your POV? Or
should we use sensible device names (e.g. qcom-rb1)?




-- 
With best wishes
Dmitry


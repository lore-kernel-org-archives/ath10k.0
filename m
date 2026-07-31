Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D8C54F54
	for <ath10k@archiver.kernel.org>; Fri, 31 Jul 2026 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdWRFs4osWaaJzMBzKIKTHPcsMgJqciu7jcoPmTxYec=; b=bpVs+BUHGO51OmjLSXKPB+BK6k
	Cgsi5W/8TsuilAyHmneoei8IXeaTYE+35wvp/RXq3+2c9X4J0tkJWp5ZW947xHsZ0wUPaQwoD9Qtl
	uVsZfwBWw3oxc/h8fnQPiBQoR8C26sCzATv4OOHzH+YwyftSw2HY4iNnPg7D460bAtGCkac3rVCWQ
	h9Dg4bqLLURuj3s15y5/hpOVSkgCh0TZT5AGTQeiIGo5c3M0KkfahcGfVC88f6tPy6srqY+Gmudrn
	+M+v2cl+wd5M39Mo3wuOkLmZt4d2rdTzcWctEO8k87wueMQxp0y6m4oRMUyjs9Aneeci3mVuG66WC
	hNaRkKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnHO-0000000CcLQ-2kMl;
	Fri, 31 Jul 2026 13:28:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnHN-0000000CcL2-2JpA
	for ath10k@lists.infradead.org;
	Fri, 31 Jul 2026 13:28:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF9E943FD4
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB271F0155E
	for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 13:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785504480;
	bh=BdWRFs4osWaaJzMBzKIKTHPcsMgJqciu7jcoPmTxYec=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=fgm9xkThoqF1bQfPKO65FXat8RPLvTXA1XKtS4lux6x04EWgf5FH13BC8cyLHazPr
	 dxzEQEnZ2Df/Tppmr2j3vLpLLS9qa9ha2qu+qXjQ6azhAt7sq6IF2eqHqW93C5RyoK
	 TzXsDCJ6Ybn/MAaTz0O9nq2rCBocCM3nN5zK6lrw6dP/aHfYjN95ceIZnBoqnWhx1k
	 WW3n99WPKLtRFqFe7BJZA5sk06HwbHzVF9HYWaljlWJJy+T9hsK7wQj88oCou57s59
	 0KAgsXS/e9JqHF1A8NTB/9+4ixHnqSaTU7hPdlftVqNQKKsGa186j1PFolfZL1F7g4
	 cxNxbc1EdJa0g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so979448e87.1
        for <ath10k@lists.infradead.org>; Fri, 31 Jul 2026 06:28:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq1lMTC5awSdtEsIfkzMWhwprpLT1XIyfbfc0NiwKHJDySGzT7Kl5hbxckuimUvdUZvxnt+U9E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6o2rQSNMSNGq8eflruSHmyFokVzjnsz7L0805lUXzvU6PnGS5
	RlTRDCa3j5p3M+DLJ9SD90o4e9e8NpdvOg6RLc5sVwR3y1bpE9WzIkXG147t+FQxxTc0giG93MY
	p/j7HLyBK+2KarygpugSfmaRAjFpAM50tjObEKP9E6w==
X-Received: by 2002:a05:6512:3d9f:b0:5b2:a1f2:466e with SMTP id
 2adb3069b0e04-5b2e1fc8295mr456344e87.10.1785504479286; Fri, 31 Jul 2026
 06:27:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 06:27:58 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 06:27:58 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=McA3BqoazxvGDu1_WoT9x0ujXT_80jKPp+5Jb0Rda9zOA@mail.gmail.com>
MIME-Version: 1.0
References: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
 <CAFEp6-3X+PCXZdEy1p47XUDs7cT16JDjt0=928Jjkeik_haaQw@mail.gmail.com> <CAMRc=McA3BqoazxvGDu1_WoT9x0ujXT_80jKPp+5Jb0Rda9zOA@mail.gmail.com>
Date: Fri, 31 Jul 2026 06:27:58 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdA6dTDvp=kQ+k2Jf=kyZBK7VTJCX=0Qvq2MOvQVOQDsQ@mail.gmail.com>
X-Gm-Features: AUfX_my4-vcUkFt6J5bi893LfoyHoVCDYEQ_iJ8oHk7wCMSuijA_BdfQPo-2B_Q
Message-ID: <CAMRc=MdA6dTDvp=kQ+k2Jf=kyZBK7VTJCX=0Qvq2MOvQVOQDsQ@mail.gmail.com>
Subject: Re: [PATCH v2] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jeff Johnson <jjohnson@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pci@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 31 Jul 2026 15:04:30 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
>>
>> Nit: s/pwrseq_disble/pwrseq_disable ?
>>
>
> Ah dang it, how did I miss it, I test-built it. :/
>
> Thanks for catching it.
>

Ah right, makes sense, it builds fine, it's just my sed script was wrong and
renamed it like this everywhere.

Bart


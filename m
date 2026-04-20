Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A30F5580B
	for <ath10k@archiver.kernel.org>; Mon, 20 Apr 2026 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=; b=vU/xVLxJWBU3yRIhP2NRtD8/Tx
	RZv3yfXpSsdXTBtq9NlX3OVtVD6RPggIKjqpTyt1C3qzlo9rLSsr3VJL69DZKV/J3v6u97DZjY6lY
	6bIWwOVAWX97D5q5p59QL8F9A2JsK2brqP4PnCZT6xvqy6A8T301IPjAEcglj0WSJc0Rr9xbj4L+S
	hRbohSjUnm9/kyoJ0VufdlYPtgdQ8U0rKgrf49e+TrSEMYTskNDgjRLgIY0zt8nqawjbINJVaCUiW
	o8JLAR/6lTSS529OQ3HuMvas/pbr+3tYnbncdktm66BRTJeQDawY44UyozV4JXYKZgPpZlibVxGvj
	pBX+K7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmaD-00000006mEt-2W1p;
	Mon, 20 Apr 2026 11:14:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmaB-00000006mEK-0MIv
	for ath10k@lists.infradead.org;
	Mon, 20 Apr 2026 11:14:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so7781205e9.0
        for <ath10k@lists.infradead.org>; Mon, 20 Apr 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776683664; x=1777288464; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=QiocOZJHJKY/TqImO0V47u1JnG5r1i5F4oFDEd6wSZLzPNfeZ77Oe6fh/TOVMrBEo4
         gzS2jtLFF1P5lzbsPmIyvCSGnoGfQCCFn620cSc+AuP13ML3zCQbTuwUuh/D0duZ33Y8
         d5a/zvUNzNncZ7ZaULrwzNiGLlcfhKvM6/MaFfCYnSNiDOm6IZtNfNPgZXyJ3snZij19
         CKDVSl5fCvE3jCAOwbOt++9tYiTuA+XyKOjGhnRt6u5wqKyYHAIsplatKxetMf3LgRxb
         IVbVIHJpUqcLJE7WkwWSDzAeV/ZLVtyYv0Ec2dRvb0/DDZIDjk3RRXBfzN3/KbLeTaAV
         yGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776683664; x=1777288464;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dympeeiEyneZdFEwmKLL4dnrMWqI+ctP12odqcxsjA4=;
        b=Z14lcovHjOkwmNUsw3YA4NBWvjUYxTBNdSsM26Fx7vNeWeuB0bVLNbqE7hOa3ywbdd
         5FUC3gU45knDTWt7ofoq7uRyr8QA2Ds/ko9rfMR36ENriqbziKDFzicPlsk/eCsbluzZ
         niLGPHXtlpllK5XIsOSDz8zcDBB1iaVu/uQ3rzj8awGTgo3wnDVMQITc4Z+vsL/eE7Od
         4Gltb0W2KauZe0XsTw+7C5USXYF1/5NxugcbGxK94taSufP8keCsN0WCbuCaIN660sgV
         k8u+gcluQivTc3/06ByWv2iHrId+lny/BnM061y/TQN68c9EatXHMlYzP5EPIYTceVJ3
         0ckg==
X-Forwarded-Encrypted: i=1; AFNElJ+l97dTDI0zYR94OSaSB70Z3gqTeEGEEK7ixkljwIVxaNWVBOn9SrXvXe5kB8KBnr7FnXzahuk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy73VHDMSkZSIbJOwqx3RsQaQfOpZxCWDqcE//6f9xmiMnH1VmD
	4Fmw+sEUhYwBTU5zLLST5o6UCDvLeXWn3Tu65Rz+gNqoV2oivQ9VOyGZwuBo6OWuTwI=
X-Gm-Gg: AeBDievbwET93DVWnxNwBX3SPQgSnsO64m7q1NyrG0LvHHgp+66pHdLfGL3XkMp1ij1
	oHHsQaxyd/+Z7LyPetOgy0uzaDM1Mejh/GWHHhOWkTFkgr2UEviARXibphHUva3oec0QVVG1A7y
	WgzrLFn6yKyKCprd10FBSwGETRXsr/znDs4s+GChdu3m94sgNS9/jbPgFVzhgiLcGFHKjZ5k9Ob
	NpJxMEcdnQSI0lXyDD530C0e0DfU++d9Y3l4G1Yvim8KDvELGYFuQZfK+10rJj2cOhTDcWtdS2O
	d1UX54SFtnXyEr+fT9kqwZ2QnAjVFqkNO/VeObRzRnuWgFoxtGk+yjoIO8wzX4dGK1doHuyIFCK
	FBhiDBmN4WrWuBDttVRFYMnnEDAFD6AI+n8x7+lrFxaHrOUsouthpOAJ8sX5bOU1PGcViyrT5yR
	76xepHEjBSqkR0BYnezl+a5YHGQoDIse5SjtSMfmx1Y45c7GKnFvwWjiFGkxauq6v2ZAZh9xspf
	0u94BHSXJ9dWhdDIBM=
X-Received: by 2002:a05:600c:34ca:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a07615b87mr18212465e9.8.1776683663648;
        Mon, 20 Apr 2026 04:14:23 -0700 (PDT)
Received: from localhost (84-115-213-130.cable.dynamic.surfer.at. [84.115.213.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489393ddd69sm10775525e9.10.2026.04.20.04.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 04:14:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 13:14:01 +0200
Message-Id: <DHXXSDE9V52E.33D6CI1LWMHFP@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Marcel Holtmann"
 <marcel@holtmann.org>, "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
 "Jeff Johnson" <jjohnson@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Balakrishna Godavarthi" <quic_bgodavar@quicinc.com>, "Matthias Kaehlcke"
 <mka@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-bluetooth@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] wifi: ath10k: snoc: support powering on the
 device via pwrseq
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260119-wcn3990-pwrctl-v3-0-948df19f5ec2@oss.qualcomm.com>
 <20260119-wcn3990-pwrctl-v3-3-948df19f5ec2@oss.qualcomm.com>
 <DHUHU7UIT487.139L3KIVRVREU@fairphone.com>
 <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
In-Reply-To: <hdypom3nioc6tk26gh647imy5ykhcjqvknideilnbc2b5p7eo7@hm7fsscleutf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_041427_411316_F4167278 
X-CRM114-Status: GOOD (  14.44  )
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

On Sat Apr 18, 2026 at 9:38 PM CEST, Dmitry Baryshkov wrote:
> On Thu, Apr 16, 2026 at 12:06:09PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> On Mon Jan 19, 2026 at 6:07 PM CET, Dmitry Baryshkov wrote:
>> > The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreadi=
ng
>> > voltages over internal rails. Implement support for using powersequenc=
er
>> > for this family of ATH10k devices in addition to using regulators.
>> >
>> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> > ---
>> >  drivers/net/wireless/ath/ath10k/snoc.c | 53 +++++++++++++++++++++++++=
+++++++--
>> >  drivers/net/wireless/ath/ath10k/snoc.h |  3 ++
>> >  2 files changed, 53 insertions(+), 3 deletions(-)
>> >
>> > +	ar_snoc->pwrseq =3D devm_pwrseq_get(&pdev->dev, "wlan");
>> > +	if (IS_ERR(ar_snoc->pwrseq)) {
>> > +		ret =3D PTR_ERR(ar_snoc->pwrseq);
>> > +		ar_snoc->pwrseq =3D NULL;
>> > +		if (ret !=3D -EPROBE_DEFER)
>> > +			goto err_free_irq;
>>=20
>> I'm fairly sure this is now broken with CONFIG_POWER_SEQUENCING=3Dn sinc=
e
>> then pwrseq_get() is returning ERR_PTR(-ENOSYS) which is not handled
>> here.
>>=20
>> I'm observing my ath10k_snoc is now failing to probe "with error -38"
>> which definitely seems to be related, but I haven't debugged it further
>> yet.
>
> Posted https://patch.msgid.link/20260418-ath10k-snoc-pwrseq-v1-1-832594ba=
3294@oss.qualcomm.com

Thanks Dmitry!


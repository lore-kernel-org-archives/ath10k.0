Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A426C79F87
	for <ath10k@archiver.kernel.org>; Mon,  5 Jan 2026 12:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9yYPx9fhepEWV38D3wDxCo2mcWuQM4sfdGpxfSSBv4=; b=wZ2InGP0J96BR/Si2+hBSp0M8V
	XDmNqDzz7D1ULVzKQf1Xj5fP0OsmpOtarI2GIrlwsahQPt1VEJqWbiwTOnpayezR9BYRuIgnWCnVm
	PrzpGP11Yya51IfoqRJmvxes/yMp4J+rjJBPeBtB8B/dD+y1RCfSgmmRJS1cAdrH0VLOWBCstVfyX
	1hbkW0l1m0Lc8m9qo1od1R9iRVmFuOigIR96q+ANFA5y4aUgAaOALHtFyz7KiPRDmBRLpI65VVCWo
	yb2AUfmXADsHVyhhB0j06qvbOxcXyY+v/U8n7DMl6c8N/jZcVsSPJQng7icPNkIJ75cUhpnYGC9QE
	jgjvfptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjz7-0000000BKcw-3TGq;
	Mon, 05 Jan 2026 12:46:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjz5-0000000BKcJ-12mB
	for ath10k@lists.infradead.org;
	Mon, 05 Jan 2026 12:46:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9970F4437A
	for <ath10k@lists.infradead.org>; Mon,  5 Jan 2026 12:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75EE5C2BCC4
	for <ath10k@lists.infradead.org>; Mon,  5 Jan 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617214;
	bh=O9yYPx9fhepEWV38D3wDxCo2mcWuQM4sfdGpxfSSBv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=APCoVxSL8loQ3A4Rtm17gr4rZaFws8fcuj9FoAIVThldVe1ljB74VQ0EQ6b82jzvU
	 HdaoXUaBshkQlpCGWdpvEapF85k8bbrOPumkfiOpejZlo/+PGxWYxEMIIp4OpSG5TR
	 b4yDRzIpVxRswvKFfrt1kY1na5mob58miG8D4Y8X2p8v0bBJayUzBpONXxEsKVgHwR
	 KTZou4f1LhBsmTCQi3trzxBrpPq23X2o8yCoZX5KxKpmwVfsfgD7i8KqLuY0bj/z+i
	 XVLhXD/HkJPbpYB+OCWEq4mOpe47It7AEGR/tKxh9ooPTRRChiJ0izATE/QyeyM24q
	 d3hH1nS0gCqeQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b97e59520so122870361fa.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 04:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQY0Ny/zspDGMyiS9mysTF8En6RDFGtiC4fcj7vNp4BaAfUxQ/a4vKp8EjM9Zo4jutyqVbW7o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3jB9JAw5vpheneIG6B6xWal4aZQ3RXyDPfTRdtFmihf8kf6ia
	nxGrQ856QBT5LlMrYo2z+WEr1VITEHOnEmAVDQAv55XEnyV4958YOFH6vQqv38riSN1TEaHW7ij
	xRHOydZVtpzfrZRFNjIBYFDp26ZbrgPD9LY9aTB14Gg==
X-Google-Smtp-Source: AGHT+IHhSO4SbYWVc4ny+e082u5A2vt8h7HBHJ419HibXnBd8pf/hT+MPi0IBRnNqK32oCQspxtxsaJkeH9xGMEBuik=
X-Received: by 2002:a2e:a54e:0:b0:372:945c:cdbd with SMTP id
 38308e7fff4ca-381216421a8mr135654281fa.20.1767617212836; Mon, 05 Jan 2026
 04:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-4-1ff4d6028ad5@oss.qualcomm.com>
 <CAMRc=Mey1ScNmosipLFg6mmABjeG2SO2L-pyjwTuOpOYOHZjqg@mail.gmail.com>
 <CAO9ioeU2JjzDwkGQzxc963kakNyZCtaSRAmLu=1kOAMGQeuZRQ@mail.gmail.com>
 <CAMRc=MdCxXg6Hbn_qPVsux2aAfN8cqpG946rS2Sb9J_Cjy0ZQg@mail.gmail.com> <trdxottcptxd5uvgn63oaphemnsk6s2ujc3533abh6pm65iqpi@5ahtn56pff67>
In-Reply-To: <trdxottcptxd5uvgn63oaphemnsk6s2ujc3533abh6pm65iqpi@5ahtn56pff67>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 5 Jan 2026 13:46:40 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfSbzFOYOupbHqxgzzkB9QQWZes9Zwo9tekpgU7XSGNRQ@mail.gmail.com>
X-Gm-Features: AQt7F2q2v_tlBIEqNfDAv4Ihln_deVVE-LJynihU6la9J7DM_qGKBiZSK5K5xSk
Message-ID: <CAMRc=MfSbzFOYOupbHqxgzzkB9QQWZes9Zwo9tekpgU7XSGNRQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] wifi: ath10k: snoc: support powering on the device
 via pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_044655_348851_C7725D74 
X-CRM114-Status: GOOD (  12.17  )
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

On Sat, Jan 3, 2026 at 12:24=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
rite that in a comment, if you think that it makes the code more obvious.
> > >
> >
> > Yes, please make it more descriptive. Ideally I'd like to improve the
> > API to avoid such confusion in the future.
>
> The prolem is that we can't (or I don't see a way to). Power sequencing
> core has no way to distinguish these two cases.
>

I know, it's by design, but if we ever make fw_devlink mandatory for
all types of drivers (there was a discussion about this during LPC),
we may be able to improve this.

And with this comment improved:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart


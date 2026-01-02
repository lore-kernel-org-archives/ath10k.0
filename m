Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68654EEE25C
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZX+vZnqM+JTaGOZAXSO9Ba8hrCSXHZafMX0t5RiEJ8=; b=bp7henh5cFMvWPn8mxDYlzurjp
	CJPG5Ivnhd4vKyKIvWqohFmv8aeaYQ0/MmyfMC0f1ucrcsY8yoKgFsUOv5n8DW4WRijG6sGpeJMA5
	rFTfmnphvjBVoyy0dl9G69qQcIoPlVli6UJhUyXiC96NXEkzcdcxnpHUcSSvSoH+rWAx+c8BYCDVt
	kgYvjGBH9tkiul0skxy4Mqwb0Rlw8v//xkqtm+pzDUPvI8oiJZ7K/azLBSa5rnT+0SoHoPnbsPHtM
	4cMXffPs0muMjiZiJEi1YnwIFc0GfDdzqBs2rTSqf/Dtfg/nKpMqPtEPiuqdWWjpwFypJQLZU23uy
	dxiP/7jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcvW-000000086UG-0CGl;
	Fri, 02 Jan 2026 11:02:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcvU-000000086Tj-0CF7
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 11:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B50544330
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 11:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362A2C2BCB1
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 11:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351755;
	bh=uZX+vZnqM+JTaGOZAXSO9Ba8hrCSXHZafMX0t5RiEJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nWZWoXSUg/0dcfGTBe4DdtAvoT0eNObZVq8Bm5q6nAFOAO3Jf9GLvaG3/tyvONHcV
	 UL6VKT8Mc3kq1Y3TeQ85VKVkIbthH1NipiWQqulO664DssUhRi1qMiVYOSRgIiooRM
	 A5X3t4gKL2BWBX9vRVRnXqRCiawPgrw0PkK6vWXvnA6xzxhjHF8YSZtPS2XOlZXaPp
	 bxOgwkt1BXurY6MFji4KEUvshmlbopIXqW1xZEZ+5Dxe0mcXUQkWFuFP0bMx167/ij
	 nlauE/R3FD87e2JukFXN7U14MXYTmskJuUpMXKIvJRyz9g/GSj/Z4yif2QDCkonJ9e
	 VgYTRveWRm/tg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959105629bso11862473e87.2
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 03:02:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7hgVn1TNWn8nvXOvmPy3Pkjei6H8RzXm4nkguKH2utCMLWW4H+H3E26cJqVzAMDRR0J/QcJM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3W/a3e230C+JMgyaeSZhyGXwiljHX2BLQ31GqKzIlYpJsi3ff
	R/+5DoJmcM2LDnj94hXFRwy/gswKjJ+/D8RolFCMfsAKX/7yZjoAwq6Hq32bITHfxEETRIguyxG
	jwb9tdXsaY8qwk91SYG1bzvSAagcaVZ80adFmazMl5w==
X-Google-Smtp-Source: AGHT+IER5Ned9nJ723yU7Uzu6gtn0g6aZr/0yAwum1t54+3rwVPoOpPAFG9MSH91C23iKYxPGeAWfKbWYG4EzGGJ9jk=
X-Received: by 2002:a2e:ab1b:0:b0:37b:9b28:4282 with SMTP id
 38308e7fff4ca-38121561689mr122757011fa.11.1767351753675; Fri, 02 Jan 2026
 03:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-5-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-5-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 12:02:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=MemZbtrvFSpqvdkTq3jaF-hk999H1iK8GEpn6xfPqX-zg@mail.gmail.com>
X-Gm-Features: AQt7F2onLz_Ggs7LDoVQk2cMiOLUKiEtoEPQjMhArb-R5reMaYZSN3-gdK5tykA
Message-ID: <CAMRc=MemZbtrvFSpqvdkTq3jaF-hk999H1iK8GEpn6xfPqX-zg@mail.gmail.com>
Subject: Re: [PATCH 05/14] power: sequencing: qcom-wcn: add support for WCN39xx
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
X-CRM114-CacheID: sfid-20260102_030236_104853_CC069F11 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 31, 2025 at 12:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement power sequencing support for
> this generation of WCN chips. Unlike later devices, they don't have
> separate enable GPIO lines, letting the chip figure out the necessary
> parts on its own.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Looks good to me, I'll pick it up once the bindings are in next.

Bart


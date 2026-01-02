Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811A8E9410B
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhZD+26yEtIqCTAfVl9iT6ZYu15zs4sSgg8F7ighC/4=; b=Vg2Rz/as6Mi34ycNhLXeMKnpbp
	rO0fbUGAC4rVP8hABsSr1P+LguEQcNHfdR4bSw81f63ykzYlqJwVCUH/2X4VacsuHrH2zcMu0yham
	tJDdn42yaEM+/JRooj4Yb9HV53DM8rParU2HapP1Z4MWwcFcIh4/8uxduPLSL8rOd6zdgLHVTCMub
	boRypfOE3Ih0CH0CMDKVUkm0zMyXsIYAiMIvH6PEs4MJKtOfbdLny4t2MjCmL8f+jt0RLIegNuBd5
	i5eQfoMGL63b1pfeq6sSKqJiM0vvNyx0P31O2K5wH4dPyvb2yD9ywVSzCQWGbqIhnvAS43zuvbxmN
	5w0WQ9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcnP-000000085nj-2Rm2;
	Fri, 02 Jan 2026 10:54:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcnM-000000085nK-2vXB
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:54:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58CE9442B7
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39613C4AF09
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351252;
	bh=mhZD+26yEtIqCTAfVl9iT6ZYu15zs4sSgg8F7ighC/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g0zs/yNTkJOTHppfnCWmNvC+9oYLEz1NkUoEzyweEETzScTG+qABaLmAGD3LujFRI
	 FbrNgAMngh0lQAHpVA7/advd4197jrvMhfmu2mtYfOC/+D7rYHNdo4d4lpm5LFEFFF
	 BRK0ao0800BY41AIpfUE29vPVW/ZWeJy1zh3KklfGOXfCuwPsNEtGODcLsh07EIezo
	 P6D19sO6dTTKLdXL6LcxwjUVVTlm1W7f7mqNtAvigC5/yEhvprMlQUx3E8jRdZllF5
	 MiSkRWQl0PU5Nc8U5dXd+SWPbDP64Fgddl6X/YN3VwMbIVhOIFTcVN4CRHdyinzjsz
	 59al3gVGGPU0w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-595819064cdso18696743e87.0
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:54:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0HW9/bd3kXGD/J/5p1IasICkmODsu/pKikT93mSlZPqfXK7q2Lr+AE/lpx1JYGDLTF9r58P8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVpDcr/gwu3Zw2nANM7LB6gYG6K9ttdtBOUvQ9q7fNyyirzj2K
	edRP7YQ6v/onyfPMMKYvDecPGvjAAG9o6F88rDcoA2MBt4N4AvxB6+zG2nDuFod9mkWc9933slG
	zj20kqTPM0Qu+dUwS3oDJP06Kp7knzvNW/OfJtp7GKw==
X-Google-Smtp-Source: AGHT+IExnKYlDStG06tTP1RibOKTGQuC8yDyUL3e1vDeFIS1fn58mDudw2E+LdXxU8NjOyVmgo6RUbBW+jM7qYg69kE=
X-Received: by 2002:a05:6512:1581:b0:598:e9f9:c03 with SMTP id
 2adb3069b0e04-59a124dcd09mr14271730e87.3.1767351250861; Fri, 02 Jan 2026
 02:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-13-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:53:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf5fC===xFnO6P_Nuf1YnbgHK2DXvDLDand1StyUTKcYQ@mail.gmail.com>
X-Gm-Features: AQt7F2rX1OA_FQ6BWF4RsUO2xhslUW0cJ4Gi7nKzsu0XwbfiBxB-ZebBY9NVVE8
Message-ID: <CAMRc=Mf5fC===xFnO6P_Nuf1YnbgHK2DXvDLDand1StyUTKcYQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
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
X-CRM114-CacheID: sfid-20260102_025412_751089_8983ADBA 
X-CRM114-Status: UNSURE (   9.16  )
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
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


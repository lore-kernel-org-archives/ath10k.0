Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE1E9410B
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MSWLmERer6P1TQXzvhyk6/QJFLaS0pEuKvejes0xqk=; b=1qgQfsI8VDOzwzYhkTZRbAcWHq
	K2C+mJUFQ2lu1Uk4He+ID0gWqiN5JA3AylvC52p5EuvDT2wPmEz6n254ZWifvEyK6RT5EmoXSvd9y
	HHBjmZUo7An2DThPFhh2neE+jV1/ISdtdRWWD8qAsdnQfjwwfLn5xwxmCp5cuNpp6iH4TEfvDAj9+
	PtiWSIMjNEZ1yaCdPPGXFxZ/07V1jc3sh1Unox6HEnxBVtNNxan1usVt5vtqx4e0AUtebaZLvo7mD
	g0vMSmPj6VnXvZqhloOYOlcWXxFLepCET8k0GhZdkE5js7DQUtBE/+WGDqYG5Evfv9kH36xa2YVXq
	ioDhU6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbco8-000000085wA-1FHe;
	Fri, 02 Jan 2026 10:55:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbco5-000000085vl-45dI
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8BB844330
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0E7C2BCB2
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351297;
	bh=2MSWLmERer6P1TQXzvhyk6/QJFLaS0pEuKvejes0xqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J7nEObdIKvT76wNd4LVyS/5yE315iSpvpQax38KXDtMgpEk69W79APryrs/0M5taK
	 U0rfU2I/uLbQfiws6180HnOaL/MCC4uIURj141Tzibsu7W3GTKOvejr7TonqbIrE+f
	 mLgNOHIisIYraHcjgUvdXSeN3cBqs7+jk12BSB0B/k0ZIdDKtPBYOGH4OnKbRaYM3o
	 bO4womAsnx3B5M8r0AoHn7VuXIrFhMtY2xhrW2hMSm20jf+Yqc/y5aHE0agNhxRe1s
	 rJ1dn2mmzWGqd73u2GeWCQ1RbufIrw2bYS55695GkqyZ7SA4vBAI4QvokxjFVU6TTA
	 rTYsYJ9FtCt4A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b30275e69so7116387e87.1
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6OSd5a1nKB9fcF0mRg1SFkeNqKvGb9fzNUkcM9qQdzrFe3SJyw0HCRM3+abYZ5x+SYo9kK1s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcSNcWZsgyMqH07xGQT4Gx/SEkk1aw5x3hmSf9XztYdcfQ6+7P
	Z/VYd1mfCqm0U5tNEY0HIUahFaVcGOwUrTeWhWH9l4RY9q2H6cSvNe498a0+BXt7jCzE0npg0oQ
	eIztoDG/E6n1Dwm/DQfQCuBQ+ZtKDwiTBSPuaFZjE4w==
X-Google-Smtp-Source: AGHT+IE3wuqwhhZBoW5XeciJahkVWmtDvaII43AmrTFI+5uo0TaQV8ir4NrgZCEOO0OAdXxh6N3P1CB6vFYdTkYD2Ug=
X-Received: by 2002:a05:6512:ba3:b0:594:55ab:57ff with SMTP id
 2adb3069b0e04-59a17ddb48amr12071035e87.33.1767351296119; Fri, 02 Jan 2026
 02:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:54:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md4pqhouCc0--Ew-cPDYp3wOj97=vfCPqELJjbqZCd5Ag@mail.gmail.com>
X-Gm-Features: AQt7F2qltvB2UU7GWk8z6M_fSp-9tAVaUHvoANn-Hv2ylsV5N-rqoTXZjvTtmcw
Message-ID: <CAMRc=Md4pqhouCc0--Ew-cPDYp3wOj97=vfCPqELJjbqZCd5Ag@mail.gmail.com>
Subject: Re: [PATCH 01/14] regulator: dt-bindings: qcom,qca6390-pmu: describe
 PMUs on WCN39xx
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
X-CRM114-CacheID: sfid-20260102_025458_030656_692EB570 
X-CRM114-Status: UNSURE (   8.53  )
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
> WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PMU
> (clearly described as such in the documentation). Extend DT schema
> covering other Qualcomm WiFi/BT chips to cover these devices too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


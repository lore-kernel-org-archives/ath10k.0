Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1721CE9410B
	for <ath10k@archiver.kernel.org>; Fri,  2 Jan 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0qONLkVZbPsPnKckIfQkcczqlnRmA9L8RYgFTezUw8=; b=NJF/JLw0bbRMuBwtQYIpPZ6m/p
	PJhXUWZWLA1VbvwG7NZmPyisph2TdXlp0221S0slR9su+864flH4r3IcnSM7QH3uylEa0/7TDtwYN
	y7S/2BgDVnjp30ozSaRdLm+SKtblHgB8/EEXBgVSaRZ87ADGMTwFttr3q1s9E7kKiHSOgxv6D2HW1
	Vsj3FAqNha0TdyfhfQyQmOE7zlEkQPlN+N8VrhMXYXwnznud0/7u3rXbDwOyIJP+reWaDgcNp1+Ls
	wS+7XyALL1uTRYadFQljmxZn8ypoR/G1bvJe/S4RGBNs5yQ+/d4jBz9JFHJFMs3FhedAIlNyUam4i
	LBK7EWtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcTU-000000084ca-3Tl7;
	Fri, 02 Jan 2026 10:33:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcTS-000000084cD-2Nm3
	for ath10k@lists.infradead.org;
	Fri, 02 Jan 2026 10:33:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FEA744252
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755DFC4AF0B
	for <ath10k@lists.infradead.org>; Fri,  2 Jan 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767350017;
	bh=A0qONLkVZbPsPnKckIfQkcczqlnRmA9L8RYgFTezUw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hL1NA0mPb5yOQ9xMUzwBPK5mLRdXyfnjnt8KEVGMu4Jg+WQyfgDy2jPKb8UeGiq44
	 JYkyTKQsGCat2fAZP7gad2Abnp1LZXTyOk7tMxNh9SCe8VLGHZ0fTjGmh8Jpv3FNAy
	 53/YFPER+P3tUvSKzP/B3qUgFv10UwlQFJlHQyUkEL/oc7uldl+wMGA2wSrNKSovp7
	 FlYCK3lwf6ohbtmvVZSkH6dFA3ZcYnfPdHPFFx22YzQUiZkxolLYwAEzqygjOUJYqR
	 jM7aGyVCn1ad0vxDNEOXEgWxgbxNOQBRY9FEQXofbukvXnGoD0X4GCXWyMtOd4I7b+
	 bAxcmsX5SxWOw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59a10df8027so15461910e87.0
        for <ath10k@lists.infradead.org>; Fri, 02 Jan 2026 02:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzqXQX5dFOCiWAfa5nSzuefPvI5KebasuXk1O0H6fDjWi2bN5uSXsr10whXF9vUHKq9DCASDA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPZINKd5VuVMNPmeSpXSVreRn07aLiH8IgV9PkQSb8t3SHs7KU
	2vxUzfyccieND3Aj4oV0tsd9srvFBzEHVSfcN6yXvF/0iFZXuMQzSq7hzROOqDm9j8s/i5CXIit
	8kCRNfyPhnNIhlUKr+YQo34Z15n157/Yjj35Q3seuew==
X-Google-Smtp-Source: AGHT+IFz1P8JUDB3m78xG4JMv2W0HVtLRZ/WsXZNHNG01D4tm87qUYlJcn7VJnG4LRHgTHHzEjfbyGcJwlzlvzauRbA=
X-Received: by 2002:a05:6512:3b0a:b0:595:8350:5824 with SMTP id
 2adb3069b0e04-59a17d18081mr13844896e87.7.1767350015887; Fri, 02 Jan 2026
 02:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:33:24 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mese6Zyn45oZCzv3G6eg3w8Obvwq6TE4-MnXT8w7P6fgw@mail.gmail.com>
X-Gm-Features: AQt7F2qL-yjjeTVapL27TBw0paXaPtMV-m6Ka4LrQJAKTqWS7TV8j8nK3HvZ8xw
Message-ID: <CAMRc=Mese6Zyn45oZCzv3G6eg3w8Obvwq6TE4-MnXT8w7P6fgw@mail.gmail.com>
Subject: Re: [PATCH 11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
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
X-CRM114-CacheID: sfid-20260102_023338_626758_29973D5D 
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
> The onboard WiFi / BT device, WCN3988, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


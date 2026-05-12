Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854E8CD4F21
	for <ath10k@archiver.kernel.org>; Tue, 12 May 2026 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rzsIiqzwJfaosufSqNGzk+UYQb8kC5R+g2N4yMEejs=; b=dLt/nHTqsFQD+u5SWUVUNf9msd
	iEir773cM/9KVqfJyjiG/llPKGTdDYTzAJdlG3qLh5T9mm0JBA52B2hRJt59Q1S8fg8zL5aaWgqx6
	S5KIpyrRZYbO1fkE9ruHQrs6KL8pOqr6gfzxYZ9uiXDq/Pqy/sC7zfV8XXhMb+3pjMkD9tXzdbyWc
	st8DgFpNFtXYPV5FIz+tX2H3ma9helmLkqP4mZsFuNHDohiG4F+O6QO9JNaw6GmMQGyMV3g5rbVO3
	5JWSDLRDUlDl83eCbT1xdzRUvRunSgrE32g57/VuEigqrheAVnGwGaUBXWJLIeffFAqy57iY65mgf
	55I1v6Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtde-00000000KTm-3Mig;
	Tue, 12 May 2026 20:23:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtdd-00000000KTB-02e1
	for ath10k@lists.infradead.org;
	Tue, 12 May 2026 20:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0DAB44342;
	Tue, 12 May 2026 20:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC83C2BCC7;
	Tue, 12 May 2026 20:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617411;
	bh=J1BiYjoLCuq5Sl+Tr6ytUdAEbeIfNy3/RWKvWcOp61Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZgCAiBRgzkAokRXT7UzLtqU5ksvNHGcgsT0kWvMJXRai7jcncVxMo6aepS40hrOY6
	 xEVTbochr+wSgNVfZ3k6wyEValUI7EQRUmgSNAPbSCD1Odq/5Fo1IQbL6We0SNTok1
	 Rf42AXHflneS6wg/m9pP5cg15Vq4oWNnIWprkN6QJLyOxmHJ/IucUi8RPHvF1rAzC6
	 Bg13ls87UMHHZHEOA4ImMS3iuogKY/8yYaOlNZV+FUhlvQvYEuyQJcLWVy8JdFbdRC
	 eOPpsIk4ofCqE8OdyerR/w5N7GdRr1lyxXez0mwykbLfB4+F/0ok+GC7s6knekboN9
	 O3PCGCgzF2TBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Paul Sajna <sajattack@postmarketos.org>,
	David Heidelberg <david@ixit.cz>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/3] ath10k: Introduce a devicetree quirk to skip host cap QMI requests
Date: Tue, 12 May 2026 15:22:43 -0500
Message-ID: <177861739361.1242344.5682040550852862805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
References: <20260407-skip-host-cam-qmi-req-v5-0-dfa8a05c6538@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_132333_069317_19DEE3B7 
X-CRM114-Status: UNSURE (   8.84  )
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


On Tue, 07 Apr 2026 08:43:53 +0200, David Heidelberg wrote:
> This quirk is used so far used on:
>  - LG G7 ThinQ
>  - Xiaomi Poco F1
> 
> I'm resending it after ~ 4 years since initial send due to Snapdragon
> 845 being one of best supported platform for mobile phones running
> Linux, so it would be shame to not have shiny support.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk
      commit: 113343d57607937102d843775560fea0ce5cbe6f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>


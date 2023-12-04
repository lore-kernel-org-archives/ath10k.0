Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69EDC10DCE
	for <ath10k@archiver.kernel.org>; Mon,  4 Dec 2023 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vPFQc+mDKZAwDl3a9RuIoYfq7jxr7ltnKXtb9QgiT8=; b=zfu4JXXQW+zV2ek1y6rovwIbVG
	71E2a6JGnCt5hUvzWBAIWl2VjsEHp+EIlsSEEG6FETtl0vJ+I6WdswlehUT/Hq2uCt76Oe08aRB5/
	A1HY1KinlMMXKaoHb34PJxcWzlVouvLcLrZUBcFK1uGSU1P3X6DlTkk3XKtyd3zocqwLCqCn3k8IJ
	a6uK8EUoJE7ropVOj1Xn/FD3451Rv6BtLXBqh7e+Y8FnC6Cbx/qkM/YzR4JQhYY2Lq+ZZeLQ/RMmz
	EbvcS28X1bT7C8YC4KwZoUazgDYFa2WX5IMZKdvh+dQsB8c06KMXHvbbIK1/YonaJq3EQRnhynWoc
	lM6rYZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA6b-004oQm-0p;
	Mon, 04 Dec 2023 14:39:29 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAA6Y-004oPu-0Q
	for ath10k@lists.infradead.org;
	Mon, 04 Dec 2023 14:39:27 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-db548cd1c45so2525919276.2
        for <ath10k@lists.infradead.org>; Mon, 04 Dec 2023 06:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701700764; x=1702305564; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3vPFQc+mDKZAwDl3a9RuIoYfq7jxr7ltnKXtb9QgiT8=;
        b=wn7F9g28STVSLpXUr2/9/uIeO7/M9fNWhG8c4tLbT+JHE9eo3BSVTWL5BuzFlSq1/g
         0wDeAQESntl/kbby0CuQyycj77P4AnWf3x82lZPZaTvEd7cgHeXttcbtvMbgz6bcnwZs
         bUYZfvo6DRKrwsARcUhVNvVEclZfNJUTfyBH+cvL4TLVmwNFzquthEzX67XjtcrswPGB
         Kr1sx3+iipVFA0C4QRhVyHD0OOoVrUSonxhY9R2t4n11MBoLGmAZoNrvtBcGIcQyNqR4
         SypYJG1rvVascSwruoSb1CPHcoJWl48Myow1h05k3hu8q4GvXGJGP0xrAy7fpqlBvkAd
         OTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700764; x=1702305564;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vPFQc+mDKZAwDl3a9RuIoYfq7jxr7ltnKXtb9QgiT8=;
        b=lyXFSsnzzOQ9xsoV+PXFtItmGgPtBLMdNPWJOIDe4pOQPnFxOTq2aBXKPYjKkrKdB6
         ktvbwgpxW5sjnXoMfheediw+DZHuLCec68HRWWw5lzkao+uFsKhM33ZMvVQg94ojhuLw
         c2LvHViUJRIyHfyTdtV3xUOhWBDXxMJovlTg+y8kJFWopPogOlgKqIbcjsgtcfOWCTI/
         BWOoxTmyuLn6eKAQ/3AQ+AqfN52XSs3PEZbbX5VYEw4XDMYPHSBKjassWswa4DX8em48
         /s2jMOsyHGX4FP1AIXf68CtA9Cj/aKqnvU1bhANboWsCxX7bxhQRy2Fjah6pwj24kkVR
         jBhw==
X-Gm-Message-State: AOJu0YzzTFS1lDOfswLffMf/cN4wTDSy5saYgfN56ZVE+eMzRhzfU4RY
	9qKDjEETnuZ6uYs/Gdv2Yim1VxUydGHHY3Cl+WpSp912Ko3ZGezD
X-Google-Smtp-Source: AGHT+IHtPGS54D6pFaGsyvwhUSPC0a2Yc++83qsDN3tTmWlzGvvVxw2V0RRM8U0i37p67AZYsnh8puqQYgz2033Lo/U=
X-Received: by 2002:a5b:d0d:0:b0:db7:dacf:2f05 with SMTP id
 y13-20020a5b0d0d000000b00db7dacf2f05mr2931377ybp.76.1701700764423; Mon, 04
 Dec 2023 06:39:24 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 16:39:13 +0200
Message-ID: <CAA8EJpp2XeATTauOZJeU92MHTGYj_CK_MTAb0A3uVTO_eGebjA@mail.gmail.com>
Subject: ath10k/ath11k board data
To: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_063926_168620_E3579C1D 
X-CRM114-Status: UNSURE (   2.89  )
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

Hello Kalle,

I just wanted to check whether you have plans to update ath10k /
ath11k board data files. The last update was IIRC 9 months ago.

-- 
With best wishes
Dmitry


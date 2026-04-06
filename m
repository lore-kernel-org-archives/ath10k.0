Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554F4FB5166
	for <ath10k@archiver.kernel.org>; Mon,  6 Apr 2026 22:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL6Otb7fYv9uJRXVmeEi/4cfCYC6ndzuwvxSK1wlzXQ=; b=kw2JWvFyOru4Mcf9dEmZSXVOSY
	yMzRUNRa4Y7iaBa2xYZLQTQQ3BJRLFDq19cX+UCjSiG2zaMS4JYhBV6JvSj/hJcQ2ruTR8nhhrsqp
	/6uGSRJpp1k04aFNrwiW8SZVEt9Ex5SBGw3oiaYjL3rgx9XhVZREccKwySffcnjgDLxzMW0dX+D82
	Xls0Hj0/oszQ9z6/aDJN7DT82Rz8VMet6qgvfSZR6VDW02vimEYHDZG8XtSoFNhDJuOqJls9tB8jP
	HN79fKTTR6GLvAQFfujgUuseqJ2mle0C4yiSfONfMoso4uu53LKgskBPGIJIMAgEj12l/ol8UC3Kc
	qmjmc+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sDw-00000005YzT-0vsQ;
	Mon, 06 Apr 2026 22:15:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9sDt-00000005Yxr-3vfz
	for ath10k@lists.infradead.org;
	Mon, 06 Apr 2026 22:15:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso36138765e9.3
        for <ath10k@lists.infradead.org>; Mon, 06 Apr 2026 15:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513708; x=1776118508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL6Otb7fYv9uJRXVmeEi/4cfCYC6ndzuwvxSK1wlzXQ=;
        b=UfA1Wa24B6RCoIZcbO26QvYA9hxS0xcR/a41I9cVnDFfGiBoqY2PY1S7OD54Pg9CqN
         1JvikpSiERmam6cKqUaN/bj8HNWfJDldRQdYXlRRT/tKdmhbahgb7L7l9mzUCqtNUbd1
         bC9DCYpLCPLfnPBYMRvlfWYGoPUUHAJb4rmSq2LPPzKfntAiM5+RhArDt7xzpBnf9MZC
         d8m9n0Jgp0tQGetwi1K/C58kTOwzV096T/zNlL9se+pprWBklVVdvc/0S55y9FXeJO7i
         XXNcpQ7uO513+8EcxAbIIaD/3/P8UxFfPqNLT7ZLIr5nJWzNE6KPim1p3fdlSMgvNB9Z
         oxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513708; x=1776118508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CL6Otb7fYv9uJRXVmeEi/4cfCYC6ndzuwvxSK1wlzXQ=;
        b=NqYN17asfJ3MsF7kLpfrXV6UiM/48oKvajIlfoWAqQ7U7hQ6RqOm9/cKJkRG9pVAJe
         tr3iwlmeRoRJTeEMFbLKTjYGA9sU3sqhw1EbY6dq8ZwOX/fyZu08feDPBRNE3DAuSRwF
         ewFFoeKxmXIzL2dw77AdHq+QAgXI37cVSRUGWdJ3K2C5R3p6+3ZpKwJCc6gP1KiUPi17
         vHNRlSvATZL7V3HJbT2pdyo27I81IYgKyEMOqw9XOoZo1JuH6TgszqQdJ8axQZxuwYnE
         DltVJ7se+TTJooaS854aBoqoGUzvLDmlifOjl14qSePN62gA3hyMT47iwB0xOcNlqwmq
         Ciew==
X-Gm-Message-State: AOJu0YyPyDpcmB6XGMXDqJ/pEqbWHGIgG5Q9ku2GXXG23Vgh7M7vPsbh
	htP9VN7TkMUdXYOb/1IirxAH8wnQyz4/m4qX8lKOm5p7LKA/Nph5xPKv
X-Gm-Gg: AeBDiev0fzp0Wg+xQ6Q4G1y3ziPANM/4cPrddcltWEFJKGioA7cDeqQmZRaXO+iO9qp
	AARWIfes7Qt2hXkfSMAcx32SVdObgg6nhziokMwolIt0olJuOXLDhB0C7oP6t0w9wkKytXO3FmH
	jl5NZmS8aMPgW9kCLvh8MxQ6MGVrXkGOaoX6+ZYwdrBbqfeAP5Kf3D4ljDXRKUm5Pc1mjxLwiaY
	jNz+GgSW/ivM6d0EEXi65mnnAgDDVYrXnPI8nUij7EAca/BnDGCY6NiWfAB1QQK+uOnNxLYvvq/
	5xQB/Mnz8Slzf65nCMmIwmjva/TGGl0Pkw8MFHhUr/5yhuinvNsRYgob0QJYUOvA9pNy2nvi8ZG
	QGU+OKaZPXSnfJB3ii0Tl6x/A+hFRr7yevNx9i6TfGUMa6z0EG6qQUi/r2vpZtZT0EFYq3a6Lgw
	bTCJFB2BWQnP3Zj6NZ3mmY9wVl1rzeLCwRZgHFEyJoo/5P/SXop8O87WJePloJo0/Y3pfUsO6wk
	JMCco4f0+jrvITcuAVf0Dv938QvY0kw
X-Received: by 2002:a05:600c:3b1e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-488996cd897mr192670285e9.4.1775513707651;
        Mon, 06 Apr 2026 15:15:07 -0700 (PDT)
Received: from dev.fritz.box (p200300de87496f006e2b59fffe4271f6.dip0.t-ipconnect.de. [2003:de:8749:6f00:6e2b:59ff:fe42:71f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a9242d63sm174212345e9.13.2026.04.06.15.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:06 -0700 (PDT)
From: Malte Schababerle <m.schababerle@gmail.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Malte Schababerle <m.schababerle@gmail.com>
Subject: Re: [PATCH] ath10k: skip quiet mode for WCN3990 to prevent firmware crash
Date: Mon,  6 Apr 2026 22:14:05 +0000
Message-Id: <20260406221405.201848-1-m.schababerle@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <323b5222-a105-4701-8342-9131660fe803@oss.qualcomm.com>
References: <323b5222-a105-4701-8342-9131660fe803@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_151509_992443_6B43F260 
X-CRM114-Status: UNSURE (   6.78  )
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

On 3/22/2026, Baochen Qiang wrote:
> Malte, the firmware team needs firmware dump to understand this issue,
> would you be able to help collect it?

Sure. Attaching the full dmesg from a reproducible test run (kernel
without the patch, upstream 6.17, postmarketOS on OnePlus 7T / SM8150).

Firmware: WLAN.HL.3.2.0.c2-00006

The crash triggers deterministically on every boot. Key lines:

  [25.122098] PDM: service 'wlan_process' crash:
               'EX:wlan_process:0x1:WLAN RT:0x2076:PC=0xb0008e20'
  [25.283364] ath10k_snoc 18800000.wifi: firmware crashed!

Full crash sequence repeats across subsequent recovery attempts at the
same PC=0xb0008e20 (see attached dmesg.txt).

Note: I'm running an upstream kernel (6.17) on postmarketOS.
CONFIG_QCOM_RAMDUMP and WCSS coredump tooling are not available here.
If the firmware team needs a full Hexagon register dump, please advise
how to collect it in this environment.

Tested-by: Malte Schababerle <m.schababerle@gmail.com>
  on OnePlus 7T (SM8150/WCN3990), kernel 6.17, FW WLAN.HL.3.2.0.c2-00006


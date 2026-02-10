Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DA4E94626
	for <ath10k@archiver.kernel.org>; Tue, 10 Feb 2026 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GgV1JaYKP5qoidYVClUbj04Uc6QjnqpFw08clZ3TjPs=; b=0+0CWrhtAcJ2v1GxVRzFvvVW5M
	+Z9suBREd73vwfGM0QZKp2+HJbR7CAwoCIgKwL5Ble1suSO8lr2Q+yW/1M6JJOkuF2HEaDlwZ5pti
	OBrC+QALacsWjNgVcd88GXHNwsiluy17/q9UuBzt7wk4qMj4V25UVE9DluURkuyt0bvO5ynZsCIfn
	Bl8BAWnha0eu99yOxpfrfEMIXvOBljz+C/Bszt7yWXX/5tAmSCd8p7kjBiWuQdT3vtX7aOx/SWgp8
	tf94bf9tzZBNueTuMyakjTPnVDsgOoIMPLdMMJOEfZxKVhUX6zlHuD9PrF473LBiCUgv+6nH38Rl9
	1kVn6Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEg-0000000GJRK-1Ozy;
	Tue, 10 Feb 2026 02:12:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEd-0000000GJQc-2JRL
	for ath10k@lists.infradead.org;
	Tue, 10 Feb 2026 02:12:16 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-502a789834fso45973861cf.2
        for <ath10k@lists.infradead.org>; Mon, 09 Feb 2026 18:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689534; x=1771294334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgV1JaYKP5qoidYVClUbj04Uc6QjnqpFw08clZ3TjPs=;
        b=SEVBN8Wcs7XAp+bieW8JDJD6KEOib+TiJA5diKV9vtOPWN/sH0uVem2WPaWITGQCX3
         lr07KkB1XC426RorICj0L5yWhfAGZl48QEdv6yShh59hk1enGzNN/XmY8p4TjTgvWp+a
         6nT9QAr9Cljc6xUXmLqvhF7m5Ge732Ah8bSZU4Zqe3e8LNbEmEXxVddg+w0yjzr/owyf
         tJgAYNaNBFYuBaijVoGHJb1IytsKk89Fs9wiDt77u7lrTke3nNsQ5/rYdqlgkjesuFAw
         zaeqoFYMb6EqXdPyFQ3acHTHcoOtyNaX+vvjviwfQpJheGnCoRvN2thnL7F3QlQrf2yt
         zRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689534; x=1771294334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgV1JaYKP5qoidYVClUbj04Uc6QjnqpFw08clZ3TjPs=;
        b=DDi0nEDaF3vpbhlY6GCk7dM9smLm8DVnhlXUVXsIneukYutMPB6K9LTA0TTkdq1CJu
         2vVdFr+cP28uHhCqHPZOOdeeT3IgIZYYLuYSTruQDWTgvNRQzw5pJJ0w0/HhzYXcMcR0
         5f75JEzC5iMO0630dOPmDdw1g0vE0bICDLL5LH1YkRn2eA1/qVtCMmoNcMCcFvii86vC
         5xMCwIEz6qL1eVOhV8HhSoBJKaNoTV3CO1KfjpBZpggUpZV5LdPBAik+QugQH45K/vlx
         SU/57+WnJQbBIldn+r1OxKY7WVtdv0GI38aACC3T6edcIWCNuJm6TYyCNMiJx7CiukW/
         niCg==
X-Forwarded-Encrypted: i=1; AJvYcCVFCmxomqofu0jwskb2N2YGyehUMtVsosktfa3rUgwfsrX+QdXqmrOqlouIHnKMcqyQ/+JW3rg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbP4LNZyd89r1y5SO1ztJXLLCMtVC56ycnbnNNJh8ricUJtyC
	NIZjovwGxUOEj+ltvJ66ZBHO4WQwW2K5hx6WH2rODrFvfLdRwTAikZ6s
X-Gm-Gg: AZuq6aJvv5/VBFK7ZADA3777iRku3naLtIaT8FLvvWF78N3IXPcBdYQeYOWVu9BmhW3
	qktCM8qhnPvtqYmtbD65NK3zqe/fGpSQt72tV3PlWrDZZDqODGEhgVTegNSgAq5WiXjpM+cUHIC
	MptTnRu+jyzn6+UeRH4BxgA3ARdJZbaWqF8jfCadQAmhTKFjPlwwiljdwr9mn2606K3FPhwmzlD
	9hWCRwg2qBj3PRxGQD7wM3nahhwSf95+/v0Q6wTQr2cY4tOubO1V6kVl2DgkkC00Zrv4Tllg3FJ
	7Ge9rT7Vq29++1YBEYxZFAOnbINFuJgN/MXG4rr2PuUiNBcdqpEbN0MvlSHAdv/2Hx0OBrpmD8N
	LU3eJBT5/BU1ZzijUDQOBblSSsW+djByoxNqMFjDs9M/L94FWybt9/WDYSKsEvPL99UuNcvs149
	Eqw70NCVMkGDNCdwFVd4ALiLTE9lVj2WTGangx1mfaa56OyvBRaI5IJThX4dV85BnpYDXA1IREN
	qQyYFNs24ko+g0=
X-Received: by 2002:ac8:7fd4:0:b0:4ef:d04e:565 with SMTP id d75a77b69052e-50673d6f048mr5993101cf.56.1770689533566;
        Mon, 09 Feb 2026 18:12:13 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8593sm928410085a.36.2026.02.09.18.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:12:13 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 0/2] ath10k wifi fixes
Date: Mon,  9 Feb 2026 21:12:47 -0500
Message-ID: <20260210021249.12132-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_181215_591877_D0E1A8D3 
X-CRM114-Status: UNSURE (   8.19  )
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

These are WiFi fixes that seem to be helpful on SDM670. There is no
ath10k support for SDM670, but some similar SoCs also need these fixes.
This is RFC because there could be better solutions.

On SDM670 with patches, the MPDU has 32 MSDUs when the last one isn't
the last in the A-MSDU.

Richard Acayan (2):
  wifi: ath10k: make in-order rx amsdu buffers persistent
  wifi: ath10k: only wait for response to SET_KEY

 drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
 drivers/net/wireless/ath/ath10k/htt_rx.c | 41 ++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/mac.c    |  8 +++--
 3 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.53.0



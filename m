Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC65D2AB3F
	for <ath10k@archiver.kernel.org>; Tue, 29 Oct 2024 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=thYeJL4yzQqwIknQzMwxVzj4gFmKpuzE/lybvJ1nm9c=; b=WwF4QUna2WFaKI2+6QnpcWGVka
	a77za5kDFFJ3n99pTUx/5HRtQZ7Wcc10ZwmXXMTaGVOQyvjnLU52O1Z7hts21/uraYwUETXExWhLo
	QCSLjpsWHxbZIKC+6Sg9oSqpRhzJXs5l7fT2MG3Ts5Q+hYZVZrRenuWG30umbhHAcrp5GJVDIvS9K
	8Sl6pWySCY9FV8s9HPXHZ6x3ohkjcpVgAo89uoZUE/V0KCC4OtMsImmAtrz8BgqSxt4cZOUbLzbi5
	lKpAaaKv02B/80fNP9ne11Icqb2D1LVpQhGEYZu/MLz+LaT2MJmv0MDWXhuJbQVvkXLc/U8/R/UXr
	YA+Bi4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mIH-0000000EZow-1KNG;
	Tue, 29 Oct 2024 13:29:57 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lpT-0000000EUpC-3VDF
	for ath10k@lists.infradead.org;
	Tue, 29 Oct 2024 13:00:13 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539e63c8678so5488762e87.0
        for <ath10k@lists.infradead.org>; Tue, 29 Oct 2024 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730206808; x=1730811608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thYeJL4yzQqwIknQzMwxVzj4gFmKpuzE/lybvJ1nm9c=;
        b=AkrE2dXW9u0EhyZK4TaZlkjUHFVDL92g5fX2xlScwlQlXRBk4OhpOp0lxnWiHMVHBy
         w7wZNAX8XoWUjbg3Ifu1Cu3hKS4e+SsinM46Z48UV9gtVN6/AffuRW4fJYa6rF6e4lHh
         iouUfoP9hncFKIxMnEkHK/BikIO9cYjvM/2sDoPd4d7iL1/7jZ06Rs40txM5p0he+Ilx
         JbkY2Mw009orMiYTwe5QTd5g2EssVqg01NsjlHYFsdrY2lBjLrlUEArW+tq/qa7I1Qkk
         LtKIRQJuqUvZNVLIM9T3zTOKpcAD1yywO5CaXpmC585Rfl1fYbE1eQ+O8Btbz7xQvXgA
         u76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206809; x=1730811609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thYeJL4yzQqwIknQzMwxVzj4gFmKpuzE/lybvJ1nm9c=;
        b=Y82Fnye+KirzuSYM9wlDN8kuS6XGvjXfok41mnbrLQwz/jFUL0y+/rjj6P3VUbFIgy
         C2+SVfK1tEvkmGJ2AokZIGeWPloJOHz9tGoZQ3OIEBpFT+ZaO5VjPEGNaxRHaBMUSNmG
         jKHbWx+tvRiwQyxKY/5wPiU6cnLqa5NmWWn2UhTAcOkT/GhNCxSLG5+BwAEGSwX7Gl7e
         0b4vSSgZ33OHyikKgPXiEn1LgsK7lieGhGh5uHOgPUHX3bnXznwc47RcyYI6PvWpj9Kk
         kzkTXOLsCZRVy9P/Q+ya3YYsDPxoUhNzOBnaPI3oTqQ2G86mWQycJMTUX9JzboeDMQ4M
         wawA==
X-Forwarded-Encrypted: i=1; AJvYcCWtd6Gei/NREWgHWwjB/U6uf3YPHrSicKX8gBHHjphpLSLyjcOE5+NutCcx6v7bBhik4VV2LjU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeERv14HjIRlCn3H/Z5elegsmI1eC/akjpUxm8dBAmU1LaBpjt
	wR08JSBB9XjmaU10prveNluNa4HPL+Ee7Ry4HJAX6V40P9V+RcBb
X-Google-Smtp-Source: AGHT+IHctOb0nDG34kRvXL8VPLc9QtHTlKvczF+pAJqcInnZNwC0+Wq1zk9q6fUMJnDSnpUsFfYKpw==
X-Received: by 2002:a05:6512:32c7:b0:536:a50a:3c25 with SMTP id 2adb3069b0e04-53b348c1612mr6073864e87.12.1730206808250;
        Tue, 29 Oct 2024 06:00:08 -0700 (PDT)
Received: from localhost.localdomain ([178.219.169.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b48999d30sm214911e87.115.2024.10.29.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:00:07 -0700 (PDT)
From: Dmitry Kandybka <d.kandybka@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Kandybka <d.kandybka@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10/5.15/6.1 0/1] wifi: ath10k: Check return value of ath10k_get_arvif() in ath10k_wmi_event_tdls_peer()
Date: Tue, 29 Oct 2024 15:59:24 +0300
Message-ID: <20241029125929.288059-1-d.kandybka@gmail.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_060011_927339_9EC698D1 
X-CRM114-Status: UNSURE (   7.24  )
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

SVACE reports a potential NULL pointer dereference in 5.10, 5.15 and 6.1
stable releases since the commit 4c9f8d114660 ("ath10k:  enable TDLS
peer inactivity detection") that caused this report was appeared.

The problem has been fixed by the following upstream patch that was adapted
to 5.10, 5.15 and 6.1. All of the changes made to the patch in order to adapt it
are described at the end of commit message.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Peter Kosyh (1):
  wifi: ath10k: Check return value of ath10k_get_arvif() in ath10k_wmi_event_tdls_peer()

 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.43.5


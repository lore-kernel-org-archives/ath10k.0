Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C2ECD342F
	for <ath10k@archiver.kernel.org>; Wed, 12 Nov 2025 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WqAMgt8fgAZyg3N8HJN7zDQfdMLpBQgDtto9MGlNm5A=; b=UiecZNCC2FYo/56g0Zitd588jA
	dmrbC1hULA/il0wzR3B89D9H28Z94jGSp3qx4VgrEUzpLhqPPbUPaRftBYACysMYO4idAAoCQAEIX
	DjuhszMf+zE78Uc38yTeW1F/VqaPQpS39Ch+6vrKnE0ZnYoBJpKHxzMBu6b8+fiLj/ImiSU3W2KSo
	+0w5KccqYSnk9qRJxn6ovohojxRWw6YMqsIu7L5/Pp0dSrwKzgJQX1R16PsPylyOTRJkj6DW07Xer
	umYyg6ouDe6p4S5AmrsPj89EBkXHaBrwBBhdrd+NdoR4jyYk5P8i1Xr41DGv807Q8wLt7q73qDUbM
	8aA7PFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEky-00000009Fyi-3PLX;
	Wed, 12 Nov 2025 17:35:44 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEkw-00000009FyH-1C0N
	for ath10k@lists.infradead.org;
	Wed, 12 Nov 2025 17:35:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so964811b3a.2
        for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 09:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762968941; x=1763573741; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqAMgt8fgAZyg3N8HJN7zDQfdMLpBQgDtto9MGlNm5A=;
        b=SVQpGAi0sc+9w9iRqqLyXqcMN4zdSfr85rxqzXGp5hNnWCQSsM76O9yaGsRd8svu4r
         e+YE+c6dnK7oVqjJWJmC57dSP2XE+7lcyKmmli0bqONz7VR6eZEQLuOc+Tt2j4/ZTzT2
         vS+HgJy78vqZjsX2ZzlSqqLdFJlIHwpbJ2ksmAF0vFVUjizmvaVbJAcDSKTH1ugkbstS
         kRpqCs3CoajR8m1OM3X0SuZfLFEcB5x+9tYcHySdK11molbq6+r7tup6Pbvl2bEsAlxa
         ShiyxZWhsK3MlC/fwUIuadNmW9fQdOaCeSsql86ehnzE/0lV/rthJNtuDn76LOwTh3X/
         7RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968941; x=1763573741;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqAMgt8fgAZyg3N8HJN7zDQfdMLpBQgDtto9MGlNm5A=;
        b=RYbqZL5BOq78MNatU+gT4yz/cfkbZ2QOII1lmz8eNJOZn9DsBhZKAnjxKNrvizW18I
         QoMBRtTzy7op2KtQlY9TTQfhMv5lny7LuuEMoDfToL9Ckg/87Ttn5yTHVXU88c41WIL2
         YrBolxJ8AY8BAI3FDj7m0uwvNxTECzwD4P4ZZXUB3qqPidzhvN4/0c1ULY4zXRHODHO7
         KF5RT203yNgIAz4K7EvUGzijE2qsxJmVeVyg9mr5pugZoPK9e6poSHG7674QTEl85GwZ
         rUiFKFZlSuJZzn7hTexCLHBSsGvjdMnUEIIw3gd9pVjbtZD6MH7nAcxV/zApNwtKp95n
         oxsQ==
X-Gm-Message-State: AOJu0Yzm370Bz9YRhz6J9j/1r2P/JqrbYVsRo4/EvorH0TicxAaeG0V2
	qYLcUz9rr3/yRimFvI/8mWRvogTKNl1o0V6fRdHER/sY8d7nFxmkDWn+gP026exXKurKBaCUcn7
	eZZV2JZVGdU84mUsVg3ymipyftw7FpJp9oQ==
X-Gm-Gg: ASbGncuPvSdv1tooGzOKcThKNDBdakatkxgANoInhTi108u/dDI2BGD5J35wSDjs2Ho
	ZvRSGUY0LBAfEpNUJkQlwyw4pPIKTccK+z5ZAdFqYMkv3Ct1H9Vie25apx0xkg/sDGoBUH+bT9m
	YNfknL7DRiHnDwq7n4DOjGFY1CjmG0h33vv4wDfUOp8HGxmAauXqDh++YZW7X6rF+X/yqpiN3sD
	cDK/3fKPPz0HYpl5krN7eSkVD149kDp02evYcSMbFgVQwzDdOeh+FWgQC0rzwaKU2yklK3Y+tl0
	07wk7Lz1hU1e5E23pbo=
X-Google-Smtp-Source: AGHT+IF8bA/2Sj0p6CySJhITwwPDBTFfXNPM4fvy2KcsIGIfPJWBZW32XRNTIzc8HpTqHaBG+BxddbD3QfyQNu8ROKQ=
X-Received: by 2002:a17:903:244a:b0:295:ac70:10c4 with SMTP id
 d9443c01a7336-2984edddc4cmr47514555ad.47.1762968940878; Wed, 12 Nov 2025
 09:35:40 -0800 (PST)
MIME-Version: 1.0
From: David Wronek <davidwronek@gmail.com>
Date: Wed, 12 Nov 2025 18:35:29 +0100
X-Gm-Features: AWmQ_blEiz2bQQ7-XTkWp3RqiTUisCeoXyRK0B_q1KFQFSCK6C2uwcFmYac64Po
Message-ID: <CAEoe_eX3Rsjgs2_TrL8T-wLosVgYyjQOm3pUbBYt0Rv0do+uJQ@mail.gmail.com>
Subject: SPF Test (ignore me)
To: ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_093542_342060_6EAE472A 
X-CRM114-Status: UNSURE (   2.69  )
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

Hello,

just testing if I can reach this mailing list.

Best regards
David


Return-Path: <SRS0=agdb=PR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0896DC433EF
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 14:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB24F610CB
	for <ath10k@archiver.kernel.org>; Fri, 29 Oct 2021 14:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB24F610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/BokY6Zw89DKB+xQNmyu9DQ557LS1W5l1p/5r9ELM4I=; b=SLSKp4/JOTlR/J
	b5zMeczHOPv4sAfTr0jCvYqvdGq4ZoXF36u4MRaVbgIs6ZTQkT882hfyd8dG3XJ+uF+h1kyEESGoP
	guMu9DWLZ6xUskSyUTh+U+vsrElDzKauB4EmglCFJ9d+GQSdONYPmp1ZfDobCoXdDHyLhWQscZUgj
	7wwsCzY3ad8IdIW1Hwg3+o4DQ2O65LhqUkpje5pvoOpUBEqj+xOFQBiA8QcwzN6ourIWPy2Gi9rwY
	BHFcgmCKnRXFZqgYHMSAjf2JkuqrvKpDR6ZVNdxAuZSBxmt3zIwpTsPIHDBmmqx+KJnTBHN1fGA9K
	rddnstP/DwSePawLUeDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgT6S-00BEI7-Tr; Fri, 29 Oct 2021 14:43:32 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgT6Q-00BEHT-FS
 for ath10k@lists.infradead.org; Fri, 29 Oct 2021 14:43:31 +0000
Received: by mail-il1-x132.google.com with SMTP id y17so10846231ilb.9
 for <ath10k@lists.infradead.org>; Fri, 29 Oct 2021 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=4YRex0QMoogQvADu0trGwP2sJZAcpAWADBavkyvc8Cw=;
 b=HFOmD5Gk7g3DZkauuGxQDngxnGgCsoIIT5DRZzyOEzC46XM5MD99dv9AlbHYiAzHvh
 rNL4BuWaA6H0FZvbkLGsnoiIgsun+C5xNTlylFbOo1jcKjbQX0z37ksD0ccpbnQY+Eiv
 gEkwWUni8xyBKFzdJ/RUq/oHmZHbxuaLDh2JDSPqIc1MBoQ0Aetsu9NARfZthZBtw+/D
 13O9CqDU1DGczfLFCId8rCKlZZHkhnSVV1hvREtlHdZPjnQUWFpYViOl5mDWiSqyUjKt
 XmFhEdbriioC/X3b6/yH7BokwH0qD3ooJtwoPXv+X5YNstyzvQhRb2Hc+2IHIrqmLPWp
 PTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=4YRex0QMoogQvADu0trGwP2sJZAcpAWADBavkyvc8Cw=;
 b=p4SfcPOoprSkDbkX4J4N3eY/Iaeh3x+Ne0mc+YADjq7Tx1bnmjAD36abzQtKYxOctT
 diOp3kJfiSV2pywmr/osxVIzQOfnrXMzxBvp7oQVWnQ6+cIp14D/9FVHEnSA1SvQBWMp
 dX/4wmHW1nLn0MOM05uIvoaDInBifvk66hyQg7d1oszI3k488SPXwBbevw3W252YcZV3
 JExVb9bMmW5AyYUsHoRoaZ3KCD37q7mcLQ2rYr6Ee1ziKpO4V1FhqSB7qNQD8Ue0bzHE
 UAq0/2RVFrGTTZHFg1qzBIEv6pVpIwFjrwmU75EK5ZsW5H1ze3UZy2I3NfcVE1Q+xlKk
 9LjA==
X-Gm-Message-State: AOAM530unxgvReKNa35L0iCAsndPV+f8u3jDZDCoYSMMKYuRB1MHjS2q
 3ccDH+wL2ps7Fvz4eW6F9Gb1eyJI9PDsgXvsrLQWW+rwu7s=
X-Google-Smtp-Source: ABdhPJw4nk2sGbYDOZWEvS/pwvcsfarqPZdTlnhIpeVfXvIkFAaLRYyhOVZWB9rCUJlgoyWnhTBNxzMcn7dJvY+9J6U=
X-Received: by 2002:a92:c54f:: with SMTP id a15mr8182345ilj.266.1635518603940; 
 Fri, 29 Oct 2021 07:43:23 -0700 (PDT)
MIME-Version: 1.0
From: Francesco Magliocca <franciman12@gmail.com>
Date: Fri, 29 Oct 2021 16:43:53 +0200
Message-ID: <CAH4F6uvX=xtTnBDaj1BVHSx_FDSUbpc4TRC2DGTHBmGJSD2oEA@mail.gmail.com>
Subject: Bug in Memory Layout of rx_desc for QCA6174
To: kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_074330_542052_817EEB27 
X-CRM114-Status: GOOD (  10.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi, sorry for the late reply, have had rough times.
Yes I can work on a patch, I'll try to get something working by the
end of the week.

> Heh, I was also about to ask about that as well :) The firmware is
> supposed to handle length differences but clearly it's not.

In fact, I see that the driver notifies the firmware about the offset
of the various fields of the data structure,
so this made me think about the firmware. I still can't figure out
what wifi packet is causing this problem...

Anyways I'll work on a patch abstracting the various representations out.
I just ask that you be a little bit patient with me, because this is
the first time I contribute to the kernel,
so I may be making mistakes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

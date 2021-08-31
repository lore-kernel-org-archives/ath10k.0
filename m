Return-Path: <SRS0=prmI=NW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ECCC432BE
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 14:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDB1E6056B
	for <ath10k@archiver.kernel.org>; Tue, 31 Aug 2021 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDB1E6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GEv6PDt8xLOGaBmb50QvSRJONavT0rcPP9DpT3YJxr0=; b=mSq
	SYhFPcOnQBa6C07mYq6CbKrXAz77msh83xjiOmDPvoYF3no3TwNlWf0K8VVNV41XSLtZSCaIn97ea
	3zmtZcYtV898nxFj7M3G84rDyF3JaR6EDjTCtG7t9cgQ4lQUuFlE5Kfo8eN/Fdo0ZEmgaQhRfAN2Q
	clODb2W0ML+BNtsqu/b1Ad2sbsmnFxlNDwRNEmi3uIF8QpV23f4ecQjCjPIl8+mnUqBt/yCZxswFQ
	dUy7hOwHpduvIvT718kxTGt0WzKkXufBcHzfB8la5anfFpyfoXvyhveTTjS7C+b56LOqvj5SECPm0
	9gKfDrfvakzVUfz56iinsuxVB1sRRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL4Kr-002U4y-41; Tue, 31 Aug 2021 14:01:57 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL4Km-002U1z-4v
 for ath10k@lists.infradead.org; Tue, 31 Aug 2021 14:01:54 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 b5-20020a4ac285000000b0029038344c3dso5679244ooq.8
 for <ath10k@lists.infradead.org>; Tue, 31 Aug 2021 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DY+KFc0slNrncy7AXv0Jz+zNeniPOiUdFGiyEKNpXwM=;
 b=CViJ53YrK+pQpA4JvvgytohwlvDQWL6jQVxfbZF442fzTFBFV1OydaJAaPJvwdY3OT
 Z8rrtdWnilC70ih+cacANfEJfAIUK/+qkbUvFCH4KY9Ky59Sx1uiUckLXiMVFKuP5KMd
 lUwuO4ftp2VNs7MLaz89AsEOum2VmUB0nbFqy+JCjdkvCLG3Jxye3LtFgMhO5g8Ys+UK
 Dp5J2FSY8rPapTprN+lWxYN+qU673DQF6x7Nd3x4DDKDFaEv9i5Gemr7WOp50/SaiJyu
 DWTfxOkQT1zUEPEvj6GaO7aWLgotD2Wt5ZDzpuofQHSY+XY31yGWrnzCLGY63+3jSBU2
 RxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DY+KFc0slNrncy7AXv0Jz+zNeniPOiUdFGiyEKNpXwM=;
 b=Mq0fM31uhnN+XibIsjwfxuylmYXHncEUZU7uODK1YwP0jzbFRDewVCY9YMQkXOwf2M
 W6N733aO+hHgmxyN4JmYqVAcIQ0nbP/WptRfTM73WJrA+sWpFOWX6J/mZYiXeZNGB6b9
 iZJaxkSFTAKhJsa6COrZiC3SWz0jd1LGhkz0FseNcOQ4qeCipKuSlzEsGIqHxYTps8ei
 D8rGMXvkFJR8GokKJRbzJxRxGBEZlyn9pejlr0WTKtt4Tj9qND+5HAi9KzoxP7akW+f6
 KS+/U3tIS9MkJhwNrOfkT3s61m2fcMM/IidKJ6wQtpNVnpik1g/mfZTGUVSz0qm4bb38
 +Jqw==
X-Gm-Message-State: AOAM533XafkUgn3afXrqZ3sKcktORadaWWkD/VoQXe8CKhCO9b3mwrHP
 uo5ExAeMBfRafmLSjC2xBPcukBgO3ViBjFzr422zI138LfM=
X-Google-Smtp-Source: ABdhPJyOhicxEeZIfWmD9CyN3rolu+arItYKccL//q/rrTjXwxvBzZTI49/+GcLBHr6Ltw3ZOcwB7gpw4m/QCjb0UDs=
X-Received: by 2002:a4a:e923:: with SMTP id a3mr14371617ooe.45.1630418510058; 
 Tue, 31 Aug 2021 07:01:50 -0700 (PDT)
MIME-Version: 1.0
From: Sugandh Huthanahally Mohan <sugandhgowda@gmail.com>
Date: Tue, 31 Aug 2021 16:01:39 +0200
Message-ID: <CAD_iCC_MD00B8hBk7uhFnwH3q3qSm_XE7acY2FstXb+HsbUnxA@mail.gmail.com>
Subject: Fine Time Measurement (FTM) support in ath10k
To: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_070152_245278_A24748C6 
X-CRM114-Status: UNSURE (   5.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello All,

We are required to evaluate the Fine Time Measurement protocol (FTM)
in ath drivers for a project. We want to make use of both components
of FTM i.e., Initiator and Responder.

Going by the ath10k drivers, we found implementation for FTM
Responder while we could not find implementation for FTM Initiator.
Could you please let us know if the FTM Initiator implementation was
done and tested as part of ath10k drivers?

Thanks and Regards,
Sugandh Huthanahally Mohan

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

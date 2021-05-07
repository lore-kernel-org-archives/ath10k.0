Return-Path: <SRS0=EMvg=KC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48C9C433B4
	for <ath10k@archiver.kernel.org>; Fri,  7 May 2021 20:57:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D95461401
	for <ath10k@archiver.kernel.org>; Fri,  7 May 2021 20:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D95461401
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dei.unipd.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Message-ID:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2EB1wvzydDblCgUE2z9W9MnHgFYctWvvuJHVjppXVgE=; b=EMCS+WLsP4PmEp
	0Jt7Z3flI2+TFcCaPLKEAgPFo1IW3mwqSKN9Mr1FPhezvx8k67x7WKJFipldr1liy1c2B3m1YcZGl
	AYu2RAApSwiWw2tdp6hzbCZ2JKYQH39WIfSqdHrHZIXDBxyuF6hj+lfVQdv52QPAnKfLsVtP/vkk3
	WZqWLiKRXjaJFhC20qFez4kf9rvsdRFH23Y1NXu3o5vjQAxK1i1Gaxo62QRBGCAJ9tcYqL2uUdZm4
	nn0F0wjzpS9u2l34g7rGYMvtQ7whpVUTKdoOzcfECw/ZJCEEMKHm8upi5scafusHHUOb6+UmKqG8n
	smtar56uQ4RhJlX+ZBPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf7Xk-00839g-7h; Fri, 07 May 2021 20:57:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf7Xh-00838o-D3
 for ath10k@desiato.infradead.org; Fri, 07 May 2021 20:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=MSxx2ufcV7SfqMWz5/vF9Ii54yzutHdrSeSpPzEawfQ=; b=I6PXl89VtOMthcqkkLEPymiZ0m
 zfIoTrMMhobGOJKeopKu58DiQ6nFFC6DKTP/QYzKzIjW8X44QNuXJ1qH0aMng//Ox2O9KjOAL6JZC
 rQycEqCrq4TfSSIRX5RtoYGenWifs5TTgkYbzPU5GammomdKkQaGxaysVUNQbPFtieXY+ShhjXdAG
 B5NPKuzyUwSLlygOkNzyB91rlFk/dHVQiwfSpI7PJTa8lJZMOxVBk3uY8wUTCmhfL+z8ex8P9Pv3+
 I6G7qdm20t2/AT7JqB6o+ofFyQqs/Bi/rB/guyOoHHZjvvllktbZknF14SkTD5LcY+bRk8AS2Y9qv
 rs417eHA==;
Received: from mail1.dei.unipd.it ([147.162.2.111] helo=mail.dei.unipd.it)
 by bombadil.infradead.org with smtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lf7Xe-007BIZ-T4
 for ath10k@lists.infradead.org; Fri, 07 May 2021 20:57:48 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.dei.unipd.it (Postfix) with ESMTP id F2C7D41B31
 for <ath10k@lists.infradead.org>; Fri,  7 May 2021 22:57:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at dei.unipd.it
Received: from mail.dei.unipd.it ([127.0.0.1])
 by localhost (mail.dei.unipd.it [127.0.0.1]) (amavisd-new, port 10024)
 with SMTP id greifqXhBc1a for <ath10k@lists.infradead.org>;
 Fri,  7 May 2021 22:57:45 +0200 (CEST)
Received: from webmail1 (localhost.localdomain [127.0.0.1])
 by mail.dei.unipd.it (Postfix) with ESMTP id 65E2141B2B
 for <ath10k@lists.infradead.org>; Fri,  7 May 2021 22:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.dei.unipd.it 65E2141B2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dei.unipd.it;
 s=_dkim; t=1620421065;
 bh=MSxx2ufcV7SfqMWz5/vF9Ii54yzutHdrSeSpPzEawfQ=;
 h=Date:From:To:Subject:From;
 b=HMaGCyfw9B9O7eeobsQYXJELrPDo/3tXpS4cI4bqSIPDwD++xsqoNM+UKFCkjmFzS
 6Xm/+fOTbli79T+5SlEAZhaDFLpJRgkGfTCostv49If4Sc7U0iYTCzaQfaYFLuLIxG
 gSamYRzxyE+pbBuDIpUkHhwhePJv1PGabd7Y2CiN2cs84kZurANCumbRKIkExGV2W+
 9nRfwGNBvOejempxf8gX+w+Mx64v9aQ9XS5dcdJfypzUvGBzs/hXKpme83nfPwYZec
 naMQLqaONTPQmb2pKKS5UNoh2GNz8r/ZeLC3cAp6TrUOMdWhQRb/DTRH9xMx0Axzn8
 4E76xAzYDSI6A==
Received: from net-93-70-82-4.cust.vodafonedsl.it
 (net-93-70-82-4.cust.vodafonedsl.it [93.70.82.4]) by mail.dei.unipd.it
 (Horde Framework) with HTTPS; Fri, 07 May 2021 22:57:45 +0200
Date: Fri, 07 May 2021 22:57:45 +0200
Message-ID: <20210507225745.Horde.c-Wta2TF0bQU9eZAIVlPzmZ@mail.dei.unipd.it>
From: meneghello@dei.unipd.it
To: ath10k@lists.infradead.org
Subject: Radio module transmit power
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_135747_103989_E01F8206 
X-CRM114-Status: UNSURE (   6.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello everybody,

I am working with a Gateworks GW6200 SBC and I have a problem when  
connecting a Compex WLE1216V5-23 radio module to the SBC through the  
PCIe connector.
The radio module works with ath10k and I am using OpenWRT on the SBC.

The module works correctly and I am able to configure it as an access point.
However, it seems that the transmission power is less than the one we  
set using hostapd.
In fact, placing a receiver at a distance of 10 cm from the access  
point, the power there is -80 dBm.

I was wondering whether this is a hardware problem, and thus I need to  
add a power amplifier, or it is simply related to some registers to be  
properly set for the ath10k firmware.

I hope you can help me solve this issue.
With best regards,
Francesca


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

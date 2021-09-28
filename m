Return-Path: <SRS0=4y1J=OS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB07C433EF
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 14:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CC8561209
	for <ath10k@archiver.kernel.org>; Tue, 28 Sep 2021 14:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CC8561209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC0V/q2gKRtH/eMiF5uMLz2gVtoLp8bW8kOjj61nGg0=; b=lAcRHTmVVf1p3B
	Ywmvc4rjIeoLdvw6DRCrXhtx2iVsxxvAnaiW5ZyOvhVly8kNZsFxd5KxuZPRQC1qU91HMjp3uKfbK
	1TR1xAZksqHvH7/bJgnU5sHKBQDXawQc7nkpvMBBqJJIuBIBxi0vhqv6WjJXnoZjl+Y7p4pFxC2Ty
	1TqagK7biMTjdzfKj4SAgcNrSne/gyKjM6/YlsQdv8lMFtRIJCDxZ5b0Hjrn0mRNNlhiuFZ4GaRFr
	BIAZucjE48tRXikmg6To/G3KBUaOOlVNu9pua4QC5EF/360eRx6mpO3oeW5KrzOL1ZUgAx10sCVg2
	SEHkUOORTh7VMf90tmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVECt-007cQv-1o; Tue, 28 Sep 2021 14:35:43 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVECc-007cMY-C7
 for ath10k@lists.infradead.org; Tue, 28 Sep 2021 14:35:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632839733; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=hdFZdGJQlz//wKTa56GRTPUzh1HO1dzfR9oJDIq1l44=;
 b=Cy8kAMSdNk6hG70njeECwfg0htYaHt1ZAgnWHNuz29j8tUqnyS2oTQ2O+A+mF+tnng8JdDER
 1OTjpzV7BVmAkAmQ+Jcagkjq0Ke79JD0PqTNMDtzUPolDVlh+CDB2hgZgYHrjNHpejXL3JHN
 UH2ortfzAKdB5eo5TLJSWR9l0TE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615328053cc3a01f26e5d473 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 14:34:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C801DC43460; Tue, 28 Sep 2021 14:34:44 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81C65C4338F;
 Tue, 28 Sep 2021 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 81C65C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: high latency fixes for beacon buffer
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210818232627.2040121-1-festevam@denx.de>
References: <20210818232627.2040121-1-festevam@denx.de>
To: Fabio Estevam <festevam@denx.de>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, hch@lst.de,
 erik.stromdahl@gmail.com, peter.oh@eero.com, aspriel@gmail.com,
 marex@denx.de, alagusankar@silex-india.com, Fabio Estevam <festevam@denx.de>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210928143444.C801DC43460@smtp.codeaurora.org>
Date: Tue, 28 Sep 2021 14:34:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_073534_214952_CF4785A4 
X-CRM114-Status: UNSURE (   8.30  )
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

Fabio Estevam <festevam@denx.de> wrote:

> Beacon buffer for high latency devices does not use DMA. other similar
> buffer allocation methods in the driver have already been modified for
> high latency path. Fix the beacon buffer allocation left out in the
> earlier high latency changes.
> 
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> [fabio: adapt it to use ar->bus_param.dev_type ]
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e263bdab9c0e ath10k: high latency fixes for beacon buffer

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210818232627.2040121-1-festevam@denx.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

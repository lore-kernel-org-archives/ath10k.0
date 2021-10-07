Return-Path: <SRS0=axEN=O3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D1DC433F5
	for <ath10k@archiver.kernel.org>; Thu,  7 Oct 2021 05:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9B8360FC3
	for <ath10k@archiver.kernel.org>; Thu,  7 Oct 2021 05:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9B8360FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWF2aZ5q4meChigWpvS2HBTlGI+47d4eK14GXWaWJ2M=; b=tkj1zAf/PS+rDt
	dBLVETWnKOqaDbn0c5q3o/ObnecAm2RWp1zq9poEg0MVUyT/gpNyAurodci+TP9aHuzTKANYNDcc3
	oqFqv9kRL02SakIw2+qRVoZ6rB/PBCifjfnGszY9yawAFJaop0RqyZ3dwnOW550QSGYBgJgPzVzaX
	nyFFFMQXdSLWulRu+INbwHKXMEurXq4P/3nze1QDGtxw1J33GXzbLgACzttgy15rQjbNJGSBUon1s
	JaGFQybwsMwJEh6JjGX3MEI4LL6avUch5Uk254Wq245E+tqThII0jAqR8w+0WWYG9N565cHbX+F08
	NYGcLx7yYI+V/IJSl7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYM0o-00GC8U-LV; Thu, 07 Oct 2021 05:32:10 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYM0l-00GC7x-QP
 for ath10k@lists.infradead.org; Thu, 07 Oct 2021 05:32:09 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633584727; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=YEWZb9G2+ZymlJEpKYBfqYpSz97eXyWi3y2x/8pv+w0=;
 b=VOzeMHnFfIPxQ7HfTgB5CxS3pV6QcYUcpLchX4G1l2I5QARD4hUGCGtfItQbpKzp2g/4IB5z
 3Ru+zaC/Cy0kWUl7s/pgqPL6ffe3QWcpiTac7KsPGdismJ+V/aK+rPRbLI2fpW8u99HTTP44
 Q9ue8OhLr687VN28gVl997vRuSc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615e865403355859c8d39dd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 05:32:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A31CC4360D; Thu,  7 Oct 2021 05:32:04 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3447C4360C;
 Thu,  7 Oct 2021 05:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C3447C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 10/15] ath10k: add support for pwrseq sequencing
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-11-dmitry.baryshkov@linaro.org>
Date: Thu, 07 Oct 2021 08:31:57 +0300
In-Reply-To: <20211006035407.1147909-11-dmitry.baryshkov@linaro.org> (Dmitry
 Baryshkov's message of "Wed, 6 Oct 2021 06:54:02 +0300")
Message-ID: <87a6jle6ya.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_223207_927428_AD37C208 
X-CRM114-Status: GOOD (  12.76  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Power sequencing for Qualcomm WiFi+BT chipsets are being reworked to use
> pwrseq rather than individually handling all the regulators. Add support
> for pwrseq to ath10k SNOC driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please include a Tested-on tag so that it's documented on what hardware
and firmware combination you tested this:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag

Otherwise looks ok to me. I assume this is going via some another tree
than my ath tree:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

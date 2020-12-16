Return-Path: <SRS0=ZqSV=FU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F56C4361B
	for <ath10k@archiver.kernel.org>; Wed, 16 Dec 2020 11:36:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C36C323343
	for <ath10k@archiver.kernel.org>; Wed, 16 Dec 2020 11:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C36C323343
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lt+Ieb4lXjMORKxR8Sh18ipAqFYkpRO14Nxkt4EdNxE=; b=Lw1biUydgT56X6oEOp2mbeMhv
	B+cd9TkJxtY2YMMBMRro2sYPSwkP4YiSIF/jSvCChwKUGz1fcxz8hdDIVvJp4yawVe4v9XJEYQxkI
	RUCz6Za++Lrl/x36uLJiB8ZRzdZEOwAufYm6SGhL/EAknXRWSjmPT1wMQ0QrdktA4CsyVWX6rR5Gw
	zeOksOLR9eIlGHGGUFSwvRLb8ISJv1gA004T0BY2QIBwr1z7s5C8mS500StNuOVKio0csNmz4ug+Y
	yscw61C/UIz95ZQ5EWE8yL5F8cjhN3w9xQ1BiGNf7hUNEQ/UhJ+nQmqxyFJYyRVr18fbUnXoaC5Y2
	JIPudN1TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpV5p-0005Ns-8b; Wed, 16 Dec 2020 11:35:41 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpV5j-0005Lt-7d
 for ath10k@lists.infradead.org; Wed, 16 Dec 2020 11:35:37 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608118534; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=hHQtI9K32e1pR5DjxtBhpvWTX4yp5Gz5VV4ep6xNEao=;
 b=Ya6xVjc3SyfL0WxaE2Vwf3KqF8pMIdiVQfWwTX+wAnuh+Y5LSiMwN/OBU4hURHcXQuqwZ5GO
 28LORparhqVFNhmEQZtJGt0ISUTMumC4R7AYrOrytt7HtI2f6o9AofjUlHYWwY5zWTF1b7+R
 BEZ/jehlSpVjLuMjdtie7OhpYcA=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd9f1040564dfefcd663ed7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 11:35:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9BBA8C433C6; Wed, 16 Dec 2020 11:35:31 +0000 (UTC)
Received: from Pillair (unknown [137.97.117.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: pillair)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CA757C433CA;
 Wed, 16 Dec 2020 11:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA757C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=pillair@codeaurora.org
From: "Rakesh Pillai" <pillair@codeaurora.org>
To: "'Ben Greear'" <greearb@candelatech.com>,
 "'Youghandhar Chintala'" <youghand@codeaurora.org>,
 <johannes@sipsolutions.net>, <ath10k@lists.infradead.org>
References: <20201215172113.5038-1-youghand@codeaurora.org>
 <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
In-Reply-To: <18dfa52b-5edd-f737-49c9-f532c1c10ba2@candelatech.com>
Subject: RE: [PATCH 0/3] mac80211: Trigger disconnect for STA during recovery
Date: Wed, 16 Dec 2020 17:05:22 +0530
Message-ID: <001901d6d39f$8eecc230$acc64690$@codeaurora.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLNiuGMY1lcuX+3xoocSa3lALz5vQHQNXuRp/2kY0A=
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_063535_391398_85449F14 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: kuabhs@chromium.org, netdev@vger.kernel.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@chromium.org, kuba@kernel.org, davem@davemloft.net,
 kvalo@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


> From: Ben Greear <greearb@candelatech.com>
> 
> On 12/15/20 9:21 AM, Youghandhar Chintala wrote:
> > From: Rakesh Pillai <pillair@codeaurora.org>
> >
> > Currently in case of target hardware restart ,we just reconfig and
> > re-enable the security keys and enable the network queues to start
> > data traffic back from where it was interrupted.
> 
> Are there any known mac80211 radios/drivers that *can* support seamless
> restarts?
> 
> If not, then just could always enable this feature in mac80211?

I am not aware of any mac80211 target which can restart in a seamless manner.
Hence I chose to keep this optional and driver can expose this flag (if needed) based on the hardware capability.

Thanks,
Rakesh Pillai.


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

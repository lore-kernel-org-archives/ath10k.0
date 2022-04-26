Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900E2C433F5
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ta3D6qWsH8ftJPKqmROM8FYr798yakuEtzCWEktw/4o=; b=sPEv7yHXXOnhe9
	PGcT2Wx3yH4X4//cvVoxYJW4B/DUVbQ6mr2hGlPfW//Ytij7hP0pluy1bb0FWv9Zp4ngSP4HIF+ZE
	kHMTy2NGkmxEstHO/5/AIx4qz1mpcah/2/5BBoyVg7lw71jypopjxg8IDRKdClR4PzT70Ypt0RjWi
	ZHb3Pe+KK/Hp8Zt50GNQeQT58T4yo7p/Kb4ATXPj8EqdNgFdsFz6F3qrHN3i3LYwyKpot8pjbv5eA
	R81c7O5sBLUjh0PZDEupU7X8KSmynSo7XHyTb1Kbn7UiotY7OLuvPrBYGW2svJVRdPj8mPhnULU7W
	u1mwQwUXwkuAqDYlwlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNyP-00FKj6-Qv; Tue, 26 Apr 2022 16:23:33 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNyN-00FKiB-1v
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 16:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650990211; x=1682526211;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=PxGFIsnivia5pwhtxt5J1B5lDPKd5/rsAL1tVlJO14g=;
 b=vobUhud/mHWeMstNHG4adFLo7tXJDQw8siPhtMDSnrrogpKOMqoZBsXM
 OhaqbxCQCMHUcYIbNgqgazRLxuCLz+cJgbK4wsSf6SRiInT97PqvF8Fhi
 bP/0wdN4RXvFzNNiF8N+l7mzRS3niU7eHi1vie7rx3OcWeee/hMCCvg9o I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 26 Apr 2022 09:23:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:23:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 09:23:27 -0700
Received: from [10.110.124.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 09:23:26 -0700
Message-ID: <71858a31-4667-b358-194c-95a2ffc0c593@quicinc.com>
Date: Tue, 26 Apr 2022 09:23:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Abhishek Kumar <kuabhs@chromium.org>, <kvalo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <briannorris@chromium.org>, <ath10k@lists.infradead.org>,
 <netdev@vger.kernel.org>, Wen Gong <quic_wgong@quicinc.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
 <f429219f-e5e5-6107-473f-a4566f4e7ee1@quicinc.com>
In-Reply-To: <f429219f-e5e5-6107-473f-a4566f4e7ee1@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_092331_172560_A4D9AD5E 
X-CRM114-Status: UNSURE (   2.68  )
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

(sorry for the 2nd message with no content -- operator error)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

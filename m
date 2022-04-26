Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DCDC433EF
	for <ath10k@archiver.kernel.org>; Tue, 26 Apr 2022 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y81gI98pLFBIgg49zZqbCXehfcQORy3nPCDO9oixZ48=; b=Mq5x97hhS8UhBH
	8dqy8oxgOQ+1qgqoSE9p8mdfZe2KWQ67uOpKb1WorqLSFUKx0+9ye6msRoLXyeUdCTIyRs1BzAUty
	gPmsfGztbizc8odfqvrW66GvG0lBd4s20tLZxmixm1NvitfPYZwsNTCc8kgvhAB7E3b18oeqtUyVy
	ctDNW/THwwgw+SgEipWcQkKabppb+jY9KsVAe3zDNWjZ1WYTfkUNNdh2D+W5lXFRKnYNRJwie1PeZ
	8de9doKW/z877IGClCjKup1K9sY3rYoD2FoqzoGbdbWi9duZVu9/LdeozFfMnLZ3mrz5YXSEZIX5Q
	4IfIQM08FoEmB0XwWxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNtb-00FJx8-Un; Tue, 26 Apr 2022 16:18:35 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNtY-00FJva-Ts
 for ath10k@lists.infradead.org; Tue, 26 Apr 2022 16:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650989912; x=1682525912;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gUmABsSC1Fd0voObnCcE8bMxLkUuCbRfY1PtH5k9NoA=;
 b=Er34yCm6kR/o3R50PZQGF/NUQ1ZXdEQdnMcVo8pthYy6iAphOsyz1wuW
 UoX2vW3GySep/v0ZBUXWPuoUpL/fFWXXnfFt5wOpfvKLJrx7Uk15dKheH
 OR9tzOEnJcMYve5v7LVxW2YbhNU/58gugNS+bMKXk/5ORdq+N2Um1mKGq w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 26 Apr 2022 09:18:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 09:18:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 09:18:27 -0700
Received: from [10.110.124.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 09:18:26 -0700
Message-ID: <abb99890-6102-bb95-7075-8cc50a2d2627@quicinc.com>
Date: Tue, 26 Apr 2022 09:18:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath10k: skip ath10k_halt during suspend for driver state
 RESTARTING
Content-Language: en-US
To: Abhishek Kumar <kuabhs@chromium.org>, <kvalo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <briannorris@chromium.org>, <ath10k@lists.infradead.org>,
 <netdev@vger.kernel.org>, Wen Gong <quic_wgong@quicinc.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
References: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220425021442.1.I650b809482e1af8d0156ed88b5dc2677a0711d46@changeid>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_091833_023211_391EF95E 
X-CRM114-Status: UNSURE (   2.98  )
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

On 4/24/2022 7:15 PM, Abhishek Kumar wrote:
[...snip...]
> 
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>

Your S-O-B should be last?

> Co-developed-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

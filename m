Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD0C87FCA
	for <ath10k@archiver.kernel.org>; Thu,  7 Aug 2025 22:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifGUVYPRQoynFHz12tbMQrqd7GTUJ+TmyWzhPo9UjYs=; b=4Xhh5MqVym6fU1oOwe4IXz8b5X
	HDIpPSSBwM6crJcwhp4hbQUKhI1c1rbOPb+DB279ocagpWGgi64jqv9gA9xoqZh7TDGoRI1zbKzPr
	ERYsIGKBvEMRthmcuFvwO62SQAI1kobXt85Ctrblh68JZ/DtPMsrsofXjDOBjUGCbIZPyp1jjroAQ
	tTqginJdffVYI6xMLrzKmoU6LnPQaMFuNn0FnjS4ZvwBUO2Ssp1zUzB2SgK462g+yYpvGSYjKbSoy
	8ZgUkHPp67N85jEbpMStkPWUooe7ckhtQdXEJubzkinnbJNNLAg1mboufTV7tdLSkdyXBZViahUqG
	/EIHz84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8if-00000001bMK-0B67;
	Thu, 07 Aug 2025 22:04:17 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8ic-00000001bLw-2n2h
	for ath10k@lists.infradead.org;
	Thu, 07 Aug 2025 22:04:15 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-32128c1bf32so2082866a91.2
        for <ath10k@lists.infradead.org>; Thu, 07 Aug 2025 15:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754604254; x=1755209054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ifGUVYPRQoynFHz12tbMQrqd7GTUJ+TmyWzhPo9UjYs=;
        b=gSJS5bqJ0qdfhcu2hw/IqFXLzL7En0G3rhFngecvgtzt8jTjI9snnJOvOsT/5//o2x
         Z+Q0bcs3kumTdjScJF97pvf/AhYj8aBbhl3IuxaFAWY8rbTzTf8zJc+u55Tbz7FHwiqi
         6ozG3vVp4071uRY85H4035WxVtn3CDT/WuA5qL6vxNQ8mL4Mc3BACyd/QRffc0uC+OO0
         np+1wNXXlpgbPyfnscOBHADJTyt3TRGW6qJMooyXhBmy2x5mkn/uiRscSxQyYnbtdpyZ
         DaUa/Uddqv5ki+I99+HGGu1Ay+751CusaUmYED0zoLEoenwnnmyXFDqWcMsJUoB0pp76
         XacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754604254; x=1755209054;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ifGUVYPRQoynFHz12tbMQrqd7GTUJ+TmyWzhPo9UjYs=;
        b=TvcxDhbLLnSruWn8Cj5fZJfR6iXTJg33Molai/JN+H+rBhtJk0URkCscVz/bzC86en
         OIBx/WSnReu8oxj5cfbKrJRqXL6T3cxD2FAJo7QK6km8NmHfCuYs+/2+qCumvKOPghbH
         Qg8tVxeEgL48yc3awAEndcqL4feGJ8r5x+YlVta6Kleop+DcFzNyhc+N3PQY2RQpPZOR
         g55xaB0ct9hVgR4AsQwPewrIwsy62Z/DQDpAUMTvcZyUwnICBOz93HGr+VgvNUEYhLgS
         iMOMpS4q5SeyZAkmnxmHsrPkANQTl5X3MoopIY3fw7pHHSMyRkyx2QCVyHYjT+pY5K6H
         yzIg==
X-Forwarded-Encrypted: i=1; AJvYcCX86cuR4FW3+lVhCIssp14EzFRjhD6udZ3UTh/rVoQdwE6hMGnfl9+iwx2WAJ/yk8DF1BgIfr8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxumJrxQM9HtRdFtC7+x+Xrf5nP3BLEsmc05mAsCrRO4XJi9b2/
	4VoxfDIXmRDi5nmOjRMrLL/A8Sq292moclvBAxnzhJt4dB3nPevYBUeW
X-Gm-Gg: ASbGncvmikXG1PABWC/jxYoCCN5l5Z9U0RdWPTF2LRepZdV4BgEOwB+f5t96taDuRvu
	TyNt3j+SOCGyURIWANwCPjLvcCzHQ+BdXvZCnbl86XnBghBIy8aRQKJAJTihrGljwn8iRLZkjvx
	IO0ZxlmxP5Dk/mFJB+9VQLfXunL2V15tkinbOTxxa4p910oNs6rhB5DOuQnOfk0L2ehDGrVsWFW
	+Wp3X0PlaLZD3cCDm3qxJvMhUQ+n5gxds2CsE0EWlRGAthupyRMXpbYeG+uehqaOfmVBIg2nIqq
	kPu3kKth8Pe11rP0q8q/3f1Clkht7TZpvDmchjuyoF48KF9ZrakKFyEXfQxNCYW2S2YljS8MzdB
	WRiwzJwHMji3zyLl6YB40RNtDb1mrAWxMJ9V3CxfNGYPXM+1l
X-Google-Smtp-Source: AGHT+IGGPVIaalaGEXnZpDCIqt2E6rbMu+NvzCNol0RFWT2Q1ikoELaGZ/qbA2/kE8Zg2b7t2+yCpA==
X-Received: by 2002:a17:90b:2ccc:b0:31f:484f:7075 with SMTP id 98e67ed59e1d1-32183e6d968mr799203a91.26.1754604253711;
        Thu, 07 Aug 2025 15:04:13 -0700 (PDT)
Received: from [127.0.0.1] ([115.187.48.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccead450sm18919860b3a.54.2025.08.07.15.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 15:04:13 -0700 (PDT)
Date: Fri, 08 Aug 2025 03:34:00 +0530
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
 ath10k@lists.infradead.org
Subject: Re: Packet loss with QCA9377 (ath10k) on ASUS VivoBook E410KA
User-Agent: Thunderbird for Android
In-Reply-To: <l3iebypcyxpqxod5os3mn6465cwdlbnmlkbjnx3vu5bzyb4vhl@3dxnam2a7c2t>
References: <20250806204018.GA14933@bhelgaas> <BBAB0136-BB7C-4D59-B29D-2F35FC29D7AC@gmail.com> <l3iebypcyxpqxod5os3mn6465cwdlbnmlkbjnx3vu5bzyb4vhl@3dxnam2a7c2t>
Message-ID: <176B76BC-6801-4C3F-A774-9611B43ED4AF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_150414_706552_F1257A05 
X-CRM114-Status: UNSURE (   3.30  )
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

Thanks, I will update you guys as soon as I get the logs=2E


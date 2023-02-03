Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FEC61DA4
	for <ath10k@archiver.kernel.org>; Fri,  3 Feb 2023 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzcmX/9NmsLpy2PrJH41FgUwX1CMZ7sk353fF1rGC4k=; b=SuAHgElKeegwlu
	0mYRmtTCG5Rf7ECQIeQmEWc/jKqz1WCBLCOPY7CfOh+ozrhta+lRdKw+znevUwJJb4cff685iIvdj
	+x1nRb1HJTgN1y3QsJD8GAVOcRK0Xgz3vhB8NsrENwrsWNtNorsMQEGHlyt6vkppM8zQibWPp3qo2
	E6EPdiKDPHtvBHka/pDvlLGRBtVGd7+rqeYS1NDuZ2oVux3zaifY3xAJq89kQna+w1LW4rqsuCv1e
	S6FqVFugYcjaIy1wUWK4t3ppJEvLvVcU5ua6CycKcDa4FN8YMqbXuILxrobNWdFkX38SaYFyaJxDf
	msdyczbRyPG7lOB3DTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNzeu-0033VQ-JJ; Fri, 03 Feb 2023 17:15:32 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNzer-0033Tx-Nn
	for ath10k@lists.infradead.org; Fri, 03 Feb 2023 17:15:31 +0000
Received: (qmail 32682 invoked from network); 3 Feb 2023 17:15:23 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 3 Feb 2023 17:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=message-id
	:date:mime-version:from:subject:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding; s=2018; bh=ggl3wDMwxRQu
	E7GebVROC5jrBccyl7QBS7ttNF5Pvpw=; b=gatIzgkuBCJQroRliw1BWu3TZp9O
	OxjfdQrcQAHe1RnPwFsdeSJnS2Lxd/nOYCSEiRSYhJZXQ75NUBWIuLoBP5Yp8Xc8
	VzIuaceWQXZ+fBdmASec8xWtIJdHt6VDh3x6cxqcFGl35JqWxFykyftEXbfkL26G
	T2qlrphp8381Qq0=
Received: (qmail 90973 invoked from network); 3 Feb 2023 17:15:22 -0000
Received: by simscan 1.4.0 ppid: 90589, pid: 90886, t: 1.2471s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 3 Feb 2023 17:15:21 -0000
Message-ID: <aef1d48b-cfc2-1a5d-d26c-deae85875d43@openmail.cc>
Date: Sat, 4 Feb 2023 01:15:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: equu@openmail.cc
Subject: Re: [PATCH v5 3/3] wifi: ath10k: only load compatible DT cal data
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: lpieralisi@kernel.org, toke@toke.dk, kvalo@kernel.org,
 linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
 <20230203104822.361415-1-equu@openmail.cc>
 <20230203104822.361415-4-equu@openmail.cc>
 <CAL_JsqKq1Yv+svKMS3R=TmDui1VJEjinoPFoDAAgr8tBbV1aSQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKq1Yv+svKMS3R=TmDui1VJEjinoPFoDAAgr8tBbV1aSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_091530_147462_327CD1BC 
X-CRM114-Status: UNSURE (   8.20  )
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

> I think this can be done a bit cleaner and like other drivers. I see 2 options.
> The first way is use VID/PID compatible strings and don't set the
> of_node pointer if there is a mismatch.
Where should I do this? In pci_set_of_node() from drivers/pci/of.c?
> Upon further thought, why can't you decide all this just on PCI
> VID/PID? The giant switch statement in ath10k_pci_probe() could all
> just be struct of driver_data from the PCI match table.

I cannot decide all this just on PCI VID/PID because PCI VID/PID cannot tell whether calibration data are stored in the device (like most expansion cards) or not (for example, in an NVRAM cell referenced by the device tree).


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

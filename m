Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7181FC4332F
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 03:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VX2qesYAZfXJAEHC0fEupUlJ1cENvrUNgaTZ8lq7I6Y=; b=qKi3jsy3jVLzAz
	XtP5Npp95UV/CHZ62gWj1uO5UOD1DNvqiIYnAB3s9/6MfZ3ezjrYZ9BZEev57OYEZbPNuAmL94aZm
	Bm11kQ1QegBXYbjjpVRC6YCQUu6M6wn3ZW4lxv0GvJjtmqCPBDsrajJ0PvXVPyll1RUBiXZqB9pn5
	faZXqt7PZfXmvxU0uIOI/N8sd8cNBsl5IrCjgFWEUUDtBAo0xfU0BRdOBz8RAcSKze6iVIYnHdrkF
	V3O2DnGXe6XwW02Tevzkwy4BqM2YvK66kWXDanclyrZpyUzoJ/8UvNBsKfwEpnwI3Q6PRPtPf0clN
	hWdJ1aUyeSYC7PWVuFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osyCC-002DsA-5t; Thu, 10 Nov 2022 03:25:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osyCA-002DrX-2M
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 03:25:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AC1F4B82083;
	Thu, 10 Nov 2022 03:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63E7C433D6;
	Thu, 10 Nov 2022 03:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668050734;
	bh=Fe/+mlw2GT+auwCFctSRJ7rue+T//tu/7QyWdoqsU8k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KgrTMmT5DEZa/jSJwgo+OVcuSILF5cfiijOXmDVGMDA1WO3rHKOnz5jwqDET9eNpr
	 Y6JtDJqxvImb7YdMZUAsW82fU2kX/Mt/A1eBzWedX5UQFshq53ZG3JtHT2zYo1cRXl
	 789WMm0knTN70viC3oAOvVwLeYky/Y2PwkHrsBrb103lBxQKLu4DAuXTKJ35l3EowW
	 VJotD+gTEwCKVTYu/F6Iny/9ipAJ1yE04wPul68x7Z/70YxrUBxhr8JLmwY4inTwOq
	 gxbWIeWWwBVoPvqK3IO/0+ifmQEYwwM8YofVP2v7omtVINI1FF85a4G+EIPJhuZVY0
	 4noYnll4H+12g==
Date: Wed, 9 Nov 2022 19:25:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <rmani@qti.qualcomm.com>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath10k: Fix return value in ath10k_pci_init()
Message-ID: <20221109192532.259e4af3@kernel.org>
In-Reply-To: <20221110031228.247361-1-xiujianfeng@huawei.com>
References: <20221110031228.247361-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_192538_310152_DF826B63 
X-CRM114-Status: UNSURE (   6.59  )
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

On Thu, 10 Nov 2022 11:12:28 +0800 Xiu Jianfeng wrote:
> To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,  <kuba@kernel.org>, <pabeni@redhat.com>, <rmani@qti.qualcomm.com>
> CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>

How did you come up with this CC list? If you're CCing netdev
maintainers you should also CC netdev@vger.kernel.org 
Somehow you managed to CC LMKL but not netdev :S

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

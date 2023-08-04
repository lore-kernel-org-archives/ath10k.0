Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB8C001DF
	for <ath10k@archiver.kernel.org>; Fri,  4 Aug 2023 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K86/wwpty1zt0gYRE6pQ3vtxDYVOfAS8+wKGadMblLE=; b=TSAn4vyTQk5db7
	l1uVPEkkYxteWjMG6pn+OXxrGgXC+w7sVgAgb3MDjYhedMf+fF8vXvPvvDf53hHIHJiF9YxYCt9CU
	rSU+uGz5FNByqGBhxRGhOWxv+Sws59c0Xw7ga08GdPuVq2WOsY+KNuGy8q0yyty2GbEQjD+J5Qo/4
	jH8+huZ27yvo+dDCJFSZlvIFb2UZtV8fNKBZO4I9wWdyobHF0/9v/SJKPRhZ4QKHAPYkqFpyt3C5/
	YziohcJXJcJzSLZUurn9kC0o2nbNAut2D4zcAooDDtmOXSA6ZmwxU+LsQpIwdkfJfcRDs/RoJw97z
	y1kvFGrAMng/1fkMmCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRs2i-00C7vk-1u;
	Fri, 04 Aug 2023 10:28:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRs2g-00C7vL-29
	for ath10k@lists.infradead.org;
	Fri, 04 Aug 2023 10:28:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9914D61F8F;
	Fri,  4 Aug 2023 10:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A5CC433C8;
	Fri,  4 Aug 2023 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691144901;
	bh=QoEsYNbjsFFAbciklJ7lF0/x8SccEJnHPlvLfQ6xsLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFbH5vBM8CBeZgwU32UOseiNmn3vZkQ2Q01WdpbKuXu4YKCK8JcQmlUGtpdhm1Z2i
	 azg1TGfXTlwawzDxzBwx/Kgwyz8Te9nSyOIv1gOUMX9JdGlAyd7xjJXL6/P4Q1Vs14
	 846YHdjwSi8nlPFXzdar6pH72nZUU9mCJfEG2Vr0=
Date: Fri, 4 Aug 2023 12:28:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Wen Gong <wgong@codeaurora.org>,
	Jouni Malinen <jouni@codeaurora.org>,
	Johannes Berg <johannes.berg@intel.com>, davem@davemloft.net,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, akaher@vmware.com, vsirnapalli@vmware.com,
	tkundu@vmware.com, namit@vmware.com
Subject: Re: [PATCH v4.19.y] ath10k: Fix TKIP Michael MIC verification for
 PCIe
Message-ID: <2023080408-squad-pony-2638@gregkh>
References: <1690971733-22270-1-git-send-email-kashwindayan@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1690971733-22270-1-git-send-email-kashwindayan@vmware.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_032822_770223_C336E392 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Aug 02, 2023 at 03:52:13PM +0530, Ashwin Dayanand Kamat wrote:
> From: Wen Gong <wgong@codeaurora.org>
> 
> commit 0dc267b13f3a7e8424a898815dd357211b737330 upstream.
> 
> TKIP Michael MIC was not verified properly for PCIe cases since the
> validation steps in ieee80211_rx_h_michael_mic_verify() in mac80211 did
> not get fully executed due to unexpected flag values in
> ieee80211_rx_status.
> 
> Fix this by setting the flags property to meet mac80211 expectations for
> performing Michael MIC validation there. This fixes CVE-2020-26141. It
> does the same as ath10k_htt_rx_proc_rx_ind_hl() for SDIO which passed
> MIC verification case. This applies only to QCA6174/QCA9377 PCIe.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Link: https://lore.kernel.org/r/20210511200110.c3f1d42c6746.I795593fcaae941c471425b8c7d5f7bb185d29142@changeid
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> Signed-off-by: Ashwin Dayanand Kamat <kashwindayan@vmware.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Now queued up, thanks.

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

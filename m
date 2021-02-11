Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F68C433E6
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 06:48:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E13564E77
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 06:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E13564E77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=da5lig7md1Ut+nJCFtyCUte3T/9dlu266pnWlvQOBog=; b=23p/BFexiL/+7dSiP/LAcZmvz
	Bf/gtnnHcj9YGjaJwZsDF5TPVROTMXXiGG1OsdNYhm20Cn1va72+SzJIKrD/T4g0j55P/cwG9yQRi
	UcdUvZB/r+QXE6gzyp61h0gjNoLCCr/bVkRssZKR6FPT07qtBXwTX1sAD8u1ck/zhAx03WmvihpNF
	OZsw48tslFkYZMAMD7xtmniqaFdbZuAFYvNsxfwMzyvmEQZHE7nk1wP++j4OEudEE4CoiEQ2Cve/F
	CDKOXTeNVTGOlWsiRzg6du8ocxvGmdhNCW6YrHgkJL6L+WyLcBsvVoRXJvXLOyhBHEz945koFvAC2
	ZTbXcSchQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA5m9-0001Yd-11; Thu, 11 Feb 2021 06:48:29 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA5m6-0001Y1-KR
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 06:48:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613026101; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=qJImtocT1kKiu3caOORG9t/83ASBDabX8bj4mTrx8pI=;
 b=J/xwdtcTRAsRhxifXoda6CeqQiubRBuMThelW1lwu+11yyszW/Eh68gk/Nf6ag4wanOx6beT
 kmlExeWHHFFuDP7pcCeFU7GANaZ0GdEH8af7elrhR8ElMkJFQ9JrsydeEXNrHO3q9Yaz5r4C
 p1n/E+Zm4AvhYWFR93GbBX5B1Nc=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6024d334e3df861f4bd5b8d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 06:48:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE9EBC433CA; Thu, 11 Feb 2021 06:48:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 13AF6C433C6;
 Thu, 11 Feb 2021 06:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13AF6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: restore tx sk_buff of htt header for SDIO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1612839530-2263-1-git-send-email-wgong@codeaurora.org>
References: <1612839530-2263-1-git-send-email-wgong@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210211064819.BE9EBC433CA@smtp.codeaurora.org>
Date: Thu, 11 Feb 2021 06:48:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_014826_754302_8A4BFE01 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 wgong@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> ieee80211_report_used_skb of mac80211 use the frame_control of
> ieee80211_hdr in sk_buff and indicate it to another function
> ieee80211_mgd_conn_tx_status, then it queue work ieee80211_sta_work,
> but ieee80211_is_auth(fc) in ieee80211_sta_work check fail when the
> authentication has transmitted by ath10k.
> 
> When the ath10k report it with HTT_TX_COMPL_STATE_DISCARD, it will be
> set without flag IEEE80211_TX_STAT_ACK, then mac80211 should try the
> next authentication immeditely, but in fact mac80211 wait 1 second for
> it, the reason is ieee80211_is_auth(fc) in ieee80211_sta_work check
> fail for the sk_buff which is not restored, the data of sk_buff is not
> the begin of ieee80211_hdr, in fact it is the begin of htt_cmd_hdr.
> 
> dmesg without this patch, it wait 1 second for the next retry when
> ath10k report without IEEE80211_TX_STAT_ACK for authentication:
> [ 6973.883116] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 1/3)
> [ 6974.705471] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 2/3)
> [ 6975.712962] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 3/3)
> 
> Restore the sk_buff make mac8011 retry the next authentication
> immeditely which meet logic of mac80211.
> 
> dmesg with this patch, it retry the next immeditely when ath10k
> report without IEEE80211_TX_STAT_ACK for authentication:
> [  216.734813] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 1/3)
> [  216.739914] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 2/3)
> [  216.745874] wlan0: send auth to 5e:6f:2b:0d:fb:d7 (try 3/3)
> 
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00049
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e6f1c0d26a31 ath10k: restore tx sk_buff of htt header for SDIO

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1612839530-2263-1-git-send-email-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

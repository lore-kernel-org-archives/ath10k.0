Return-Path: <SRS0=X+kP=G7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B9DC433E9
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB5D64DD8
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB5D64DD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IqNZWUe5DrzU165IqjBKyiAWCe2kXjugfIFhrODrHlo=; b=XASgFY4YRRW5QK5lMxf3zQ150
	14WetIT199Ig/MDQ1LYE+00auPhuRAtA/y60gyjXZcvQFkVbjjudP8/Fh8BmLq00jrDKlJT6QCDfe
	esTfETIGgdb6Dh/y0skwb86sdK7TWGyfLWrnCal1M+KmNmSAF41CFnVzpyVIKXm33jxbIs0CDwfmM
	tXAJzJ3e3T8EO7N0/ywEJlHVBMR4MyzPilRHzIEcjYvv57PIIis2ucXZNVlzRrzFhKCJBP62xKceb
	YaoZY0mzrD5vSGR2nhT9NBd2RtnschGnfgrXyBZbewDW4S9+DI/FOc3TCDJKX8AmVEPtwbKcT+JHR
	8zEtR/q/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51ab-0007Jj-5d; Thu, 28 Jan 2021 07:19:37 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51aW-0007JD-B6
 for ath10k@lists.infradead.org; Thu, 28 Jan 2021 07:19:35 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611818374; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=fnhqldCAxiYhzPpb1kHl8v9nujBo9uC6ZvptVGXCOcY=;
 b=FYBu5h8xyj9F37AF4fffGK4ZqMWx9sMz2J0/0XGyiEQuQS4pf1IQEYGMuuE5CfGCDU/mcnes
 uUzFK+LV7DFO7eo4NAsm1IqQ6rmEVnwz3FO490AwDrCo8OvKtY+3sr3kZK3MAZjN2m4FgLtZ
 sF8WT2rgjuJX1SZNa+MuV/QpQIk=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6012657b0ad40b09041526d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 07:19:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EEA3FC433ED; Thu, 28 Jan 2021 07:19:22 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 115FCC433C6;
 Thu, 28 Jan 2021 07:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 115FCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath10k: pass the ssid info to get the correct bss
 entity
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1607312195-3583-3-git-send-email-wgong@codeaurora.org>
References: <1607312195-3583-3-git-send-email-wgong@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210128071922.EEA3FC433ED@smtp.codeaurora.org>
Date: Thu, 28 Jan 2021 07:19:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_021934_833359_708E339C 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, wgong@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> When connect to an AP with WPA mode, ath10k need to set need_ptk_4_way to
> firmware in WMI_PEER_ASSOC_CMD, then the data path is disallow in
> firmware, it will be allowed untill firmware finish the 4 way handshake.
> 
> It failed with a test case with below steps:
> 1. configure AP with WPA mode with ssid1 SimpleConnect_a_orbvt_ch1,
>    bssid1 and channel 1.
> 2. connect to ssid1 and ping success.
> 3. wait 10 seconds which is less than
>    IEEE80211_SCAN_RESULT_EXPIRE(30 seconds).
> 4. configure AP with OPEN mode with ssid2 SimpleConnect_b_z3a00_ch1,
>    but use same bssid1 and channel 1 of step 1.
> 5. disconnect ssid1.
> 6. connect to ssid2 and ping fail.
> 
> Fail reason:
> When run step 6, ath10k_peer_assoc_h_crypto() called cfg80211_get_bss()
> with bssid and chan info, but ssid1 and ssid2 have the same bssid and
> channel, then there have 2 entry for ssid1 and ssid2 in cfg80211. The
> ssid1's order is before ssid2 in bss_list, and ssid1's age is less than
> the expire time which is IEEE80211_SCAN_RESULT_EXPIRE(30 seconds). Then
> ssid1's entry is selected and ath10k_peer_assoc_h_crypto() parsed it and
> get the rsnie and then need_ptk_4_way is set to firmware, so data path
> is disallowed and it will not receive 4 way handshake for OPEN mode,
> so ping fail in step 6.
> 
> This patch is to pass the ssid info to cfg80211_get_bss() as same as
> cfg80211_mlme_assoc() and cfg80211_mlme_auth(), then it will find the
> correct bss entry in above test case, then case success.
> 
> For AP mode, the ssid info is filled in ieee80211_start_ap(), for STATION
> mode, it is filled in ieee80211_mgd_assoc(). Tested for both AP/STATION
> mode with QCA6174 hw3.2 PCI, it is success start/connect/ping for
> WPA/OPEN mode.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

22df5e1bec25 ath10k: pass the ssid info to get the correct bss entity

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1607312195-3583-3-git-send-email-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

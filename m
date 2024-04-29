Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512D4C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 17:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+VbjRhKP7UU+3bTVDkZ/6lhWcdochYUwIgH78haMVw=; b=1X/oheObXoPR2FPHvHhAae53lv
	x+XnOG9/B64fGzCAmVKN13o644TKQ8fLDTI1GVoJ/UKbbJYvlnqz7uOVx7M8SR/AjT3E6Tv/5Cze9
	euftwGVZYYnz2IylYBsa4aubdq/nEZDSryLBu1nLS5hgdjzgHuf/BINEcX8K9R8uRLc+U6Kjb5UtC
	HbOaynAVkWe2e/EwRHCnqQ7mt1+hMv8xmpGB91rEPxaC9046lrkwc5hOuh/JcgfyoViCb3ZIyFsL2
	8ea/yv2O1VuSm0C0n3ZR5fTZF3LOM2YI2Pg5TK0+43SWWKNzwo4fZHT2uWwlIZT4IfB260hpVBhOb
	xPaj1KqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1VCR-00000003nzT-1wUx;
	Mon, 29 Apr 2024 17:53:59 +0000
Received: from mail-108-mta254.mxroute.com ([136.175.108.254])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1VCN-00000003nwi-4BpE
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 17:53:57 +0000
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta254.mxroute.com (ZoneMTA) with ESMTPSA id 18f2afdd70c0008ca2.002
 for <ath10k@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Apr 2024 17:53:49 +0000
X-Zone-Loop: 0ccd1de9954c4fab01617a4f72351cce80b317a66412
X-Originating-IP: [136.175.111.2]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ericswpark.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x+VbjRhKP7UU+3bTVDkZ/6lhWcdochYUwIgH78haMVw=; b=ZSNh+aF1f1ErpOBRKNA76nwbWz
	jX5mxkvgVQ2xgylXW1UWf6KF27TmODSKkTDpCDLeHjEOQR6xLXoV3spTVGpSR2TTZ4wh30OgKemUI
	RsNRrTvL02SPMUq3xvRoedk0UBBZB5vGLQK0oTp6cQCEmCTZWWq+Ybs6ho7a+GO+L/AG0ghdgNkAM
	sW5asKrm+J8RcobbLggzaIE3eh8I+d0Zwo86SoRthKTdSJZpMfCa16tDlH4HAxnmFqvANZT/tEjEq
	EPmzHkJDEVjLjz4Dr6fR5XHO3xCQ+14ohf1ECm/oOQjk5ry8J8b4DBkJg0uN5493LRAUG7dUaseXE
	9Yl0DOrg==;
Message-ID: <7b8068ed-52ea-4051-b530-3a9af650e582@ericswpark.com>
Date: Mon, 29 Apr 2024 13:53:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
 <87r0ghf4rw.fsf@kernel.org> <a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
 <87wmolsrcc.fsf@kernel.org>
 <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
 <87o79sfjlf.fsf@kernel.org> <483bc3022513fd0740b5342b59ce94ad@ericswpark.com>
 <87bk5sqgdf.fsf@kernel.org>
Content-Language: en-CA
From: Eric Park <me@ericswpark.com>
In-Reply-To: <87bk5sqgdf.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: me@ericswpark.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_105356_160253_A5E2F537 
X-CRM114-Status: GOOD (  15.22  )
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

On 4/29/2024 12:32 PM, Kalle Valo wrote:

> If the problem is on ath10k side I would rather semove support for
> 802.11w altogether (until it's fixed). It's controlled with this flag:
>
> 	ieee80211_hw_set(ar->hw, MFP_CAPABLE);
>
> Alternatively if it works on some hardware and not on others we could
> make it per hw, for example disabled on QCA6174 and enabled on all
> others.

Yup, that would definitely be ideal.

>
> But I found some old documentation claiming that 802.11w can be disabled
> from Network Manager, if it works that sounds like a good temporary
> solution:
>
> (...)

So I tried this by running `nmcli connection modify <SSID> wifi-sec.pmf 
1` (after setting `key-mgmt` to `wpa-psk` since `SAE` requires PMF), but 
for some reason it is now refusing to connect. The "Configuring 
Interface" message shows up with the spinner, and then after a while a 
"No secrets were provided" error shows. In `journalctl` I see the 
following output (pasting Gist link since I don't know if you're 
supposed to attach logs in email on mailing lists, please let me know if 
that's expected otherwise!):

https://gist.github.com/ericswpark/b7447021cda590237aea0a9f13f92134

Once I turn it back to defaults with `wifi-sec pmf 0` it starts to 
connect again.

Perhaps the driver showing that the card is capable of PMF, however 
broken it might be, is causing NetworkManager and wpa_supplicant to be 
confused? I did find a couple of bug reports that might be related:

https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/104
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/129


- Eric



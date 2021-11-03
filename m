Return-Path: <SRS0=Iu+e=PW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF07CC433EF
	for <ath10k@archiver.kernel.org>; Wed,  3 Nov 2021 08:04:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7377560F5A
	for <ath10k@archiver.kernel.org>; Wed,  3 Nov 2021 08:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7377560F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryE1fN8garB6o5BK2fU2Q/2MOq7vsS0RssDWsmJYy2o=; b=bseuqeMzdlmFJN
	GkPlW+e/fh7CG8zUuQ1TMvmvjBokeGC0yypj46PnIBG1pDtU1mf897ndhxEl9UtIczdUIuai4OGXk
	M7s7juew2dwo60CPpEW773NkeIi7miIYH4UJGWdgI+T1wjR5ZnwhiJR+J5HFtAdsWhvK2cmIEVXxy
	7CmHFTAk2L9H7CUfKKstSQZ9VScRO4bpLDa36nrOfz9pLTTed4I9O5C1xPMxhv56WSK+qtCMaflQg
	kr5mwh8rMgEyGQSwJqBBgexNQ7DlvC6PR1QT1RmMBcDIaDQZPmJGaKYAq8wJiXzzdLFoIA+DLBfBm
	wpbUYkhck0IWUWsIgUyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miBFY-004Sez-Lc; Wed, 03 Nov 2021 08:04:00 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miBFU-004SeC-T0
 for ath10k@lists.infradead.org; Wed, 03 Nov 2021 08:03:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635926636; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=/FkqchVfdJSfuR6s2AopchaoLWi2TO8wM4NLBqQNehg=;
 b=KtwIe36hhIjDrmHXXr2beMelqAXxUl0793HTHv+yG1XCYOk+QyMnRNCYtL26o9IdddZBEm7J
 xsEb8G1Oso+FtqMPeMZLdROFzVjd1zH6vRT20YtkwEidDWyPHMHKJD49dZ+H3Q7sBqgKYhLa
 WTUwuDrgH49q06LmXbBCquR0TZQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6182426b50a31f82cbf691f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Nov 2021 08:03:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0024C43460; Wed,  3 Nov 2021 08:03:54 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1893DC4338F;
 Wed,  3 Nov 2021 08:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1893DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: kernel test robot <lkp@intel.com>
Cc: Benjamin Li <benl@squareup.com>, kbuild-all@lists.01.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [kvalo-ath:pending 53/53]
 drivers/net/wireless/ath/wcn36xx/txrx.c:275:42: error: variable 'sband' set
 but not used
In-Reply-To: <202111022135.B8TpALyf-lkp@intel.com> (kernel test robot's
 message of "Tue, 2 Nov 2021 21:56:46 +0800")
References: <202111022135.B8TpALyf-lkp@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 03 Nov 2021 10:03:47 +0200
Message-ID: <875yt9sm1o.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_010357_050805_6AC9F122 
X-CRM114-Status: GOOD (  14.48  )
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

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   1619f62ef8c1766f887eeef36f4d03f01c16b4c9
> commit: 1619f62ef8c1766f887eeef36f4d03f01c16b4c9 [53/53] wcn36xx: fix RX BD rate mapping for 5GHz legacy rates
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=1619f62ef8c1766f887eeef36f4d03f01c16b4c9
>         git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>         git fetch --no-tags kvalo-ath pending
>         git checkout 1619f62ef8c1766f887eeef36f4d03f01c16b4c9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=arc 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/wcn36xx/txrx.c: In function 'wcn36xx_rx_skb':
>>> drivers/net/wireless/ath/wcn36xx/txrx.c:275:42: error: variable 'sband' set but not used [-Werror=unused-but-set-variable]
>      275 |         struct ieee80211_supported_band *sband;
>          |                                          ^~~~~
>    cc1: all warnings being treated as errors

This is a warning in the pending branch. I'll drop this version,
Benjamin please fix the warning in v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

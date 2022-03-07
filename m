Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7796DC433F5
	for <ath10k@archiver.kernel.org>; Mon,  7 Mar 2022 17:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eVW34fF/9R1F29U8mio4kJ906fEjN4W7UDmAcoUauE=; b=kiy2nO+p3dlpg8
	OO3pUxbvotFdJoabmXApC/rXHublQo0aQIqjI8fnT82xC8CNvjqJCdbMjGjXT/w19Su9TzQVIqPvo
	ZFgf2ugRve3JxeaHBIOguGL/jtcLQ8Of6gRjKkpreoIziKnnNVRSdOHNaq+5Q4STcp4KlV2Mc49OG
	AJ8voSnf6+ABqtNm1wJv0ge/k+nMYzjbEz1tJtrUJS+ly/OFqMrODFjRpuV1po+W65vEhgqi7odep
	B8h3ykEC2LatUNxq5UlglC4qW44FTObCjcPTDg4O2fqQu2FKO4nJULCB2s+/o7WkVXHR3kAKCRfXk
	Hx+wg3P0CTrsAYZ2yJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRHQp-0013TJ-2n; Mon, 07 Mar 2022 17:46:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRHQm-0013Rz-Qq
 for ath10k@lists.infradead.org; Mon, 07 Mar 2022 17:46:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C890FB81654;
 Mon,  7 Mar 2022 17:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D497FC340E9;
 Mon,  7 Mar 2022 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646675157;
 bh=/NpjGjQdtw/amOpaK8Pkr0lhwX9x2eGRbV9UUgrtViY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=uEt667SZIcUPXrrVnrBcmmVYlI2+N+4d3+OfPjtr2s3JRJMMMH9Qk+JCfeh1QGL1B
 YEUbRTMUfBwgaueMHTSaeLzI/TBvwgLWOb06/mVQgxdb30CKzYK5HZNPUoA4JwRLYD
 sVQ0NXjFM6qDxqVr5v56Ag1wm0CpppC2rGaG0cVggW52Ti6Y7Gdurt8HBseLYTi3L4
 WHa5qGhXxx+qSFRsleje+Kad2EMvgZ+4ThYNcmWlNnxNY27tOJFBrRcZNcmewu8gCs
 obWOY/TwAdUxvtpN15z/7CxEQqXl4EeypRcXLv1NT/knVdvGAQGUcIk9rFEsUYDfpk
 qCKZjkTlm5c2w==
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20200527165718.129307-1-briannorris@chromium.org>
References: <20200527165718.129307-1-briannorris@chromium.org>
To: Brian Norris <briannorris@chromium.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 <linux-kernel@vger.kernel.org>, Brian Norris <briannorris@chromium.org>,
 stable@vger.kernel.org, Wen Gong <wgong@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164667515364.26528.7146769565845782335.kvalo@kernel.org>
Date: Mon,  7 Mar 2022 17:45:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_094601_067684_E47328D3 
X-CRM114-Status: UNSURE (   8.22  )
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

Brian Norris <briannorris@chromium.org> wrote:

> This reverts commit 2dc016599cfa9672a147528ca26d70c3654a5423.
> 
> Users are reporting regressions in regulatory domain detection and
> channel availability.
> 
> The problem this was trying to resolve was fixed in firmware anyway:
> 
>     QCA6174 hw3.0: sdio-4.4.1: add firmware.bin_WLAN.RMH.4.4.1-00042
>     https://github.com/kvalo/ath10k-firmware/commit/4d382787f0efa77dba40394e0bc604f8eff82552
> 
> Link: https://bbs.archlinux.org/viewtopic.php?id=254535
> Link: http://lists.infradead.org/pipermail/ath10k/2020-April/014871.html
> Link: http://lists.infradead.org/pipermail/ath10k/2020-May/015152.html
> Link: https://lore.kernel.org/all/1c160dfb-6ccc-b4d6-76f6-4364e0adb6dd@reox.at/
> Fixes: 2dc016599cfa ("ath: add support for special 0x0 regulatory domain")
> Cc: <stable@vger.kernel.org>
> Cc: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1ec7ed5163c7 Revert "ath: add support for special 0x0 regulatory domain"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20200527165718.129307-1-briannorris@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

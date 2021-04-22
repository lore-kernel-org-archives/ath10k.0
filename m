Return-Path: <SRS0=Pgi6=JT=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815EEC433ED
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 14:02:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 112E8608FE
	for <ath10k@archiver.kernel.org>; Thu, 22 Apr 2021 14:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 112E8608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/2OztGoK9KNxT5v0/frI8SiuUgPQDKDDPlRD1Jd8NSA=; b=Oqg2PjH0vQRIVSrCC1FeelstN
	7z0F3QJWMd2beDBOIr/IMbufp1rhdSuK/TFWE9JT31HF3d6NLJIFtlHX+yiz3Dthr/9aVCzlPxdT/
	ks3k4/302//+VwWubpb3qZPsEwpMtojS6yOX6jlvXK3ixN+8dz8x5uwaUiuXk0YzeLiZVixNlrCJ9
	VRy7kxOoAGr3gxhrlCpr4/B2txqU4RU2M41bE+vz5nP8QPSD9G4MS+R1JUOJJqkcxTpxKTqevTEQg
	n2Dus9zGW5iicO5a55fNQcfuHChuKDkgmi3Os5AnHCJf5MWPX3Umfg2N7jLdBYJKfuEDBj6s4Htx3
	7vkYv+D3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZts-00GqVP-Qh; Thu, 22 Apr 2021 14:01:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZtp-00GqVG-Ep
 for ath10k@desiato.infradead.org; Thu, 22 Apr 2021 14:01:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:Message-Id:Cc:To:References:
 In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=9uDftcBL8Z/JOSMWyrbhAcEYePFk6Rg2aRLvXo+zRUI=; b=bx/9//LKCvAHd9HoU+EVENhctk
 4rbLIs9v3B692g9oJ+gUdiUEJjT7LCOA9OBvdpRsQ3ioZQ1gqP//AWa2htt76uUKguLyov/EyMzyj
 PjnUVP8Fl/SLjyqz1qmHfIfnRWoZ2tdM1QPaztyungFC5OeI0uiWyL8Z4LoX/XItcSHap94E58Nnu
 8+FJ/BP1m5759WeT/U5B6zUkYX/6ZdEfVC0a2cZRR5g6g+DXEvOeNs1jP2T+X7sneDbOeG7sb2b+O
 5Wn/siJ0GC8sfQzi79k8pJGcyjhJE7heYs7yHENYaVbzdXKqZ6dM8qGwVUhUe6P57Okf/Q42tacsB
 fOft31WQ==;
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZtf-00DjxP-P4
 for ath10k@lists.infradead.org; Thu, 22 Apr 2021 14:01:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619100102; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=9uDftcBL8Z/JOSMWyrbhAcEYePFk6Rg2aRLvXo+zRUI=;
 b=syZx1dQa3T/V9PBHHE2GlBxKTvUXuwrXewAx/8f7UAVtnb3qNJJZxg8drahJtVyOJujZxYU7
 PYi0/qXADtpJK2DgxiFFlWVV1PcCS6RZKUXYw1QlRcnow5ug3DbGd9P9dim7LAuu7PvnFrd3
 9uK+hDhHAA+xMxmqisNkra+9fA4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 608181952cc44d3aea7097b7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 14:00:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3AF1BC433D3; Thu, 22 Apr 2021 14:00:53 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76C7AC433F1;
 Thu, 22 Apr 2021 14:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76C7AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix ath10k_wmi_tlv_op_pull_peer_stats_info()
 unlock without lock
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210406230228.31301-1-skhan@linuxfoundation.org>
References: <20210406230228.31301-1-skhan@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: davem@davemloft.net, kuba@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pavel@ucw.cz
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210422140053.3AF1BC433D3@smtp.codeaurora.org>
Date: Thu, 22 Apr 2021 14:00:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_070142_776002_753C7887 
X-CRM114-Status: UNSURE (   8.93  )
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

Shuah Khan <skhan@linuxfoundation.org> wrote:

> ath10k_wmi_tlv_op_pull_peer_stats_info() could try to unlock RCU lock
> winthout locking it first when peer reason doesn't match the valid
> cases for this function.
> 
> Add a default case to return without unlocking.
> 
> Fixes: 09078368d516 ("ath10k: hold RCU lock when calling ieee80211_find_sta_by_ifaddr()")
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

eaaf52e4b866 ath10k: Fix ath10k_wmi_tlv_op_pull_peer_stats_info() unlock without lock

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210406230228.31301-1-skhan@linuxfoundation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

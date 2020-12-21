Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D1DC433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 23:55:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5123B20760
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 23:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5123B20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=candelatech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=87QOJEGEiuwlDqq0YuXttwW8LzdfG3hQfQcZLXYoIpw=; b=frGF/c7YXVjnQ2
	aIk9FAD0CCLYFNXE59ueBCOv2MhCVaoMFGckThjQ/R3uzyd0KHaJ8bse9HHCJ0qxvnubG+7GoZvp5
	KMo/lLe96ykLQL4pRbgzHnjWboNiBsy7p4bkGnT+7b7Ug3N1obP6PeYePdh4JJFiyTlRb7cd6+5pD
	k8otGAoOx4dpIQd53ckPmViOcpOWYSQitxQ9+ogfWabzNgtOmhiqqoaGn9tU0PjNhgZl8fxElShJV
	rkddco6XdHlmEIZHD4fMW2fgomNrbXVlQ5ndrcJBYrlKbtZsFJvhQzTg9atYLmTxyWOF8kfICstoU
	QnYcjJPzIoRAo4jYp76g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krV1c-00056O-En; Mon, 21 Dec 2020 23:55:36 +0000
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krV1a-000560-Gb
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 23:55:35 +0000
Received: from [192.168.254.6] (unknown [50.46.158.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail3.candelatech.com (Postfix) with ESMTPSA id D6CAB13C2B0;
 Mon, 21 Dec 2020 15:55:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com D6CAB13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
 s=default; t=1608594933;
 bh=F7ozhtwuhrGggN6wJ+krzNZQfpP/UK5VVPFr3YEjxhQ=;
 h=To:From:Subject:Date:From;
 b=ogR/GZ1OPjUFX3TvDeoeHM1YmF9ARkn4sLw91wuApWn+vVHBfoLMgb3AZILxrpwgF
 m2CzWq1fQfzoS7QfTs6xa5uD2gnXYE94DLp7iIDJvZyjuqKEKWT9qQjJvu4t/gDLt+
 Zl1+cKWfrGZeMZeoisK+QDR0gojVKcRyiOMMY0ow=
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
From: Ben Greear <greearb@candelatech.com>
Subject: skb_cb corruption in ath10k
Organization: Candela Technologies
Message-ID: <86170a90-da2f-3227-d7e5-fe9486156705@candelatech.com>
Date: Mon, 21 Dec 2020 15:55:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_185534_654083_C822F0E9 
X-CRM114-Status: GOOD (  12.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

I'm trying to figure out what changed in the last few kernels that is making:

struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
if (info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT)
	/* why is code here all of a sudden */

in data frames in ath10k,
when, to the best of my knowledge, nothing should be setting that up in the stack.

My guess is that something is stepping on the cb field somewhere in ath10k,
but I am not sure where that might be at this point.

And it also appears mac80211 or maybe supplicant is setting the rate-inject flag on some mgt frames,
but I think that is a separate concern at this point.

If anyone has any ideas of likely points, please let me know.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

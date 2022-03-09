Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A59C433F5
	for <ath10k@archiver.kernel.org>; Wed,  9 Mar 2022 07:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOeFQhZoEYnBQ7esfdj+M8BejLW1FgjWTruhLDuR1Gg=; b=TU5Xk/DKB0bl9W
	Z+Z+hvFDLbg4+7xiqQb3bXvujECGZfcckR1ATqxD9EuqIfMRAaZ2HGvZVNTQI9JQPzf+esSkAe9JN
	jW8haHHZTAtc9luDR2KlYCec0VS7HjYmXtIJdO9dHn/gli6fkSqFqMmc2zbfp1BOxgl38HKjW7fZn
	2ODVPdwfiYpHw5O5vYZYYqjdFUVwTo3T3pBg9msk5QoL3TtsgcMM0+D7l1xzUCknMZVHW/ifs2TZi
	QpuraDANU4iaaevBxP5GFJo/7znGoyvZ5ft+c2A1LGegT3XhvXDt20tf870qUIET3TRSgDMjJWMW8
	VAuR5M+Kl/+UJ/OKeGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRqfQ-007bMu-PC; Wed, 09 Mar 2022 07:23:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRqfN-007bLs-Bq
 for ath10k@lists.infradead.org; Wed, 09 Mar 2022 07:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F5FBB81E9D;
 Wed,  9 Mar 2022 07:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B79CC340E8;
 Wed,  9 Mar 2022 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646810601;
 bh=4vUqzSLxU7s7Wud0FXo8FM5vWbg7fksL1QMOdfnMzo4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=cKUmU7FnVEuzwTgINFLniaG5G4O0ir31nOAXpsZ4fgg0LgQvea5EG0ro1aIMKafPJ
 t5IPK2okseBTM3e0r8z+a+/gDgY6lRzHR631qWNICGHO5bNGKL52oq0VG1wiyZDcx/
 iasN359v1dLK3SJGdbcui79YIkOPCr5BT8ybDvX8G64mlEe55E41m5+O17zJL0zUyo
 Ji0W7xmq7MbaPRM5dC819t5hlEN0u0GQbaOyAWKbhBP76I+3kljhL+if+lTvpW0NDx
 v0UEQiZZoGnSk1xOJ4WLgxvMPISMUeqUZe55zN2eTtZxZS6WGuh7hCsW2dIf4oGCL/
 zzgyhBQL//0Xg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Miaoqian Lin <linmq006@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, "Rakesh Pillai" <pillair@codeaurora.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath10k: Fix error handling in ath10k_setup_msa_resources
In-Reply-To: <b69308a5-0d29-6b48-833c-f3eacfe03b08@quicinc.com> (Jeff
 Johnson's message of "Tue, 8 Mar 2022 16:05:09 -0800")
References: <20220308070238.19295-1-linmq006@gmail.com>
 <b69308a5-0d29-6b48-833c-f3eacfe03b08@quicinc.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 09 Mar 2022 09:23:16 +0200
Message-ID: <87a6dzsi6z.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_232325_595388_7A77C1A7 
X-CRM114-Status: UNSURE (   8.25  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/7/2022 11:02 PM, Miaoqian Lin wrote:
>> The device_node pointer is returned by of_parse_phandle()  with refcount
>
> Kalle, can you fix this nit when you apply?  remove extra space after ()

Will do, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

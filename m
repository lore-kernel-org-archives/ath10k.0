Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301E8C433EF
	for <ath10k@archiver.kernel.org>; Thu,  3 Mar 2022 16:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX+Bz6TUv/RSK5L8fUYc2o0nOrp2g6lVasPp4fbxI9s=; b=Cm9DE+oxP3xvu7
	h9/AMysI6Jc5qvu1Dx9rzm1KVDplbkTbaHToBe7Qv7aXe26EwFBSQQMz4WbK6rl2BDDVibsh3jGgI
	AnTpKW66eaGyUo7HeMitgFftUYqFJMhh+gaZyuZX1wGe6H2OJ3BetUK/7zxGXVh614BM3Uur0gK3c
	VRRc8SZsy9q2anlSDPnNSDCdAha+eJJvqH7OD8MTCj7sH5ljrW5y6YfTE0zBlZ24eiPqwxODKm3TA
	uXK3/CgnTFZMQhjbXD944G5CUTFqU+1FyZWNW+3g+WbyF84zwXn//YF+ACb6RZ7hNWlfydb+wHlqk
	9B8tH650Si1GZ4VS0DEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPoZW-007E2G-TP; Thu, 03 Mar 2022 16:44:58 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPoZT-007E1I-QV
 for ath10k@lists.infradead.org; Thu, 03 Mar 2022 16:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646325896; x=1677861896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+iDGKFAulchRj34sfVomUgUNOfHoOIb3JB/8WAHfFTs=;
 b=YQCkFuVsMSFNQj+oAq6v0axOe1BW1u6YQZTXjzHI+7s6O6IKyjAyv3hS
 KmzEcoGbQEBfVxHed3UaQ2gvBkQQNMfGk//7TWrd6O6Ecs3FWQELW0bWY
 BEOkTogLoo883z2LOmNrTTnPXKlq165Tqf1JcZ8QY0VgoT4bED/riJOAY M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 03 Mar 2022 08:44:53 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 08:44:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 08:44:52 -0800
Received: from [10.111.177.132] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 08:44:52 -0800
Message-ID: <7ac0be6d-35f1-cab3-0ab3-c06367a28ed1@quicinc.com>
Date: Thu, 3 Mar 2022 08:44:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/2] mac80211: Add support to trigger sta disconnect on
 hardware restart
Content-Language: en-US
To: Youghandhar Chintala <youghand@codeaurora.org>,
 <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <pillair@codeaurora.org>, <dianders@chromium.org>, <kuabhs@chromium.org>,
 <briannorris@chromium.org>, <mpubbise@codeaurora.org>
References: <20220303115541.15892-1-youghand@codeaurora.org>
 <20220303115541.15892-2-youghand@codeaurora.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220303115541.15892-2-youghand@codeaurora.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_084455_931977_FF4713A5 
X-CRM114-Status: GOOD (  19.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 3/3/2022 3:55 AM, Youghandhar Chintala wrote:
> Currently in case of target hardware restart, we just reconfig and
> re-enable the security keys and enable the network queues to start
> data traffic back from where it was interrupted.
> 
> Many ath10k wifi chipsets have sequence numbers for the data
> packets assigned by firmware and the mac sequence number will
> restart from zero after target hardware restart leading to mismatch
> in the sequence number expected by the remote peer vs the sequence
> number of the frame sent by the target firmware.
> 
> This mismatch in sequence number will cause out-of-order packets
> on the remote peer and all the frames sent by the device are dropped
> until we reach the sequence number which was sent before we restarted
> the target hardware
> 
> In order to fix this, we trigger a sta disconnect, in case of target
> hw restart. After this there will be a fresh connection and thereby
> avoiding the dropping of frames by remote peer.
> 
> The right fix would be to pull the entire data path into the host
> which is not feasible or would need lots of complex changes and
> will still be inefficient.
> 
> Tested on ath10k using WCN3990, QCA6174
> 
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> ---
>   include/net/mac80211.h     | 11 +++++++++++
>   net/mac80211/ieee80211_i.h |  3 +++
>   net/mac80211/mlme.c        | 12 ++++++++++++
>   net/mac80211/util.c        | 33 ++++++++++++++++++++++++++++++---
>   4 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index bd6912d0292b..0773c50fa182 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -6064,6 +6064,17 @@ void ieee80211_disconnect(struct ieee80211_vif *vif, bool reconnect);
>    */
>   void ieee80211_resume_disconnect(struct ieee80211_vif *vif);
>   
> +/**
> + * ieee80211_hw_restart_disconnect - disconnect from AP after
> + * hardware  restart

nits:
remove excess space in "hardware  restart"

"Do not leave a blank line between the function description and the 
arguments" per 
<https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation>

(I see that there is quite a mixture of compliant and non-compliant 
kernel-doc in this file)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

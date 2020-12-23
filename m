Return-Path: <SRS0=2NXS=F3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2F5C433DB
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 11:08:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1875222F9
	for <ath10k@archiver.kernel.org>; Wed, 23 Dec 2020 11:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1875222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5gqfIfLHlt6JmrNWa/H4/Z7jqnUigAaAjcqsGkwQzUY=; b=mD/znoAjTqMF/KfHvFneWfdDJ
	2Wfm9Qo3xacti/aAVR/UzTL8nz1XEnHZQRQ0mvpGWAovOJlOiwHRXWT2p7TN5UvR0nWhfjgT5ZcK4
	wwOCTPlGepjiU8vtX3nsWqiciGuVteEJdOU0xZz12xEI1A70ZJGGNm9+YXRg58/FD9t6U/2waobtX
	QkRUGA6YcLLX5glll2cLv5r4USEVLJpo5hjnjGUtXwqjN9fzAdNnl5E+nt1SBNhEX29b1bwVEpQ4a
	58BXterzNMBwJKHdxgy83J7okfqomy87JuZlikuiypRP5jjkkhf/YmBIbQqB9UyICAIL9JnIHDmtJ
	9u8ekW0TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks20b-00018U-Ev; Wed, 23 Dec 2020 11:08:45 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks20V-00015z-Dz
 for ath10k@lists.infradead.org; Wed, 23 Dec 2020 11:08:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608721720; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=sS6gB7NQorNHJ1fvmwVd8pHeIbjE7GGfwVzQmbtlg/E=;
 b=lMfEMJbhdOcg3UZW12uttJ8jZb2ceB+1K9EIfLJeqoKht3y0+45fi2ebu9gffJaitMPlXp8Y
 xRXKTcCxsbxc0HOTgowdE8L+4oh9WJbog5dNxKwsbi+jBEyFoyGeVsta6hQ68W0vVSIA1gM6
 pqcSWEwB00pNh5JDsoC/ZMo5p4M=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fe32533cfd94dd328611ce4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Dec 2020 11:08:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A3FF2C433C6; Wed, 23 Dec 2020 11:08:35 +0000 (UTC)
Received: from x230.qca.qualcomm.com (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BDF2C433ED;
 Wed, 23 Dec 2020 11:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0BDF2C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Subject: Re: [PATCH 3/3] ath10k: Set wiphy flag to trigger sta disconnect on
 hardware restart
References: <20201215172435.5388-1-youghand@codeaurora.org>
 <CACTWRwsM_RJnssBpxDpRSbex4_1T9QDv3+ZT7eLnYsgOgtGFQw@mail.gmail.com>
Date: Wed, 23 Dec 2020 13:08:29 +0200
In-Reply-To: <CACTWRwsM_RJnssBpxDpRSbex4_1T9QDv3+ZT7eLnYsgOgtGFQw@mail.gmail.com>
 (Abhishek Kumar's message of "Tue, 22 Dec 2020 14:36:58 -0800")
Message-ID: <878s9o6aqa.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_060840_305759_37AFD022 
X-CRM114-Status: GOOD (  23.69  )
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
Cc: Youghandhar Chintala <youghand@codeaurora.org>,
 netdev <netdev@vger.kernel.org>, Brian Norris <briannorris@chromium.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rakesh Pillai <pillair@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Abhishek Kumar <kuabhs@chromium.org> writes:

> On Tue, Dec 15, 2020 at 9:24 AM Youghandhar Chintala
> <youghand@codeaurora.org> wrote:
>>
>> From: Rakesh Pillai <pillair@codeaurora.org>
>>
>> Currently after the hardware restart triggered from the driver,
>> the station interface connection remains intact, since a disconnect
>> trigger is not sent to userspace. This can lead to a problem in
>> hardwares where the wifi mac sequence is added by the firmware.
>>
>> After the firmware restart, during subsytem recovery, the firmware
>> restarts its wifi mac sequence number. Hence AP to which our device
>> is connected will receive frames with a  wifi mac sequence number jump
>> to the past, thereby resulting in the AP dropping all these frames,
>> until the frame arrives with a wifi mac sequence number which AP was
>> expecting.
>>
>> To avoid such frame drops, its better to trigger a station disconnect
>> upon the  hardware restart. Indicate this support via a WIPHY flag
>> to mac80211, if the hardware params flag mentions the support to
>> add wifi mac sequence numbers for TX frames in the firmware.
>>
>> All the other hardwares, except WCN3990, are not affected by this
>> change, since the hardware params flag is not set for any hardware
>> except for WCN3990
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048
>>
>> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
>> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
>> ---
>>  drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
>>  drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
>>  drivers/net/wireless/ath/ath10k/mac.c  |  3 +++
>>  3 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 796107b..4155f94 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -90,6 +90,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>                 .hw_filter_reset_required = true,
>>                 .fw_diag_ce_download = false,
>>                 .tx_stats_over_pktlog = true,
>> +               .tx_mac_seq_by_fw = false,
>
> Probably orthogonal to this patch, there is a static array maintained
> for different hardware configs and the structure members like
> "tx_mac_seq_by_fw" are initialized. This does not seem to be scalable
> and probably these parameters can be auto populated based on FW
> capabilities and so we don't have to maintain the static array.
> Thoughts?

I'm not sure what you mean. But if you are saying that we should move
ath10k_hw_params_list entirely to firmware then that is a huge task as
we would need to make changes in every firmware branch, and there are so
many different branches that I have lost count. And due to backwards
compatibility we still need to have ath10k_hw_params_list in ath10k for
few years.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

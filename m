Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGG7V-0000kQ-LY
 for ath10k@lists.infradead.org; Wed, 09 May 2018 03:50:36 +0000
MIME-Version: 1.0
Date: Wed, 09 May 2018 09:20:14 +0530
From: Govind Singh <govinds@codeaurora.org>
Subject: Re: [PATCH 06/12] firmware: qcom: scm: Add WLAN VMID for Qualcomm SCM
 interface
In-Reply-To: <20180507204236.GI2259@tuxbook-pro>
References: <1522042819-25916-1-git-send-email-govinds@codeaurora.org>
 <20180507204236.GI2259@tuxbook-pro>
Message-ID: <55ee4bf22e6557a37cbd46691816bef5@codeaurora.org>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-05-08 02:12, Bjorn Andersson wrote:
> On Sun 25 Mar 22:40 PDT 2018, Govind Singh wrote:
> 
>> Add WLAN related VMID's to support wlan driver to set up
>> the remote's permissions call via TrustZone.
>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> 
> Please use ./scripts/get_maintainer.pl for each patch to get a hint
> about whom to send your patches to.
> 
> While I think it's okay that Kalle picks it through his tree Andy 
> should
> give his ack first.
> 
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 

Thanks Bjorn for the review.
I will take care this point while sending the next version of the qmi 
patch set.

>> ---
>>  include/linux/qcom_scm.h | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
>> index b401b96..da63d84 100644
>> --- a/include/linux/qcom_scm.h
>> +++ b/include/linux/qcom_scm.h
>> @@ -1,4 +1,4 @@
>> -/* Copyright (c) 2010-2015, The Linux Foundation. All rights 
>> reserved.
>> +/* Copyright (c) 2010-2015, 2018, The Linux Foundation. All rights 
>> reserved.
>>   * Copyright (C) 2015 Linaro Ltd.
>>   *
>>   * This program is free software; you can redistribute it and/or 
>> modify
>> @@ -33,6 +33,8 @@ struct qcom_scm_vmperm {
>> 
>>  #define QCOM_SCM_VMID_HLOS       0x3
>>  #define QCOM_SCM_VMID_MSS_MSA    0xF
>> +#define QCOM_SCM_VMID_WLAN       0x18
>> +#define QCOM_SCM_VMID_WLAN_CE    0x19
>>  #define QCOM_SCM_PERM_READ       0x4
>>  #define QCOM_SCM_PERM_WRITE      0x2
>>  #define QCOM_SCM_PERM_EXEC       0x1
>> --
>> 1.9.1
>> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

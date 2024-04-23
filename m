Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79262C4345F
	for <ath10k@archiver.kernel.org>; Tue, 23 Apr 2024 01:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yps+59rDIeSan4U3LUH0/26iRth9vCgv8xrZZa/VsKg=; b=xrhvR5PwDzGD/3HdP1FP4qXEU1
	IQ2Ei9XEDe/QXhz2Tgpr8rG4B/y+gaMO/2vBlfh8hJfof99XAuLgAdnGTqkzj62Hq6FqHF8krjR7n
	D9YH1V4i2tTKNTHU/04zsEJ4GIEvRirVh/TEdi/1yWYJa/uGHp9Dvtkmjv++4F5h9m+WJw38vqKrn
	TpcomrhkR+rSsGSziAfoyFQeNLPem6HTE/5B17xx3rzPEI/XeqtKn2h6l4Hnqtk+gW2WjOY73QMW8
	czhGcOSzV1qtAQY+3dHkIjcudyixKR6ISukYE/3chnrSMRnPzGksq7KE6/gVfIGcP/Jxh5u353im5
	YOdVJn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz4qk-0000000Fezv-2jBK;
	Tue, 23 Apr 2024 01:21:34 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz4qd-0000000Fez7-3J9r
	for ath10k@lists.infradead.org;
	Tue, 23 Apr 2024 01:21:32 +0000
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id E0A936083C8B3;
	Tue, 23 Apr 2024 09:21:11 +0800 (CST)
Message-ID: <3621bf61-732a-c2bc-c135-fbba299f8f57@nfschina.com>
Date: Tue, 23 Apr 2024 09:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless v2] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: quic_jjohnson@quicinc.com, jjohnson@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 c_mkenna@qti.qualcomm.com, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <878r15j3bt.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_182128_096848_B04FBF28 
X-CRM114-Status: UNSURE (   9.94  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2024/4/22 14:53, Kalle Valo wrote:
> Su Hui <suhui@nfschina.com> writes:
>
>> Clang Static Checker (scan-build) Warning:
>> drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
>> Value stored to 'ret' is never read.
>>
>> Return 'ret' rather than 'count' when 'ret' stores an error code.
>> By the way, remove some useless code.
>>
>> Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>> v2:
>>   - remove the initializer change.
>>
>>   drivers/net/wireless/ath/ath10k/debugfs_sta.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
>> index 394bf3c32abf..c1198e9027ae 100644
>> --- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
>> +++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
>> @@ -432,14 +432,12 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
>>   
>>   	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
>>   					ar->wmi.peer_param->debug, peer_debug_trigger);
>> -	if (ret) {
>> +	if (ret)
>>   		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
>>   			    ret);
>> -		goto out;
>> -	}
> Minimal changes with one logical change per patch, please. I'll remove
> this part in the pending branch.
>
Sorry for this, thanks for your help!

Su Hui



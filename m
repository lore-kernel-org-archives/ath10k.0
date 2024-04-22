Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B3AC4345F
	for <ath10k@archiver.kernel.org>; Mon, 22 Apr 2024 03:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jxdukSvCwoik6XaqQ4Vk2PUZWcr89xx+nfng3yjlxpU=; b=2LPzO2EJUx1Y8Ge2+wXSFDLAW7
	UUtiaJbqkf1a0mxwjDboEi5wKjE/lPJ6AA7TdIL06mojoWGalRNdpDz67Q9XuojlyBGuGVuh6zKgB
	jD/u6BLB4ffMXvTjX4/0lBgi9IuL1fBQNG1LI3bNyXEg5ocP3ACFMf0Wk74KvNR7+R7IYXvNuk2X4
	PDBO9kGmxCOBwmbGsDUBrJ3si1fi3RUdj3D4rIJIq+rlOSN/oICDMlH2NNzK9zoitI2+BQeTfqmbo
	cGMA4Km2nfacRALAfhdbQlt5LIRp7gCAJj8/gLrbXtJ9AEmwGioparaGW5xVw2dxr+5T9t9eV8lt5
	21Oo0XrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykQh-0000000Brpp-0KQZ;
	Mon, 22 Apr 2024 03:33:19 +0000
Received: from [42.101.60.195] (helo=mail.nfschina.com)
	by bombadil.infradead.org with smtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykQd-0000000BroV-2ikz
	for ath10k@lists.infradead.org;
	Mon, 22 Apr 2024 03:33:17 +0000
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 0B5136068094E;
	Mon, 22 Apr 2024 11:32:43 +0800 (CST)
Message-ID: <6d311a40-05b9-3958-673d-e4c4d154ce4f@nfschina.com>
Date: Mon, 22 Apr 2024 11:32:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org,
 jjohnson@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com
Cc: c_mkenna@qti.qualcomm.com, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <a4c2cb8c-dd80-457f-82b5-2eb58a9b55b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_203315_895362_6EDE1BA2 
X-CRM114-Status: GOOD (  12.35  )
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

On 2024/4/19 23:09, Jeff Johnson wrote:
> On 4/17/2024 1:17 AM, Su Hui wrote:
>>   	u8 peer_debug_trigger;
>> -	int ret;
>> +	int ret = 0;
> this is unnecessary since this will be written in all paths that lead to the
> return that reads it
Yes, this is my fault. I will remove this in v2 patch.
>>   
>>   	if (kstrtou8_from_user(user_buf, count, 0, &peer_debug_trigger))
>>   		return -EINVAL;
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
>>   out:
>>   	mutex_unlock(&ar->conf_mutex);
>> -	return count;
>> +	return ret ?: count;
>>   }
>>   
>>   static const struct file_operations fops_peer_debug_trigger = {
> I'd suggest as an alternate solution that this function is a good candidate
> for the the cleanup.h functionality. By scoping the mutex_lock() you can
> simply return at each error location, and remove the explicit mutex_unlock().

like guard(mutex)(&ar->conf_mutex)?

Maybe I can send a separate patch for this,  because there are more than 
one candidates

for the cleanup.h functionality.

> But I'd accept this with the initializer change removed as well since I don't
> think ath10k has any cleanup.h usages yet.

I will send v2 patch soon , thanks for your reply!

Su Hui




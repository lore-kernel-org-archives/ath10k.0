Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIam3-0003Xa-MD
 for ath10k@lists.infradead.org; Wed, 16 Sep 2020 16:59:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id z9so3797821wmk.1
 for <ath10k@lists.infradead.org>; Wed, 16 Sep 2020 09:59:13 -0700 (PDT)
Subject: Re: [PATCH] ath10k: sdio: remove reduntant check in for loop
References: <20200914191925.24192-1-alex.dewar90@gmail.com>
 <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <57efff54-7aa4-8220-c705-1fdf35b0099e@gmail.com>
Date: Wed, 16 Sep 2020 17:59:11 +0100
MIME-Version: 1.0
In-Reply-To: <c2987351e3bdad16510dd35847991c2412a9db6b.camel@nvidia.com>
Content-Language: en-US
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
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "kuba@kernel.org" <kuba@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

[snip]
> 'i' is only referenced once inside the loop to check boundary,
>
> the loop is actually iterating over cur_section, so i would make it
> clear in the loop statement, e.g.:
> Remove the break condition and the cur_section assignment at the end of
> the loop and use the loop statement to do it for you
>
> for (; cur_section; cur_section = next_section)
>
>
>>   		section_size = cur_section->end - cur_section->start;
>>   
>>   		if (section_size <= 0) {
>> @@ -2318,7 +2318,7 @@ static int
>> ath10k_sdio_dump_memory_section(struct ath10k *ar,
>>   			break;
>>   		}
>>   
>> -		if ((i + 1) == mem_region->section_table.size) {
> And for i you can just increment it inline:
> if (++i == ...)

Good suggestions! I've sent a v2 with these changes.

>      
>
>> +		if (i == mem_region->section_table.size) {
>>   			/* last section */
>>   			next_section = NULL;
>>   			skip_size = 0;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WswaS-0000bX-KE
 for ath10k@lists.infradead.org; Fri, 06 Jun 2014 16:01:49 +0000
Message-ID: <5391E5D7.1030302@candelatech.com>
Date: Fri, 06 Jun 2014 09:01:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k:  provide firmware crash info via debugfs.
References: <1401904902-5842-1-git-send-email-greearb@candelatech.com>
 <87bnu6msra.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnu6msra.fsf@kamboji.qca.qualcomm.com>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 06/05/2014 11:55 PM, Kalle Valo wrote:
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Store the firmware crash registers and last 128 or so
>> firmware debug-log ids and present them to user-space
>> via debugfs.
>>
>> Should help with figuring out why the firmware crashed.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> [...]
> 
>> +	dump_data->kernel_ver_code = LINUX_VERSION_CODE;
>> +	strncpy(dump_data->kernel_ver, VERMAGIC_STRING,
>> +		sizeof(dump_data->kernel_ver) - 1);
> 
> Other thing nice to have here is the kernel timestamp in the kernel log
> "[123456.4321]". How difficult would it be to add that to the dump?

It's easy to get the time-of-day, if that is what you mean.

I'll add that...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

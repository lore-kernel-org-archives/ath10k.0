Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFzaT-0005pG-6x
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 05:53:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5 2/7] ath10k: provide firmware crash info via debugfs
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <20140808202847.20713.41211.stgit@potku.adurom.net>
 <53E54E9E.4070605@candelatech.com>
Date: Sat, 9 Aug 2014 08:52:34 +0300
In-Reply-To: <53E54E9E.4070605@candelatech.com> (Ben Greear's message of "Fri, 
 8 Aug 2014 15:26:38 -0700")
Message-ID: <87ha1mw6ot.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 08/08/2014 01:28 PM, Kalle Valo wrote:
>
>> +
>> +	getnstimeofday(&timestamp);
>> +	dump_data->tv_sec = timestamp.tv_sec;
>> +	dump_data->tv_nsec = timestamp.tv_nsec;
>
> I wonder if we should take timestamp at crash time instead of
> crash-dump-gather time?

Good point, we definitely should. I'll change.

>>  int ath10k_debug_create(struct ath10k *ar)
>>  {
>> +	ar->debug.fw_crash_data = vzalloc(sizeof(ar->debug.fw_crash_data));
>> +	if (!ar->debug.fw_crash_data)
>> +		return -ENOMEM;
>> +
>
> That sizeof looks quite wrong.

Ouch, good catch! Will fix.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

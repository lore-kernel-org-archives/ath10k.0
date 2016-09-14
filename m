Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkBzx-0007Nk-2L
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 15:21:17 +0000
Message-ID: <57D9696B.10103@candelatech.com>
Date: Wed, 14 Sep 2016 08:14:51 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/21] ath10k: support logging ath10k_info as KERN_DEBUG
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-11-git-send-email-greearb@candelatech.com>
 <87k2eeef79.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87k2eeef79.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/14/2016 07:19 AM, Valo, Kalle wrote:
> greearb@candelatech.com writes:
>
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Helps keep messages off of (serial) console when
>> that is desired.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>
> Isn't /proc/sys/kernel/print exactly for this purpose? At least I recall
> using it.

I just wanted to hide some ath10k logs from the console, not all system logs.  I don't think
that /proc/sys/kernel/print has any granularity?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

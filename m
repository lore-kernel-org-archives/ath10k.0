Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZirx-0006dc-Tx
 for ath10k@lists.infradead.org; Fri, 25 Oct 2013 15:00:10 +0000
Message-ID: <526A8762.9050009@candelatech.com>
Date: Fri, 25 Oct 2013 07:59:46 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 <871u39iydt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <871u39iydt.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 10/25/2013 12:49 AM, Kalle Valo wrote:
> greearb@candelatech.com writes:

>>   	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>
>> +	ath10k_debug_init(ar);
>
> For symmetry would it make more sense to move ath10k_debug_destroy() to
> ath10k_core_unregister()? That way we could avoid adding a new function.
>

In my opinion, you should initialize such things as early as possible
so you don't have to worry so much about the various error cases leaving
things un-initialized.  I believe my patch accomplished that.

What new function are you planning to avoid?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

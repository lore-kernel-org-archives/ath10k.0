Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZv1m-0001zH-LL
 for ath10k@lists.infradead.org; Sat, 26 Oct 2013 03:59:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix un-initialized debug objects.
In-Reply-To: <526A8762.9050009@candelatech.com> (Ben Greear's message of "Fri, 
 25 Oct 2013 07:59:46 -0700")
References: <1382639166-25698-1-git-send-email-greearb@candelatech.com>
 <871u39iydt.fsf@kamboji.qca.qualcomm.com>
 <526A8762.9050009@candelatech.com>
Date: Sat, 26 Oct 2013 06:58:33 +0300
Message-ID: <877gd0fzti.fsf@kamboji.qca.qualcomm.com>
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

> On 10/25/2013 12:49 AM, Kalle Valo wrote:
>> greearb@candelatech.com writes:
>
>>>   	INIT_WORK(&ar->restart_work, ath10k_core_restart);
>>>
>>> +	ath10k_debug_init(ar);
>>
>> For symmetry would it make more sense to move ath10k_debug_destroy() to
>> ath10k_core_unregister()? That way we could avoid adding a new function.
>>
>
> In my opinion, you should initialize such things as early as possible
> so you don't have to worry so much about the various error cases leaving
> things un-initialized.  I believe my patch accomplished that.

Well, I again like symmetry and simplicity.

> What new function are you planning to avoid?

I would prefer not to create ath10k_debug_init().

What I was trying to suggest is this, I think it should fix the bug you
are seeing:

--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -738,8 +738,6 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
-       ath10k_debug_destroy(ar);
-
        flush_workqueue(ar->workqueue);
        destroy_workqueue(ar->workqueue);
 
@@ -986,6 +984,8 @@ void ath10k_core_unregister(struct ath10k *ar)
        ath10k_mac_unregister(ar);
 
        ath10k_core_free_firmware_files(ar);
+
+       ath10k_debug_destroy(ar);
 }
 EXPORT_SYMBOL(ath10k_core_unregister);

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve2ZB-0007BT-8I
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 12:50:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT 12/12] ath10k: add some debug prints
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
 <1383133346-8135-13-git-send-email-michal.kazior@tieto.com>
 <1383153399.9435.33.camel@joe-AO722>
Date: Wed, 6 Nov 2013 14:43:10 +0200
In-Reply-To: <1383153399.9435.33.camel@joe-AO722> (Joe Perches's message of
 "Wed, 30 Oct 2013 10:16:39 -0700")
Message-ID: <87a9hhsntt.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Joe Perches <joe@perches.com> writes:

> On Wed, 2013-10-30 at 12:42 +0100, Michal Kazior wrote:
>> Some errors were handled too silently.
>
> These aren't really debug prints.

Yeah, the patch title needs work.

>> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
> []
>> @@ -1860,8 +1862,10 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>>  		ath10k_do_pci_wake(ar);
>>  
>>  	ret = ath10k_pci_ce_init(ar);
>> -	if (ret)
>> +	if (ret) {
>> +		ath10k_err("could not initialize CE (%d)\n", ret);
>
> Rather than try to reinterpret the function name,
> perhaps it's better to simply emit the function name
> as is done most other places like:
>
> 		ath10k_err("ath10k_pci_ce_init failed: (%d)\n", ret);

I don't think that's any better. When function names change but people
forget to change the error message and then it's even more confusing.
And I prefer that a developer puts a bit more effort to the warning
message by writing it in english instead of just copying the function
name.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

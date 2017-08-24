Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkt6j-0006aW-7s
 for ath10k@lists.infradead.org; Thu, 24 Aug 2017 14:27:43 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: ath10k: fix napi_poll budget overflow
Date: Thu, 24 Aug 2017 14:27:02 +0000
Message-ID: <be0d2b7d-e498-64ac-282a-bf23d10a5b18@qti.qualcomm.com>
References: <1503438242-5657-1-git-send-email-ryanhsu@qti.qualcomm.com>
 <2cd00da66a6847c1829ed9edf7ad7009@euamsexm01a.eu.qualcomm.com>
In-Reply-To: <2cd00da66a6847c1829ed9edf7ad7009@euamsexm01a.eu.qualcomm.com>
Content-Language: en-US
Content-ID: <BF4FAE5D8C8D064F91D0C8766C9D87F2@qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>


On 08/24/2017 02:07 AM, Kalle Valo wrote:
> ryanhsu@qti.qualcomm.com wrote:
>
>> From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
>>
>> In napi_poll, the budget number is used to control the amount of packets
>> we should handle per poll to balance the resource in the system.
>>
>> In the list of the amsdu packets reception, we check if there is budget
>> count left and handle the complete list of the packets, that it will have
>> chances the very last list will over the budget leftover.
>>
>> So adding one more parameter - budget_left, this would help while
>> traversing the list to avoid handling more than the budget given.
>>
>> Reported-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
>> Fix-suggested-by: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
>>
>> Signed-off-by: Ryan Hsu <ryanhsu@qti.qualcomm.com>
> Was there a bug report about this? I can add a link to that and maybe also
> include the warning.

https://marc.info/?l=linux-netdev&m=149884047823870&w=2

-- 
Ryan Hsu
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

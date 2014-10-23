Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhIDl-0006ly-Sc
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 13:14:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 4/6] ath10k: make warm reset a bit safer and faster
References: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
 <1413807282-27951-5-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=P2XOaOsaVOj+=fEs=nGfhUCNQvDYx6qb=A=JRCnbQmg@mail.gmail.com>
Date: Thu, 23 Oct 2014 16:14:00 +0300
In-Reply-To: <CA+BoTQ=P2XOaOsaVOj+=fEs=nGfhUCNQvDYx6qb=A=JRCnbQmg@mail.gmail.com>
 (Michal Kazior's message of "Thu, 23 Oct 2014 10:27:57 +0200")
Message-ID: <871tpzq67b.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 20 October 2014 14:14, Michal Kazior <michal.kazior@tieto.com> wrote:
>> One of the problems with warm reset I've found is
>> that it must be guaranteed that copy engine
>> registers are not being accessed while being
>> reset. Otherwise in worst case scenario the host
>> may lock up.
>>
>> Instead of using sleeps and hoping the device is
>> operational in some arbitrary timeframes use
>> firmware indication register.
>>
>> As a side effect this makes driver
>> boot/stop/recovery faster.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>>
>> Notes:
>>     v2:
>>      * fix kernel panic on early fw crash due to CE not being fully initialized [Janusz]
>
> Marek reported he sees a memory leak and git bisect blames this patch.
> Please don't apply this patch yet.

Ok, thanks for letting me know. What about rest of the patches in the
patchset? I assume it's safe to apply them.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

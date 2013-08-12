Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8tPc-0003RW-Ml
 for ath10k@lists.infradead.org; Mon, 12 Aug 2013 14:48:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: cleanups
References: <1375949650-9699-1-git-send-email-michal.kazior@tieto.com>
 <87haevt20x.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 12 Aug 2013 17:47:33 +0300
In-Reply-To: <87haevt20x.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Mon, 12 Aug 2013 17:30:22 +0300")
Message-ID: <87d2pjt18a.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> This patchset contains a few non-functional clean
>> ups.
>>
>> Michal Kazior (4):
>>   ath10k: clean up monitor start code
>>   ath10k: use sizeof(*var) in kmalloc
>>   ath10k: clean up PCI completion states
>>   ath10k: print errcode when CE ring setup fails
>
> Thanks, all four applied.

Sorry, I was too fast and need to take that back. I now see this
warning:

drivers/net/wireless/ath/ath10k/pci.c:951: WARNING: line over 80 characters

I dropped the patches, please send v2.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

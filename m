Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWQee-0007fe-TT
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 12:56:49 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: fixes 2013-10-15
References: <1381858196-17000-1-git-send-email-michal.kazior@tieto.com>
 <8761sybbye.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 16 Oct 2013 15:56:22 +0300
In-Reply-To: <8761sybbye.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 15 Oct 2013 21:55:53 +0300")
Message-ID: <87bo2p74sp.fsf@kamboji.qca.qualcomm.com>
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
>> This is a bunch of fixes I've had queued up for
>> some time now. I was reluctant to send them
>> without some additional checks and because some of
>> the fixes are not ideal. At least we can get a
>> discussion going if anything raises any serious
>> concern.
>>
>>
>> Michal Kazior (7):
>>   ath10k: prevent starting monitor without a vdev
>>   ath10k: add sanity checks for monitor management
>>   ath10k: fix endianess in prints
>>   ath10k: fix NSS reporting in RX
>>   ath10k: fix NULL deref upon early FW crash
>>   ath10k: fix device initialization routine
>>   ath10k: fix FW crashes on heavy TX on 10.1.389 AP FW
>
> I get few long line warnings:
>
> drivers/net/wireless/ath/ath10k/pci.c:1842: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1844: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1847: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1848: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1856: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1875: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1877: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/pci.c:1883: WARNING: line over 80 characters
> drivers/net/wireless/ath/ath10k/mac.c:2284: WARNING: line over 80 characters

Michal, if it's ok for you I'll submit v2 of this patchset. I'll fix the
long line warnings and also I do small cleanup to the warm reset code.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

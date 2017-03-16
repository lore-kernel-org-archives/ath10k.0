Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coRn7-0005wc-Mi
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 09:33:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v4 06/21] ath10k: sdio support
Date: Thu, 16 Mar 2017 09:33:26 +0000
Message-ID: <87y3w5tvkq.fsf@kamboji.qca.qualcomm.com>
References: <1487693741-10042-1-git-send-email-erik.stromdahl@gmail.com>
 <1487693741-10042-7-git-send-email-erik.stromdahl@gmail.com>
 <8760jh2uy8.fsf@kamboji.qca.qualcomm.com>
 <871su52th2.fsf@kamboji.qca.qualcomm.com>
 <2528f323-6ec7-915c-d98b-615db04510e9@gmail.com>
 <877f3qyc5g.fsf@kamboji.qca.qualcomm.com>
 <29c3dd40-c3ac-746e-d8ef-cb072c58578a@gmail.com>
In-Reply-To: <29c3dd40-c3ac-746e-d8ef-cb072c58578a@gmail.com> (Erik
 Stromdahl's message of "Wed, 15 Mar 2017 19:01:12 +0100")
Content-Language: en-US
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

>> There seems to be same pattern for reading four bytes, what if we should
>> add a helper for that? Something like ath10k_sdio_read32()? It could
>> handle the kmalloc and switch endianess also.
>>
>> But please don't make any chances to sdio.c for the moment, let me
>> submit v5 first.
>>
> I notice that you have submitted v5 (and v6) of the sdio patches. Great!
>
> I assume you will add them to master-pending soon so I will try out
> everything (usb too) as soon as they are on master-pending.

v6 is now in master-pending.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

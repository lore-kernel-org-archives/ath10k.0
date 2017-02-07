Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cb72z-0004Mp-M5
 for ath10k@lists.infradead.org; Tue, 07 Feb 2017 14:47:13 +0000
Message-ID: <5899DDD7.7000605@candelatech.com>
Date: Tue, 07 Feb 2017 06:46:47 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
 <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
 <87y3xi4b28.fsf@qca.qualcomm.com>
In-Reply-To: <87y3xi4b28.fsf@qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>, Adrian Chadd <adrian@freebsd.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeusz.slawinski@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On 02/07/2017 01:14 AM, Valo, Kalle wrote:
> Adrian Chadd <adrian@freebsd.org> writes:
>
>> Removing this method makes the diff to FreeBSD larger, as "vif" in
>> FreeBSD is a different pointer.
>>
>> (Yes, I have ath10k on freebsd working and I'd like to find a way to
>> reduce the diff moving forward.)
>
> I don't like this "(void *) vif->drv_priv" style that much either but
> apparently it's commonly used in Linux wireless code and already parts
> of ath10k. So this patch just unifies the coding style.

Surely the code compiles to the same thing, so why add a patch that
makes it more difficult for Adrian and makes the code no easier to read
for the rest of us?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

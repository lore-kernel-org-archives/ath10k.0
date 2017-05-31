Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG3KT-0006PO-QX
 for ath10k@lists.infradead.org; Wed, 31 May 2017 13:06:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] Per chain RSSI reporting
Date: Wed, 31 May 2017 13:05:59 +0000
Message-ID: <87h901mb1g.fsf@kamboji.qca.qualcomm.com>
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
 <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
In-Reply-To: <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
 (Norik Dzhandzhapanyan's message of "Sat, 27 May 2017 02:09:22 +0000")
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
To: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Norik Dzhandzhapanyan <norikd@ethertronics.com> writes:

> Inserting the smoothing function here is motivated by what we see as
> 'spikes' in rssi data under weak rssi conditions. Figured its best to
> get rid of the 'bogus' data as close to the source as possible. Also
> to minimize the impact on the changes.
>
> I believe the averaging that happens at higher levels is based on EWMA
> macros in net/mac80211/sta_info.c which not wifi card/chipset
> specific. Didn't want to touch that since other cards seem to not have
> this spikey behavior. And, it doesnt seem to have an effect on the
> ath10k data anyway (iw reports the exact same values for both).
>
> I wonder if it would be acceptable to pass a module load time
> parameter which would indicate an average factor with 0 (as default)
> to indicate no averaging?

I don't know what Johannes thinks, but in my opinion this kind of
smoothing should be in mac80211 and not in drivers. The driver should be
as simple as possible.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

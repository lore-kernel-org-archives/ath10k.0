Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cYy5h-0003eb-JC
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 16:49:07 +0000
Subject: Re: 9984 VHT
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
 <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
Date: Wed, 1 Feb 2017 08:48:42 -0800
MIME-Version: 1.0
In-Reply-To: <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 01/30/2017 02:28 AM, Sebastian Gottschall wrote:
> Hello
>
> with recent 9984 firmares vht160 seem to crash the firmware itself for no reason i see.
> is there any internal structure change in these newer firmwares we need to consider?
> i also tested the even more recent firmware firmware-5.bin_10.4-3.4-00068 from codeaurora. this one doesnt crash but the vdev_start returns with a error
>
> i compared the more recent wmi headers from the qca drivers, but wasnt able to find anything which could explain the behaviour
>
> Sebastian
>
>

Hello Sebastian,

Could you share the hostapd/supplicant config file you are using?

And, what kernel (or backports kernel) are you using?  I'd like to
see how 160Mhz works on my firmware....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

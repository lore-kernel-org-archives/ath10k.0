Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQbfn-0004Fa-D2
 for ath10k@lists.infradead.org; Fri, 01 Nov 2019 18:29:24 +0000
Received: by mail-oi1-x231.google.com with SMTP id i185so8936813oif.9
 for <ath10k@lists.infradead.org>; Fri, 01 Nov 2019 11:29:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <bb62015e-d097-f54c-56ce-000d0b18a5ac@candelatech.com>
References: <CAKR_QVJ2eHrESLOEqiKxbjr0SoZh3oJydtgcebBOXSpspbquWA@mail.gmail.com>
 <bb62015e-d097-f54c-56ce-000d0b18a5ac@candelatech.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Fri, 1 Nov 2019 19:29:21 +0100
Message-ID: <CAKR_QVK8EUnL-dUt9K-1H6Ah7=ZTxs=Eq=gwvk5R_zeEQX0eeQ@mail.gmail.com>
Subject: Re: [RFC] ath10k: interface combination with monitor
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Tried this fw: https://www.candelatech.com/downloads/firmware-2-ct-full-community-21.bin
Used ath10k driver as there is no ct driver for 5.4 yet.

Same as with QCA firmware

On 01/11/2019, Ben Greear <greearb@candelatech.com> wrote:
> On 11/1/19 10:03 AM, Tom Psyborg wrote:
>> Hi
>>
>> Is there a way to run monitor mode interface independent on STA/AP
>> interface presence or their state?
>> I am using airodump-ng/airmon-ng and I've noticed that while mon
>> interface is brought up airodump-ng is unable to find any beacons
>> unless sta interface is brought down. That is with QCA9880 devices,
>> while with QCA9377 airodump-ng only finds beacons if the sta interface
>> is associated to an AP.
>> Does this need firmware change to work or driver changes are sufficient?
>>
>
> I would expect it to work.  Have you tried -ct firmware on 9880 in this
> manner?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

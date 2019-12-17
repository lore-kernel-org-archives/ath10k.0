Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihLx2-0001Rb-IK
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 23:08:26 +0000
Received: by mail-oi1-x241.google.com with SMTP id h19so55956oih.4
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 15:08:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a95e7f6d-1cb8-3188-aea4-233dce6f9330@candelatech.com>
References: <20191216220747.887-1-greearb@candelatech.com>
 <a2af03e9-8b53-b297-467b-d0f07b8a002b@newmedia-net.de>
 <b5d63d96-4ba6-bbab-bf1c-a61c6c437f37@newmedia-net.de>
 <80700614-679a-336e-bd9a-e88622e75c9a@candelatech.com>
 <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
 <CAMrEMU-vGB8uR-JZbD2vj4vXgWNHfFqcbsqB=gOqBBDZWGkzQA@mail.gmail.com>
 <11290a30-46e8-638e-4110-86e6b2eb3d3f@candelatech.com>
 <CAKR_QV+xNbAzzw12x3Ku49bHnERTxYRAK8AfUSwp_uOgNMbY4Q@mail.gmail.com>
 <a95e7f6d-1cb8-3188-aea4-233dce6f9330@candelatech.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 18 Dec 2019 00:08:22 +0100
Message-ID: <CAKR_QVL0P4qYidtqLwhhacCOpx2iq+4RRhTXbGhfRnf2PUj5tA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
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
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Justin Capella <justincapella@gmail.com>

On 17/12/2019, Ben Greear <greearb@candelatech.com> wrote:
> On 12/17/19 10:29 AM, Tom Psyborg wrote:
>> On 17/12/2019, Ben Greear <greearb@candelatech.com> wrote:
>>> On 12/17/19 8:23 AM, Justin Capella wrote:
>>>> I believe someone recently submitted a patch that defined noise floors
>>>> per band (2/5).
>>>
>>> I looked at using the real noise floor.  Our radio was reporting a noise
>>> floor of around -102,
>>> where the hard-coded default is -95.  This of course would make the
>>> reported
>>> RSSI lower by 7db
>>> in that case.  I am not sure that is correct.
>>>
>>
>> Hi
>>
>> I am getting similar NF values with all my ath10k devices, I thought
>> default was changed since ath9k from -95 to -115 just like in the
>> vendor driver? There were some discussions about it on mailing list.
>> On some channels (5Ghz) the value goes down to about -107, even saw
>> -110 once.
>>
>
> If you use ath9k and ath10k on same channel/environment, do you see similar
> RSSI reported (especially with the ath10k patch I just posted)?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>

Nope. RSSI values are quite different between two cards. Applying this
patch also made no difference on ath10k card, but this might be due to
the fact the network wasn't setup (so no data passed through) in order
to keep tx rx rates at 6 Mbps.

First I put AR9462 card in Archer C7 and connect to Litebeam5AC (CH36,VHT80)

commands output from archer:

iwinfo:

signal: -65dBm noise: -94dBm txpower: 14dBm

iw wlan1 station dump:

signal: -65 [-69, -67] dBm
signal avg: -65 [-68, -67] dBm

with the default 14dBm power the RSSI in Litebeam was -72dBm

Then I put QCA9880 in archer and connected to the same AP:

commands output from archer:

iwinfo:

signal: -58dBm noise: -102dBm txpower: 23dBm

iw wlan0 station dump:

signal: -59 [-65, -64, -62] dBm
signal avg: -58 [-65, -63, -62] dBm

RSSI of the card reported in Litebeam -63dBm (very inconsistent
between wifi restarts on archer, -65, -67 even -69 dBm, and no
software reboot would restore card's full power, only cold boot)

next I lowered the power of the card to 14dBm to match AR9462

iwinfo:

signal: -57 dBm noise: -101 dBm txpower: 14 dBm

iw wlan0 station dump

signal: -57 [-62, -62, -61] dBm
signal avg: -57 [-62, -62, -61] dBm

now the RSSI in litebeam dropped to approx. -75dBm

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

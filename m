Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8COm-0005s8-JV
 for ath10k@lists.infradead.org; Wed, 01 Jun 2016 20:05:53 +0000
Subject: Re: Please don't puke: Modifying Frame Version, Beacon and
 Probe-Response values
References: <loom.20160531T102350-834@post.gmane.org>
 <CA+BoTQ=NjABLfzMjc-5+wKEvesKsyMJDheZRu8_eR=XD8zic7Q@mail.gmail.com>
 <CAJ-VmokXt-V9JGL4E4jcL+u+gfvVJ-rFGP5H1bzTFkUr39mhtQ@mail.gmail.com>
 <855019245.2902911.1464780850322.JavaMail.yahoo@mail.yahoo.com>
 <CAJ-VmokmAduSkLar6vhL58CPU9BkbQGVeqiqneJRMgSNtuJSMw@mail.gmail.com>
 <574F379E.7050704@candelatech.com>
 <CAJ-Vmon5N9FtRR-B-DYYXaVweR8G1cycDX6KtQV_bFhT0H2bQw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <574F398B.3020909@candelatech.com>
Date: Wed, 1 Jun 2016 12:37:47 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmon5N9FtRR-B-DYYXaVweR8G1cycDX6KtQV_bFhT0H2bQw@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Joerg Pommnitz <pommnitz@yahoo.com>

On 06/01/2016 12:33 PM, Adrian Chadd wrote:
> On 1 June 2016 at 12:29, Ben Greear <greearb@candelatech.com> wrote:
>> On 06/01/2016 12:18 PM, Adrian Chadd wrote:
>>>
>>> Hi,
>>>
>>> Likely a mix of both. Eg, the RX filter stuff as mentioned above may
>>> mean that you need to listen to /all/ frames for a BSS, rather than
>>> just say data and beacon frames. If the beacon frame matching logic
>>> checks the frame version, you need to listen to /all/ of the frames.
>>>
>>> For power management things, it's likely none of that will work, so
>>> you can't use things like auto-sleep based on beacon traffic / timers
>>> / TIM bitmap - you'd have to keep the NIC awake all the time.
>>
>>
>> I'm guessing little of this is in hardware, aside from rx filters,
>> so probably a few tweaks to the firmware would handle much of this...
>
> Right.
>
>> And, if for AP mode, then the NIC is always awake anyway, right?
>
> Right. But say, P2P/STA mode and no AP mode? Different story. (I'm
> assuming he has clients AND APs..)

Yeah, I'm less sure about that.  I still bet a few firmware tweaks
would resolve issues...surely the hardware is not baking a lot of
wifi frame constants into it's ROM...

> Also, for ath10k chips, maybe it'll all need to be in raw mode? I
> don't know what the hardware encap/decap engines will do if you try
> passing it intentionally different frames like this.

Beacons and probe responses are not encrypted anyway, so probably doesn't
need to disable hw-crypt.  Might be a fairly long tail of effort to
find every last place that makes some assumption on the values
though...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

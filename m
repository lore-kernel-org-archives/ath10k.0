Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHyoO-0003Me-G3
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 16:55:25 +0000
Message-ID: <530B7966.4090209@candelatech.com>
Date: Mon, 24 Feb 2014 08:55:02 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have luck with WLE900VX?
References: <5307F7D3.1030703@candelatech.com>
 <87fvn8trh2.fsf@kamboji.qca.qualcomm.com> <530B74E1.8040908@candelatech.com>
In-Reply-To: <530B74E1.8040908@candelatech.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/24/2014 08:35 AM, Ben Greear wrote:
> On 02/24/2014 08:17 AM, Kalle Valo wrote:

>>> First, with the official firmware 10.1.467.1-1 it immediately crashes on startup.
>>> I don't have that firmware source, so I don't know why it crashes.
>>> I wasn't even trying to create more than the default wlanX station.
>>
>> Is that with stock ath10k driver or does ath10k contain any custom
>> changes?
> 
> It had custom changes, and at least one patch that might cause
> trouble:  The one that doubled the number of key cache entries that
> I posted a few days ago.
> 
> I can try with all that backed out.

Ok, with my ath10k changes backed out, the .467.1-1 firmware appears
to come up OK and the MAC address shows up right, NIC claims 3x3, etc.

Same driver software, on my .389 firmware, and MAC is not right, etc.

So, it seems my firmware is not supporting this NIC :(

Also, please do not apply that key-cache patch I posted a few days
ago...looks like upstream firmware may not like it.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

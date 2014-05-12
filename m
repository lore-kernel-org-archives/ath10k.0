Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjhUs-0005nT-5E
 for ath10k@lists.infradead.org; Mon, 12 May 2014 04:05:51 +0000
Message-ID: <53704888.9060602@candelatech.com>
Date: Sun, 11 May 2014 21:05:28 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
In-Reply-To: <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 05/11/2014 08:54 PM, Avery Pennarun wrote:
> On Sun, May 11, 2014 at 11:09 PM, Ben Greear <greearb@candelatech.com> wrote:
>> Can you reproduce with any other type of station
>> device?
>
> I'll try.  It's a little tricky since it seems to involve running
> Chrome, etc, rather than my usual command-line tests for which I have
> a wider variety of clients.
>
>> Also, have you tried sniffing with a third device to see if
>> the AP actually puts the ICMP responses on the air?
>
> I did try that.  As far as I can tell, the ICMP responses are simply
> not being sent at all.

I haven't dug into many of the stats yet, but it's possible the
ath10k debugfs file would show some types of transmit errors in this case?

Might be interesting to see how long it takes the AP to generate
the tx status response for the transmitted ICMP packets.  My firmware
has some extended tx status, but I'm not sure it has anything overly
useful for your case...I was mostly concerned with the tx rate reporting
when writing it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

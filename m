Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjj60-0001Eh-Vn
 for ath10k@lists.infradead.org; Mon, 12 May 2014 05:48:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Receiving your own wifi beacons
References: <CAHqTa-29WHKcUCYbPiC93mZCdJnHP3Fc+r_SHXYgKHSJvz-Pvw@mail.gmail.com>
 <87wqdriorw.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-3dREsfjYR_2rpDxjeKEy8ZwqEZ9yXXYtoB8J92AqGB9A@mail.gmail.com>
Date: Mon, 12 May 2014 08:47:50 +0300
In-Reply-To: <CAHqTa-3dREsfjYR_2rpDxjeKEy8ZwqEZ9yXXYtoB8J92AqGB9A@mail.gmail.com>
 (Avery Pennarun's message of "Mon, 12 May 2014 01:29:57 -0400")
Message-ID: <87fvkfim49.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Mon, May 12, 2014 at 12:50 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Avery Pennarun <apenwarr@gmail.com> writes:
>>> We're currently investigating a problem where the ath10k AP will
>>> seemingly stop sending out beacons, with no other obvious symptoms
>>> (hostapd is still working fine).  There's not much I can report
>>> because, of course, no symptoms.
>>
>> Can you still provide more information about the problem, please? How
>> often do you see it? What kind of setup do you have? With or without
>> DFS? How many BSS?
>
> It doesn't happen often.  We haven't been able to reproduce it in a
> lab, only at a small number of our test sites at people's homes, and
> even then only rarely (although some people apparently experience it
> more than others).

Ok, so this will a tricky problem to solve.

> We aren't using DFS (does ath10k even support DFS yet?). 

Yes, ath10k supports DFS on ETSI channels but only with one BSS. Michal
has been working on mac80211 DFS with multiple BSS support and he is
getting close to finish that. And I'm hoping to get FCC and MKK support
to ath.ko soon.

> We are using 20 MHz channel, 5 GHz for all these test users. There is
> only a single BSS configured for our APs right now, although other APs
> may be nearby.

The only thing out of ordinary is the 20 MHz channel, as I think most of
users use VHT80 configuration. But I'm having hard time to believe that
would be reason why only you see it. (This is the first time I hear
about a problem like this with ath10k.)

> Based on Michal's suggestion, we've added some code to enable minimal
> debug messages from the firmware and log whenever a beacon is sent.
> This seems to work, so we'll deploy it to all our test users in the
> next week or so and, if the problem triggers, at least this should
> give us a clue (such as whether the firmware thinks it's still sending
> beacons, and exactly what the dmesg looks like at the time that it
> stops).

Good.

> If you have any other suggestions, please let us know.

Do you know if interrupts are still working when the problem appears?
What about other ath10k functionality and driver's communication to the
firmware, is that working normally? For example, can you retrieve stats
from firmware when the issue happens?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

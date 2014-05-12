Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjioy-0007Ts-Dz
 for ath10k@lists.infradead.org; Mon, 12 May 2014 05:30:41 +0000
Received: by mail-ve0-f180.google.com with SMTP id db12so7959984veb.25
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 22:30:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wqdriorw.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-29WHKcUCYbPiC93mZCdJnHP3Fc+r_SHXYgKHSJvz-Pvw@mail.gmail.com>
 <87wqdriorw.fsf@kamboji.qca.qualcomm.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 12 May 2014 01:29:57 -0400
Message-ID: <CAHqTa-3dREsfjYR_2rpDxjeKEy8ZwqEZ9yXXYtoB8J92AqGB9A@mail.gmail.com>
Subject: Re: Receiving your own wifi beacons
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

On Mon, May 12, 2014 at 12:50 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Avery Pennarun <apenwarr@gmail.com> writes:
>> We're currently investigating a problem where the ath10k AP will
>> seemingly stop sending out beacons, with no other obvious symptoms
>> (hostapd is still working fine).  There's not much I can report
>> because, of course, no symptoms.
>
> Can you still provide more information about the problem, please? How
> often do you see it? What kind of setup do you have? With or without
> DFS? How many BSS?

It doesn't happen often.  We haven't been able to reproduce it in a
lab, only at a small number of our test sites at people's homes, and
even then only rarely (although some people apparently experience it
more than others).  We aren't using DFS (does ath10k even support DFS
yet?).  We are using 20 MHz channel, 5 GHz for all these test users.
There is only a single BSS configured for our APs right now, although
other APs may be nearby.

Based on Michal's suggestion, we've added some code to enable minimal
debug messages from the firmware and log whenever a beacon is sent.
This seems to work, so we'll deploy it to all our test users in the
next week or so and, if the problem triggers, at least this should
give us a clue (such as whether the firmware thinks it's still sending
beacons, and exactly what the dmesg looks like at the time that it
stops).

If you have any other suggestions, please let us know.

Thanks!

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x22b.google.com ([2607:f8b0:400d:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3eEY-0006wN-0T
 for ath10k@lists.infradead.org; Sun, 06 Jul 2014 04:39:26 +0000
Received: by mail-qc0-f171.google.com with SMTP id w7so2718895qcr.30
 for <ath10k@lists.infradead.org>; Sat, 05 Jul 2014 21:39:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53B8C4DF.5000308@candelatech.com>
References: <53B808BF.8070000@candelatech.com>
 <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
 <53B8C4DF.5000308@candelatech.com>
Date: Sat, 5 Jul 2014 21:39:04 -0700
Message-ID: <CAJ-Vmo=tjqCAns3N2_PY08r6A85Q9e8CoSWCV7g5KCQHRmqN-g@mail.gmail.com>
Subject: Re: Question on beacon-miss handling.
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 5 July 2014 20:39, Ben Greear <greearb@candelatech.com> wrote:
> On 07/05/2014 07:14 PM, Adrian Chadd wrote:
>>
>> Where is it in the firmware again?
>
>
> wlan_swbmiss_offload.c
>
>
>> The beacon miss stuff is a little .. odd. Mostly because there's only
>> one (and maybe two) timers for it and they're a pain in the ass to
>> configure correctly. Having it scale (correctly) to more than two
>> vdevs may be a little challenging.
>
>
> I've seen other funny stuff where an AP will crash hard(-ish?) and the
> associated stations
> take a long time to figure out their AP is dead.  Could be related to this
> maybe..or maybe was something else.  I have not investigated closely.
>
> I'd be happy to have all the beacon miss stuff move to the driver..seems
> a waste of limited resources in the firmware.

Think about it in terms of "minimising how much the host is woken up."

That's what the target market of the STA firmware for this chip is
thinking about.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

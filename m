Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpDxG-0004tl-1I
 for ath10k@lists.infradead.org; Tue, 27 May 2014 09:45:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: FYI: msdu-desc must be multiple of 8.
References: <53729DED.6000104@candelatech.com>
 <CAHqTa-2OCz30cetjY3pALup-e0WL=YRLOkrB3Q6QmSyQBxdvhQ@mail.gmail.com>
 <5372A1A7.2080602@candelatech.com>
 <CAHqTa-3xqtoU+hTazpRJZCMQX27Uyyi0HFjkJ9LvrGCd2Mv4vg@mail.gmail.com>
Date: Tue, 27 May 2014 12:45:24 +0300
In-Reply-To: <CAHqTa-3xqtoU+hTazpRJZCMQX27Uyyi0HFjkJ9LvrGCd2Mv4vg@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 13 May 2014 20:17:55 -0400")
Message-ID: <87bnujblmz.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Tue, May 13, 2014 at 6:50 PM, Ben Greear <greearb@candelatech.com> wrote:
>> As an aside, if you do manage to crash firmware in this manner, it also
>> takes down the host when it tries to clean up the stale tx buffers.  Possibly
>> that bug is just due to some of my own patches, but might be worth investigating
>> some day when I have more time and a cleaner tree...
>
> At least on my boxes, firmware crashes lead to kernel panics pretty
> often, say 1/3 of the time.  There appear to be lots of ways the
> cleanups are still not happening properly on a firmware crash.

I just merged a patch from Michal which I think is related:

7147a13135ee ath10k: protect src_ring state with ce_lock in tx_sg()

Did that help? If not, any chance to get more info? I know these kind of
crashes don't usually provide much information, but even small hints
help.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

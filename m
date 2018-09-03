Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwqtC-00005n-2T
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 15:35:45 +0000
Received: by mail-qt0-x22b.google.com with SMTP id x7-v6so975315qtk.5
 for <ath10k@lists.infradead.org>; Mon, 03 Sep 2018 08:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1533724802-30944-1-git-send-email-wgong@codeaurora.org>
 <1533724802-30944-3-git-send-email-wgong@codeaurora.org>
 <87sh3pdtpg.fsf@toke.dk>
 <f185ab8722e84c959b375e606d25a29b@aptaiexm02f.ap.qualcomm.com>
 <87mutue4y8.fsf@toke.dk>
 <ef7b317006964c0fa72763bbfc5149e5@aptaiexm02f.ap.qualcomm.com>
 <CANEJEGvcj9gPT8yy++qvi3hz3t9pAXyeUves06gr+ADfn9Ouhg@mail.gmail.com>
 <1535967508.3437.31.camel@sipsolutions.net> <87in3m25uu.fsf@toke.dk>
 <1535975240.3437.61.camel@sipsolutions.net> <878t4i1z74.fsf@toke.dk>
 <CAA93jw6MQD70XatAmjG-OwVa_Rn5Ey-5Ni22iTCPARaH+KjnJA@mail.gmail.com>
In-Reply-To: <CAA93jw6MQD70XatAmjG-OwVa_Rn5Ey-5Ni22iTCPARaH+KjnJA@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 3 Sep 2018 08:35:18 -0700
Message-ID: <CAA93jw6G6-zX7ZcVR_REp9ir-Ns2VjEXWe_1Da1uRvkE+KRYZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi
 chips
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
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: wgong@qti.qualcomm.com, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, grundler@google.com, wgong@codeaurora.org, Johannes Berg <johannes@sipsolutions.net>

While I'm being overly vague and general...

* Doing some form of ack compression (whether in the tcp stack or in
mac80211) seems useful. It's really
hard to fill 4Mbytes one way and the needed number of acks the other.
I'd also pointed out (on some thread on the make-wifi-fast list that I
can't find right now) that drivers had a tendency to eat an entire
txop for that first single ack and ping pong between empty and full on
a one way tcp benchmark.

* Similarly grabbing air during the contention window. If the sender
is grabbing 3x as much air as the reciever

(A1 A2 A3 B1 A4 B2)

* I know of one org that upped the codel target value for 802.11ac
with decent results but I can't talk about it...
(sort of why I asked for a cap). My problem with decreasing the pacing
shift is that it makes for less interleaving (I think! have to look),
where increasing the target compensates for more jittery networks.
('course my overall theme of my prior post was to reduce jittery
networks with less buffering and smaller txops overall)

* Is this a two device test? or a test through an AP?

Looking over this thread, I see a suggestion is to expose the pacing
rate via a sysctl. I don't think there's
any one answer, either, but I'm not sure this is the right variable to
expose. Perhaps a tunable for
latency that might (one day) look at multiple variables and decide?

Getting this more right is really a job for an algorithm of
minstrel-like complexity.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

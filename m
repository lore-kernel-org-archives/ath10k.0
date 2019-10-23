Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNNse-0002Kz-Ba
 for ath10k@lists.infradead.org; Wed, 23 Oct 2019 21:09:21 +0000
Received: by mail-lf1-f72.google.com with SMTP id v204so2672116lfa.0
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2019 14:09:11 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v4 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <CA+iem5vU-K-+sSSeNugy5ZZF_nH5vuaXW3J_WC=1WWhdkHOgjw@mail.gmail.com>
References: <157148503415.2989444.7391437309981941226.stgit@toke.dk>
 <157148503865.2989444.7118792679603045723.stgit@toke.dk>
 <CA+iem5sy16=xMZjJi1nKHrxP_xWHk-86G=ZLwtMMb04EOt5tQA@mail.gmail.com>
 <871rv5ovwr.fsf@toke.dk>
 <CA+iem5tZ95Jd9htLEdAJMubuFeWeUibK9MhTnTHLWNucX6_cRg@mail.gmail.com>
 <87tv7znact.fsf@toke.dk> <87lftbn60t.fsf@toke.dk>
 <CA+iem5vU-K-+sSSeNugy5ZZF_nH5vuaXW3J_WC=1WWhdkHOgjw@mail.gmail.com>
Date: Wed, 23 Oct 2019 23:09:08 +0200
Message-ID: <877e4vmaob.fsf@toke.dk>
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
To: Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Kan Yan <kyan@google.com> writes:

>>
>> Aha! Turns out I was doing the sta lookup completely wrong in
>> ieee80211_report_used_skb(); so anything frames that were dropped and
>> went through there would not get its airtime subtracted correctly. Will
>> send a v6 with a fix :)
>
> Awesome, thanks! That looks very promising.  The symptom I see with
> previous patch is the interface's pending airtime count looks fine, but the
> station's airtime get wrong, either due to airtime is credited to the wrong
> station or wrong AC.

Right, if the interface count is fine that means it's not a missing call
to the subtraction. So hopefully it will be fixed with v6 :)

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

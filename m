Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSfRX-0002RF-AA
 for ath10k@lists.infradead.org; Thu, 07 Nov 2019 10:55:12 +0000
Received: by mail-ed1-f70.google.com with SMTP id j21so1105690edv.20
 for <ath10k@lists.infradead.org>; Thu, 07 Nov 2019 02:55:07 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 0/4] Add Airtime Queue Limits (AQL) to mac80211
In-Reply-To: <CA+iem5s6jDNR+yA21UB_zJiZeVxix_QaO6RYw6sN69j2859zFw@mail.gmail.com>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <CA+iem5s6jDNR+yA21UB_zJiZeVxix_QaO6RYw6sN69j2859zFw@mail.gmail.com>
Date: Thu, 07 Nov 2019 11:55:05 +0100
Message-ID: <874kzggdme.fsf@toke.dk>
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

> Patchset v6 works for me with ath10k driver.  AQL does its job as
> expected and tests show very significant reduction in latency in
> congested environment. The txq stuck issue in patchset v4 got fixed.

Awesome! Thank you for testing!

> However, the device's total pending airtime count still underflows
> sometimes. Even though it doesn't cause apparent side effect, there is
> some issue with the pending airtime update and needs further
> debugging.

Huh, it *under*flows? That's... interesting. Cloned SKBs? Or maybe the
tx_time_est field is being set in some other place?

Could I get you to add a dump_stack() to the underflow test so we can
get an idea of where that happens?

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

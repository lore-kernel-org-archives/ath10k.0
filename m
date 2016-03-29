Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1akw4A-0006fT-N3
 for ath10k@lists.infradead.org; Tue, 29 Mar 2016 16:00:29 +0000
Subject: Re: [RFC] ath10k: implement dql for htt tx
References: <1458898743-21118-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQk7q7VerNC1KZK49REHn9rfo6sG5zW54P=-K3XkOL77pQ@mail.gmail.com>
 <CAA93jw7BEsEOP8O2BQFXUibkGzkzBZuyWxBxs5XDCZmOt6D+Qg@mail.gmail.com>
 <CA+BoTQnDtWNGQGkBNeBGSrjkjQc4dFuivQTL=0_1D+ooE-9+RQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56FAA518.2000805@candelatech.com>
Date: Tue, 29 Mar 2016 08:54:00 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnDtWNGQGkBNeBGSrjkjQc4dFuivQTL=0_1D+ooE-9+RQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/29/2016 12:49 AM, Michal Kazior wrote:

>> if you are getting a pure codel result of 160ms, that means the
>> implementation is broken. But I think (after having read your
>> description twice), the baseline result today of 160ms of queuing was
>> with a fq_codel *qdisc* doing the work on top of huge buffers,
>
> Yes. The 160ms is with fq_codel qdisc with ath10k doing DQL at 6mbps.
> Without DQL ath10k would clog up all tx slots (1424 of them) with
> frames. At 6mbps you typically want/need a handful (5-10) of frames to
> be queued.

Have you actually verified you can use all tx slots?  The way the
firmware uses it's tx buffers I think you may not be able to actually
do that...and in practice, you will get a lot fewer usable tx-buffers
than configured....

THanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

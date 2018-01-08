Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.toke.dk ([52.28.52.200])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYbxp-00035W-4z
 for ath10k@lists.infradead.org; Mon, 08 Jan 2018 18:16:03 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [Make-wifi-fast] [PATCH] ath10k: Add independent prio sta queue
In-Reply-To: <20180105105317.GA17563@nems_nctu_lu>
References: <20180105105317.GA17563@nems_nctu_lu>
Date: Mon, 08 Jan 2018 19:15:36 +0100
Message-ID: <87efn0tdx3.fsf@toke.dk>
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
To: Louie Lu <git@louie.lu>, ath10k@lists.infradead.org, make-wifi-fast@lists.bufferbloat.net

> Using what I understand now, I using aid to select which txq will be
> priority and sent out first. But when I testing this code with iperf,
> it is not working as I think. 2 station both sending -b 400M -t 0 packet,
> (maximum about 250M)I  exepct the station I setup in param will take all the
> bandwidth, but the result is 120M/120M, where did I get wrong?

IIRC, ath10k has two places it feeds packets to the firmware. You
probably need to change the other one as well...

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

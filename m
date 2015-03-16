Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXcS4-0003ca-6g
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 21:21:32 +0000
Message-ID: <55074946.2040200@candelatech.com>
Date: Mon, 16 Mar 2015 14:21:10 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k tx99-like test mode?
References: <023401d0602b$0b3139a0$2193ace0$@tranzeo.com>
In-Reply-To: <023401d0602b$0b3139a0$2193ace0$@tranzeo.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: mrex@tranzeo.com
Cc: ath10k@lists.infradead.org

On 03/16/2015 01:51 PM, mrex@tranzeo.com wrote:
> Ben,
> =

> The tx99 feature has the benefit of not needing any client or traffic to =
be
> passed for a power meter to measure.  So it=92s incredibly fast to test
> different rates and output power than having to wait for client to
> re-associate, pass traffic and adjust power meter to duty cycle (depending
> on how fancy the meter is).  This is more applicable for calibration and
> evaluation than for adaption or protocol testing.
> =

> Tx99 is better suited for calibration and FCC certification testing and n=
ot
> for testing things like adaptive modulation or what happens when mixed
> modulations are enabled.  It cuts down on lab certification test time and
> complexity (lab engineers test a different wireless widget every day and =
not
> familiar with webGUI=92s and config settings, etc).  Tx99 often was more =
=91raw=92
> and didn=92t behave the same as adaptive modulation algorithm, probably m=
ore
> so with more streams than 1 and 11b/g/n.
> =

> So having a feature that can just output raw frames at full duty cycle at=
 a
> specific rate and output power without client would be highly beneficial =
for
> lab testing and reduce test time and complexity for radio validation.

I tried to get ath10k firmware to send raw frames on a monitor interface,
but it seems it requires a peer of some sort before it will send frames,
and I had no real luck.

I'm imagine there is some way to make firmware able to do this, but I don't
know how to do that at this time.

Thanks,
Ben

-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

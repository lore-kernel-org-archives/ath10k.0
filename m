Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wvr5Y-0002j1-RP
 for ath10k@lists.infradead.org; Sat, 14 Jun 2014 16:45:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: After shutdown/restart, ath10k sometimes stops receiving packets
References: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
Date: Sat, 14 Jun 2014 19:45:29 +0300
In-Reply-To: <CAHqTa-1EDoRwSXWx4JQ_JSpF1_60B3fn=KecE4mDCrLrDJ5odw@mail.gmail.com>
 (Avery Pennarun's message of "Thu, 12 Jun 2014 19:37:12 -0400")
Message-ID: <878uoz4eza.fsf@kamboji.qca.qualcomm.com>
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

> We are experiencing a relatively-rare-but-not-rare-enough case which
> has approximately these steps:
>
> - run a wifi AP for a while with a station or two connected
> - shut down hostapd (stations all get disconnected of course)
> - restart hostapd (perhaps on another channel or with different settings)
>
> After that, an external wifi sniffer can see beacons being transmitted
> by the AP as expected, but all packets from stations trying to connect
> are ignored.  In particular, Probe requests are not answered, and Auth
> requests do not even receive a wifi ACK.
>
> Restarting hostapd doesn't fix it.  However, rmmoding and modprobing
> the ath10k_pci module does fix it.
>
> This is with a mindspeed c2k host processor, 3.2 kernel, and modules
> backported by backports from kvalo's ath-next as of
> v3.15-rc1-237-gd9bc4b9 (roughly 2014-04-29).  Firmware is
> 10.1.467.2-1.
>
> Has anyone else seen this?  Any suggestions where to look to narrow
> down the problem?
>
> I can't exactly produce it on demand yet, but if someone suggests
> things to look for when it happens, it occurs often enough that I
> should be able tor run those things.

Do you have any guesses how often this happens? Once a day, once a week?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.tohojo.dk ([77.235.48.147])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiIyU-0001qq-N2
 for ath10k@lists.infradead.org; Tue, 22 Mar 2016 09:51:43 +0000
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: [RFCv2 0/3] mac80211: implement fq codel
References: <CAA93jw5AAWua23TbQHZX47XcFLEqU6T=NpxuLqa6FiffBf91Fw@mail.gmail.com>
 <CA+BoTQ=hgkm2AwMb=kinx+Ezf3vjduCKNH4LNRcV_goDWH4_Vg@mail.gmail.com>
Date: Tue, 22 Mar 2016 10:51:12 +0100
In-Reply-To: <CA+BoTQ=hgkm2AwMb=kinx+Ezf3vjduCKNH4LNRcV_goDWH4_Vg@mail.gmail.com>
 (Michal Kazior's message of "Tue, 22 Mar 2016 09:05:32 +0100")
Message-ID: <8737rirgbz.fsf@toke.dk>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Network Development <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Dave Taht <dave.taht@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Jasmine Strong <jas@eero.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, make-wifi-fast@lists.bufferbloat.net

Michal Kazior <michal.kazior@tieto.com> writes:

> traffic-gen generates only BE traffic. Everything else runs UDP_RR
> which doesn't generate a lot of traffic.

Good point. Fixed that: the newest git version of traffic-gen supports a
-t parameter which will be set as the TOS byte on outgoing traffic
(literal; no smart diffserv handling, so you can override the ECN bits
as well).

Added support for a burst-tos test parameter in the Flent burst test
configs which will use this new parameter if set.

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

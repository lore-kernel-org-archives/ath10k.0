Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJrFN-0000Q4-Cj
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 21:47:17 +0000
Received: by mail-we0-f176.google.com with SMTP id q58so7066845wes.21
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 14:46:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ-VmonCMHb9ekiKGsNqpbjar6iWj2souUj0vRpwRkNaadQf1w@mail.gmail.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
 <87siktat4d.fsf@kamboji.qca.qualcomm.com>
 <CAJ-VmonCMHb9ekiKGsNqpbjar6iWj2souUj0vRpwRkNaadQf1w@mail.gmail.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 19 Aug 2014 17:46:35 -0400
Message-ID: <CAHqTa-0f0CtPhK6M9_oA+nahrEkP9+gqnigYQsUkfWuhLGmkhQ@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>

On Tue, Aug 19, 2014 at 11:23 AM, Adrian Chadd <adrian@freebsd.org> wrote:
> Yes. The whole point is that the firmware knows about the vdev and you
> set the channel on that. The intention is that there's multiple vdevs
> and if they're on different channels (eg STA + P2P, or STA + STA) then
> the firmware can handle channel changing, sending sleep notifications
> to the AP, buffering frames (well, pointers to frame data) so things
> don't get dropped, etc.
>
> I vaguely recall there being feature requests to do scanning in AP
> mode. It's a dirty hack, because yes you end up having packet loss
> during the scan for reasons I don't have to describe here, but you
> don't want it to be so bad that clients disassociate from you or end
> up having holes in the A-MPDU sequence space..

For my own purposes - scanning while the AP is running - the dirtiness
doesn't bother me *too* much.  Ideally I would like to request a
super-low-priority scan that only goes offchannel for short periods
but could take several (or even many) seconds to complete.  I gather
this is what the 'lowpri' option to 'iw ... scan' is for.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJlGR-0006YZ-Vo
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 15:24:00 +0000
Received: by mail-qc0-f182.google.com with SMTP id i8so6270888qcq.41
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 08:23:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87siktat4d.fsf@kamboji.qca.qualcomm.com>
References: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
 <8761hpc9j9.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1ZWg38dkT1N0fm3JkLL1kVc_pP1dsuCuorZxXm8z6M7Q@mail.gmail.com>
 <87wqa5au7q.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=Qcrrutt6ZUtbrgKzx0Mo9186SRuV7dc97FnOxwn3Jxg@mail.gmail.com>
 <87siktat4d.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 19 Aug 2014 08:23:37 -0700
Message-ID: <CAJ-VmonCMHb9ekiKGsNqpbjar6iWj2souUj0vRpwRkNaadQf1w@mail.gmail.com>
Subject: Re: Support for scan while in AP mode, and offchannel while in AP mode
From: Adrian Chadd <adrian@freebsd.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Michal Kazior <michal.kazior@tieto.com>, ath10k <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

Hi,

Yes. The whole point is that the firmware knows about the vdev and you
set the channel on that. The intention is that there's multiple vdevs
and if they're on different channels (eg STA + P2P, or STA + STA) then
the firmware can handle channel changing, sending sleep notifications
to the AP, buffering frames (well, pointers to frame data) so things
don't get dropped, etc.

I vaguely recall there being feature requests to do scanning in AP
mode. It's a dirty hack, because yes you end up having packet loss
during the scan for reasons I don't have to describe here, but you
don't want it to be so bad that clients disassociate from you or end
up having holes in the A-MPDU sequence space..


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
